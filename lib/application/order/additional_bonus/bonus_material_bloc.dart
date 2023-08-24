import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';

import 'package:ezrxmobile/domain/order/entities/principal_data.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

part 'bonus_material_bloc.freezed.dart';
part 'bonus_material_event.dart';
part 'bonus_material_state.dart';

const _pageSize = 24;

class BonusMaterialBloc extends Bloc<BonusMaterialEvent, BonusMaterialState> {
  final IMaterialListRepository materialListRepository;

  BonusMaterialBloc({
    required this.materialListRepository,
  }) : super(BonusMaterialState.initial()) {
    on<BonusMaterialEvent>(_onEvent);
  }

  Future<void> _onEvent(
    BonusMaterialEvent event,
    Emitter<BonusMaterialState> emit,
  ) async {
    await event.map(
      fetch: (e) async {
        emit(
          BonusMaterialState.initial().copyWith(isFetching: true),
        );

        final failureOrSuccess =
            await materialListRepository.getMaterialBonusList(
          customerCodeInfo: e.customerCodeInfo,
          offset: 0,
          pageSize: _pageSize,
          salesOrgConfig: e.configs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          principalData: e.principalData,
          user: e.user,
          enableGimmickMaterial: e.isGimmickMaterialEnabled,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (bonus) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                bonusItemList: bonus.products,
                isFetching: false,
              ),
            );
          },
        );
      },
      loadMoreBonusItem: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        final failureOrSuccess =
            await materialListRepository.getMaterialBonusList(
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: _pageSize,
          offset: state.bonusItemList.length,
          principalData: e.principalData,
          user: e.user,
          enableGimmickMaterial: e.isGimmickMaterialEnabled,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (bonusItems) {
            emit(
              state.copyWith(
                bonusItemList: List<MaterialInfo>.from(state.bonusItemList)
                  ..addAll(bonusItems.products),
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: bonusItems.products.length >= _pageSize,
              ),
            );
          },
        );
      },
      validateBonusQuantity: (e) {
        emit(
          state.copyWith(
            isBonusQtyValidated: false,
          ),
        );

        emit(
          state.copyWith(
            isBonusQtyValidated: e.bonusMaterial.quantity > 0,
            bonusMaterialHashCode: e.bonusMaterial.hashCode,
          ),
        );
      },
      updateBonusItemQuantity: (e) {
        final updatedBonusItemList = state.bonusItemList
            .map(
              (element) =>
                  element.materialNumber == e.updatedBonusItem.materialNumber
                      ? element.copyWith(quantity: e.updatedBonusItem.quantity)
                      : element,
            )
            .toList();
        emit(
          state.copyWith(
            bonusItemList: updatedBonusItemList,
          ),
        );
      },
    );
  }
}
