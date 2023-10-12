import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_material_detail_event.dart';
part 'combo_deal_material_detail_state.dart';
part 'combo_deal_material_detail_bloc.freezed.dart';

class ComboDealMaterialDetailBloc
    extends Bloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState> {
  final IProductDetailRepository productDetailRepository;

  ComboDealMaterialDetailBloc(this.productDetailRepository)
      : super(ComboDealMaterialDetailState.initial()) {
    on<ComboDealMaterialDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealMaterialDetailEvent event,
    Emitter<ComboDealMaterialDetailState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(
        ComboDealMaterialDetailState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        ),
      ),
      initFromCartComboDealItems: (e) {
        final items = {
          for (final item in e.items)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: e.salesConfigs,
            ),
        };

        final selectedItems = {
          for (final item in e.items) item.getMaterialNumber: true,
        };

        final comboDeal = e.items.firstComboDeal;
        final missingComboItemMaterialNumbers = comboDeal.allMaterialNumbers
            .where(
              (materialNumber) =>
                  !e.items.materialNumbers.contains(materialNumber),
            )
            .toList();

        items.addAll(
          {
            for (final materialNumber in missingComboItemMaterialNumbers)
              materialNumber: PriceAggregate.empty()
                  .copyWith(
                    salesOrgConfig: e.salesConfigs,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: materialNumber,
                    ),
                  )
                  .copyWithComboDealMinQty(comboDeal),
          },
        );

        selectedItems.addAll(
          {
            for (final materialNumber in missingComboItemMaterialNumbers)
              materialNumber: false,
          },
        );

        emit(
          state.copyWith(
            items: items,
            selectedItems: selectedItems,
            isFetchingComboInfo: false,
            isFetchingPrice: true,
          ),
        );
      },
      setPriceInfo: (e) {
        final itemsWithPriceInfo =
            Map<MaterialNumber, PriceAggregate>.from(state.items);

        e.priceMap.forEach(
          (key, value) {
            if (itemsWithPriceInfo[key] != null) {
              itemsWithPriceInfo[key] = itemsWithPriceInfo[key]!.copyWith(
                price: value.price,
              );
            }
          },
        );
        emit(
          state.copyWith(
            isFetchingPrice: false,
            items: itemsWithPriceInfo,
          ),
        );
      },
      updateItemQuantity: (e) {
        final items = Map<MaterialNumber, PriceAggregate>.from(state.items);
        if (items[e.item] != null) {
          items[e.item] = items[e.item]!.copyWith(quantity: e.qty);
        }

        emit(
          state.copyWith(
            items: items,
          ),
        );
      },
      updateItemSelection: (e) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
          ),
        );
        final selectionStatus =
            Map<MaterialNumber, bool>.from(state.selectedItems);

        selectionStatus[e.item] = !(selectionStatus[e.item] ?? false);

        switch (state.currentDeal.scheme) {
          case ComboDealScheme.k1:
            final selectAllItems =
                selectionStatus.entries.every((element) => element.value);

            if (selectAllItems) {
              emit(
                state.copyWith(
                  selectedItems: selectionStatus,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(
                    const Left(
                      ApiFailure.other(
                        'All items in this combo are mandatory.',
                      ),
                    ),
                  ),
                ),
              );
            }
            break;
          case ComboDealScheme.k2:
          case ComboDealScheme.k3:
          case ComboDealScheme.k4:
          case ComboDealScheme.k5:
          case ComboDealScheme.kWithSuffix:
            emit(
              state.copyWith(
                selectedItems: selectionStatus,
              ),
            );
            break;
        }
      },
      fetchComboDealDetail: (e) async {
        final items = e.comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] =
                PriceAggregate.empty().copyWith(salesOrgConfig: e.salesConfigs);

            return map;
          },
        );

        emit(
          state.copyWith(
            items: items,
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            searchKey: SearchKey.search(''),
          ),
        );

        final failureOrSuccess =
            await productDetailRepository.getProductListDetail(
          customerCodeInfo: state.customerCodeInfo,
          locale: e.locale,
          materialNumber: e.comboDeal.allMaterialNumbers,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          types: e.comboDeal.allMaterials
              .map((e) => MaterialInfoType('material'))
              .toList(),
        );

        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isFetchingComboInfo: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (materialsInfo) {
            for (final materialInfo in materialsInfo) {
              if (items[materialInfo.materialNumber] != null) {
                items[materialInfo.materialNumber] =
                    items[materialInfo.materialNumber]!
                        .copyWith(
                          materialInfo: materialInfo.copyWith(
                            parentID:
                                e.parentMaterialNumber.getOrDefaultValue(''),
                          ),
                        )
                        .copyWithComboDealMinQty(e.comboDeal);
              }
            }
          },
        );

        final failureOrSuccessStockList =
            await productDetailRepository.getStockInfoList(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          materials: state.allMaterialsInfo,
        );

        await failureOrSuccessStockList.fold(
          (failure) async => emit(
            state.copyWith(
              isFetchingComboInfo: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (materialsInfo) {
            for (final materialInfo in materialsInfo) {
              final material = items[materialInfo.materialNumber];

              if (material != null && materialInfo.stockInfos.isNotEmpty) {
                items[materialInfo.materialNumber] = material
                    .copyWith(
                      stockInfo: materialInfo.stockInfos.first,
                      stockInfoList: materialInfo.stockInfos,
                    )
                    .copyWithComboDealMinQty(e.comboDeal);
              }
            }
          },
        );

        final selectedItems = <MaterialNumber, bool>{};

        selectedItems.addAll(
          {
            for (final item in items.values)
              item.getMaterialNumber: item.selfComboDeal.mandatory,
          },
        );
        emit(
          state.copyWith(
            items: items,
            selectedItems: selectedItems,
            isFetchingComboInfo: false,
          ),
        );
      },
      clearSearch: (_) {
        emit(
          state.copyWith(
            searchKey: SearchKey.search(''),
          ),
        );
      },
      search: (e) {
        emit(
          state.copyWith(
            searchKey: e.searchKey,
          ),
        );
      },
    );
  }
}
