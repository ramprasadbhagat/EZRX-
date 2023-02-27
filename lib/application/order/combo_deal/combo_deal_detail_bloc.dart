import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_deal_detail_event.dart';
part 'combo_deal_detail_state.dart';
part 'combo_deal_detail_bloc.freezed.dart';

class ComboDealDetailBloc
    extends Bloc<ComboDealDetailEvent, ComboDealDetailState> {
  ComboDealDetailBloc() : super(ComboDealDetailState.initial()) {
    on<ComboDealDetailEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ComboDealDetailEvent event,
    Emitter<ComboDealDetailState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(ComboDealDetailState.initial()),
      initMaterialItems: (e) async {
        emit(
          state.copyWith(
            items: {
              for (final item in e.items) item.getMaterialNumber: item,
            },
            selectedItems: {
              for (final item in e.items) item.getMaterialNumber: true,
            },
            isFetchingComboInfo: e.requireFetchInfo,
            isFetchingPrice: e.requireFetchInfo,
          ),
        );
      },
      setComboDealInfo: (e) async {
        final itemsWithComboDealInfo = state.items.map(
          (key, value) {
            final materialWithDeal = value.copyWith(
              comboDeal: e.comboDealInfo,
            );
            final materialWithMinDealQty = materialWithDeal.copyWith(
              quantity: materialWithDeal.selfComboDeal.minQty,
            );

            return MapEntry(
              key,
              materialWithMinDealQty,
            );
          },
        );

        emit(
          state.copyWith(
            isFetchingComboInfo: false,
            items: itemsWithComboDealInfo,
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
            key == e.item
                ? value.copyWith(
                    quantity: e.qty,
                  )
                : value,
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
