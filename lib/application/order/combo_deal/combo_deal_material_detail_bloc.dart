import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_material_detail_event.dart';
part 'combo_deal_material_detail_state.dart';
part 'combo_deal_material_detail_bloc.freezed.dart';

class ComboDealMaterialDetailBloc
    extends Bloc<ComboDealMaterialDetailEvent, ComboDealMaterialDetailState> {
  ComboDealMaterialDetailBloc()
      : super(ComboDealMaterialDetailState.initial()) {
    on<ComboDealMaterialDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealMaterialDetailEvent event,
    Emitter<ComboDealMaterialDetailState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(ComboDealMaterialDetailState.initial()),
      initComboDealItems: (e) async {
        emit(
          state.copyWith(
            items: {
              for (final item in e.items)
                item.getMaterialNumber: item.copyWith(
                  salesOrgConfig: e.salesConfigs,
                ),
            },
            selectedItems: {
              for (final item in e.items) item.getMaterialNumber: true,
            },
            isFetchingComboInfo: true,
            isFetchingPrice: true,
          ),
        );
      },
      initFromCartComboDealItems: (e) async {
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
                  .copyWithComboDeal(comboDeal),
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
      setComboDealInfo: (e) async {
        final itemsWithComboDealInfo = state.items.map(
          (key, value) => MapEntry(
            key,
            value.copyWithComboDeal(e.comboDealInfo),
          ),
        );

        emit(
          state.copyWith(
            isFetchingComboInfo: false,
            items: itemsWithComboDealInfo,
            selectedItems: {
              for (final item in itemsWithComboDealInfo.values)
                item.getMaterialNumber: item.selfComboDeal.mandatory,
            },
          ),
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
      updateItemQuantity: (e) async {
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
      updateItemSelection: (e) async {
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
}
