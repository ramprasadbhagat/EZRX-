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

class ComboDealPrincipleDetailBloc
    extends Bloc<ComboDealPrincipleDetailEvent, ComboDealPrincipleDetailState> {
  final IMaterialListRepository repository;

  ComboDealPrincipleDetailBloc({
    required this.repository,
  }) : super(ComboDealPrincipleDetailState.initial()) {
    on<_Fetch>(
      (e, emit) async {
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
          pageSize: 10,
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
            emit(
              state.copyWith(
                isFetchingMaterials: false,
                isFetchingComboInfo: true,
                isFetchingPrice: true,
                items: materialList
                    .map(
                      (material) => PriceAggregate.empty().copyWith(
                        materialInfo: material,
                        salesOrgConfig: e.salesConfigs,
                      ),
                    )
                    .toList()
                    .mapByMaterialNumber,
              ),
            );
          },
        );
      },
    );
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
          value.copyWithComboDeal(e.comboDealInfo),
        ),
      );

      emit(
        state.copyWith(
          isFetchingComboInfo: false,
          items: itemsWithComboDealInfo,
          selectedItems: {
            for (final item in itemsWithComboDealInfo.values)
              item.getMaterialNumber: false,
          },
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
}
