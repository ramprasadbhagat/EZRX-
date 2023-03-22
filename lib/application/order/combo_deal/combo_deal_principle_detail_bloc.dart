import 'package:dartz/dartz.dart';
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

const int _defaultPageSize = 10;

class ComboDealPrincipleDetailBloc
    extends Bloc<ComboDealPrincipleDetailEvent, ComboDealPrincipleDetailState> {
  final IMaterialListRepository repository;

  ComboDealPrincipleDetailBloc({
    required this.repository,
  }) : super(ComboDealPrincipleDetailState.initial()) {
    on<_InitFromCart>((e, emit) async {
      emit(
        state.copyWith(
          items: Map.from(state.items)..addAll(e.items.mapByMaterialNumber),
          selectedItems: Map.from(state.items)
            ..addAll(
              {
                for (final item in e.items) item.getMaterialNumber: true,
              },
            ),
        ),
      );
    });
    on<_Fetch>((e, emit) async {
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
        pageSize: _defaultPageSize,
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
              canLoadMore: materialList.length >= _defaultPageSize,
              itemPageNumber: 1,
              items: newItems,
            ),
          );
        },
      );
    });
    on<_LoadMore>((e, emit) async {
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
        pageSize: _defaultPageSize,
        offset: state.itemPageNumber * _defaultPageSize,
        principles: e.principles,
      );

      await failureOrSuccess.fold(
        (failure) async {
          emit(
            state.copyWith(
              isFetchingMaterials: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        (materialList) async {
          emit(
            state.copyWith(
              isFetchingMaterials: false,
              isFetchingComboInfo: true,
              isFetchingPrice: true,
              canLoadMore: materialList.length >= _defaultPageSize,
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
    });
    on<_SetPriceInfo>((e, emit) {
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
    });
    on<_SetComboDealInfo>((e, emit) {
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
    });
    on<_UpdateItemQuantity>((e, emit) {
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
    });
    on<_UpdateItemSelection>((e, emit) {
      final selectionStatus =
          Map<MaterialNumber, bool>.from(state.selectedItems);
      selectionStatus[e.item] = !(selectionStatus[e.item] ?? false);

      emit(
        state.copyWith(
          selectedItems: selectionStatus,
        ),
      );
    });
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
