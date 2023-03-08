import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_additional_bonus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_material_bloc.freezed.dart';
part 'bonus_material_event.dart';
part 'bonus_material_state.dart';

class BonusMaterialBloc extends Bloc<BonusMaterialEvent, BonusMaterialState> {
  final IBonusMaterialRepository bonusMaterialRepository;

  BonusMaterialBloc({
    required this.bonusMaterialRepository,
  }) : super(BonusMaterialState.initial()) {
    on<BonusMaterialEvent>(_onEvent);
  }

  Future<void> _onEvent(
    BonusMaterialEvent event,
    Emitter<BonusMaterialState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(BonusMaterialState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isFetching: true,
            isStarting: false,
            searchKey: SearchKey(e.searchKey),
          ),
        );

        final failureOrSuccess = await bonusMaterialRepository.getMaterialBonus(
          user: e.user,
          configs: e.configs,
          pickAndPack: e.pickAndPack,
          salesOrganisation: e.salesOrganisation,
          searchKey: e.searchKey,
          shipInfo: e.shipInfo,
          customerInfo: e.customerInfo,
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
                failureOrSuccessOption: none(),
                bonus: bonus,
                isFetching: false,
                searchKey: SearchKey(e.searchKey),
              ),
            );
          },
        );
      },
      reset: (_Reset value) {
        emit(state.copyWith(
          bonus: <MaterialInfo>[],
          isFetching: false,
          isStarting: true,
          searchKey: SearchKey(''),
        ));
      },
    );
  }
}
