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
import 'package:rxdart/rxdart.dart';

part 'bonus_material_bloc.freezed.dart';
part 'bonus_material_event.dart';
part 'bonus_material_state.dart';

class BonusMaterialBloc extends Bloc<BonusMaterialEvent, BonusMaterialState> {
  final IBonusMaterialRepository bonusMaterialRepository;

  BonusMaterialBloc({
    required this.bonusMaterialRepository,
  }) : super(BonusMaterialState.initial()) {
    on<_Initialized>(
      (e, emit) async {
        emit(BonusMaterialState.initial());
      },
    );
    on<_Fetch>(
      (e, emit) async {
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
    );
    on<_AutoSearch>(
      (e, emit) async {
        if (e.searchKey != state.searchKey.getValue()) {
          add(
            _Fetch(
              user: e.user,
              salesOrganisation: e.salesOrganisation,
              configs: e.configs,
              pickAndPack: e.pickAndPack,
              customerInfo: e.customerInfo,
              shipInfo: e.shipInfo,
              searchKey: e.searchKey,
            ),
          );
        }
      },
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 3000))
            .asyncExpand(mapper);
      },
    );
  }
}
