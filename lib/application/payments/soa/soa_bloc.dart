import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_soa_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_event.dart';
part 'soa_state.dart';
part 'soa_bloc.freezed.dart';

class SoaBloc extends Bloc<SoaEvent, SoaState> {
  final ISoaRepository repository;
  SoaBloc({required this.repository}) : super(SoaState.initial()) {
    on<SoaEvent>(_onEvent);
  }

  Future<void> _onEvent(SoaEvent event, Emitter<SoaState> emit) async {
    await event.map(
      initialized: (_) async => emit(SoaState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            soaList: <Soa>[],
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.fetchSoa(
          customerCodeInfo: e.customerCodeInfo,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (soaList) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isFetching: false,
              soaList: soaList,
              appliedFilter: SoaFilter(
                fromDate: soaList.isNotEmpty
                    ? soaList.last.soaData.date
                    : SoaFilter.empty().fromDate,
                toDate: soaList.isNotEmpty
                    ? soaList.first.soaData.date
                    : SoaFilter.empty().toDate,
              ),
            ),
          ),
        );
      },
      updateFilter: (_UpdateFilter e) async => emit(
        state.copyWith(
          appliedFilter: e.soaFilter,
        ),
      ),
    );
  }
}
