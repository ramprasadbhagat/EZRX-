import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_principle_detail_event.dart';
part 'combo_deal_principle_detail_state.dart';
part 'combo_deal_principle_detail_bloc.freezed.dart';

class ComboDealPrincipleDetailBloc
    extends Bloc<ComboDealPrincipleDetailEvent, ComboDealPrincipleDetailState> {
  final IMaterialListRepository repository;
  final Config config;
  ComboDealPrincipleDetailBloc({
    required this.repository,
    required this.config,
  }) : super(ComboDealPrincipleDetailState.initial()) {
    on<ComboDealPrincipleDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealPrincipleDetailEvent event,
    Emitter<ComboDealPrincipleDetailState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(ComboDealPrincipleDetailState.initial()),
      initFromCart: (e) {
        emit(
          state.copyWith(
            items: Map.from(state.items)..addAll(e.items.mapByMaterialNumber),
            selectedItems: Map.from(state.selectedItems)
              ..addAll(
                {
                  for (final item in e.items) item.getMaterialNumber: true,
                },
              ),
          ),
        );
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetchingMaterials: true,
          ),
        );
        final failureOrSuccess = await repository.getComboDealMaterials(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: config.pageSize,
          offset: 0,
          principles: e.principles,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingMaterials: false,
              ),
            );
          },
          (materialList) {
            final newItems = <MaterialNumber, PriceAggregate>{};
            if (e.fetchFromCart) {
              newItems
                ..addAll(state.items)
                ..addAll(
                  _newItemsFromMaterialList(
                    materialList: materialList,
                    salesConfigs: e.salesConfigs,
                  ),
                );
            } else {
              newItems.addAll(
                _itemFromMaterialList(
                  materialList: materialList,
                  salesConfigs: e.salesConfigs,
                ),
              );
            }
            emit(
              state.copyWith(
                isFetchingMaterials: false,
                isFetchingComboInfo: true,
                isFetchingPrice: true,
                canLoadMore: materialList.length >= config.pageSize,
                itemPageNumber: 1,
                items: newItems,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetchingMaterials: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getComboDealMaterials(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: config.pageSize,
          offset: state.itemPageNumber * config.pageSize,
          principles: e.principles,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetchingMaterials: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (materialList) {
            emit(
              state.copyWith(
                isFetchingMaterials: false,
                isFetchingComboInfo: true,
                isFetchingPrice: true,
                canLoadMore: materialList.length >= config.pageSize,
                itemPageNumber: state.itemPageNumber + 1,
                items: Map.from(state.items)
                  ..addAll(
                    _newItemsFromMaterialList(
                      materialList: materialList,
                      salesConfigs: e.salesConfigs,
                    ),
                  ),
              ),
            );
          },
        );
      },
      setPriceInfo: (e) async {
        final itemsWithPriceInfo = state.items.map(
          (key, value) {
            final defaultMaterialInfo = MaterialInfo.empty().copyWith(
              materialNumber: key,
            );
            final defaultPrice = Price.empty().copyWith(
              materialNumber: key,
            );

            return MapEntry(
              key,
              value.copyWith(
                materialInfo: e.priceMap[key]?.info ?? defaultMaterialInfo,
                price: (e.priceMap[key]?.price ?? defaultPrice).copyWith(
                  comboDeal: e.comboDeal,
                ),
              ),
            );
          },
        );

        emit(
          state.copyWith(
            isFetchingPrice: false,
            items: itemsWithPriceInfo,
          ),
        );
      },
      setComboDealInfo: (e) {
        final itemsWithComboDealInfo = state.items.map(
          (key, value) => MapEntry(
            key,
            value.copyWith(comboDeal: e.comboDealInfo),
          ),
        );

        emit(
          state.copyWith(
            isFetchingComboInfo: false,
            items: itemsWithComboDealInfo,
          ),
        );
      },
      updateItemQuantity: (e) {
        final updatedItems = state.items.map(
          (key, value) => MapEntry(
            key,
            key == e.item ? value.copyWith(quantity: e.qty) : value,
          ),
        );

        emit(
          state.copyWith(
            items: updatedItems,
          ),
        );
      },
      updateItemSelection: (e) {
        final selectionStatus =
            Map<MaterialNumber, bool>.from(state.selectedItems);
        selectionStatus[e.item] = !(selectionStatus[e.item] ?? false);

        emit(
          state.copyWith(
            selectedItems: selectionStatus,
          ),
        );
      },
    );
  }

  Map<MaterialNumber, PriceAggregate> _newItemsFromMaterialList({
    required List<MaterialInfo> materialList,
    required SalesOrganisationConfigs salesConfigs,
  }) {
    final newItems = _itemFromMaterialList(
      materialList: materialList,
      salesConfigs: salesConfigs,
    );

    newItems.removeWhere((key, value) => state.items.containsKey(key));

    return newItems;
  }

  Map<MaterialNumber, PriceAggregate> _itemFromMaterialList({
    required List<MaterialInfo> materialList,
    required SalesOrganisationConfigs salesConfigs,
  }) =>
      materialList
          .map(
            (material) => PriceAggregate.empty().copyWith(
              materialInfo: material,
              salesOrgConfig: salesConfigs,
            ),
          )
          .toList()
          .mapByMaterialNumber;
}
