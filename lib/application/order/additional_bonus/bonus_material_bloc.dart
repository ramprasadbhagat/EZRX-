import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_additional_bonus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bonus_material_event.dart';
part 'bonus_material_state.dart';
part 'bonus_material_bloc.freezed.dart';

class BonusMaterialBloc extends Bloc<BonusMaterialEvent, BonusMaterialState> {
  final IBonusMaterialRepository bonusMaterialRepository;

  BonusMaterialBloc({
    required this.bonusMaterialRepository,
  }) : super(BonusMaterialState.initial()) {
    on<BonusMaterialEvent>(_onEvent);
    // add(
    //   BonusMaterialEvent.fetch(
    //     customerCode: '',
    //     gimmickMaterial: true,
    //     pickandpack: true,
    //     salesOrg: '',
    //     searchKey: '',
    //     shipTo: '',
    //     soldTo: '',
    //     user: User.empty(),
    //   ),
    // );
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
          ),
        );

        final failureOrSuccess = await bonusMaterialRepository.getMaterialBonus(
          user: e.user,
          configs: e.configs,
          pickandpack: e.pickandpack,
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
              ),
            );
          },
          (bonus) {
            emit(
              state.copyWith(failureOrSuccessOption: none(), bonus: bonus),
            );
          },
        );
      },
    );
  }
}
