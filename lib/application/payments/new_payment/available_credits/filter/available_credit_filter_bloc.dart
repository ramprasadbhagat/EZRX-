import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'available_credit_filter_event.dart';
part 'available_credit_filter_state.dart';
part 'available_credit_filter_bloc.freezed.dart';

class AvailableCreditFilterBloc
    extends Bloc<AvailableCreditFilterEvent, AvailableCreditFilterState> {
  AvailableCreditFilterBloc() : super(AvailableCreditFilterState.initial()) {
    on<AvailableCreditFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AvailableCreditFilterEvent event,
    Emitter<AvailableCreditFilterState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(
        AvailableCreditFilterState.initial(),
      ),
      setDocumentDate: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.end),
            ),
          ),
        ),
      ),
      setAmountFrom: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            amountValueFrom: RangeValue(e.amountFrom),
          ),
        ),
      ),
      setAmountTo: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            amountValueTo: RangeValue(e.amountTo),
          ),
        ),
      ),
      setValidationFailure: (_) async => emit(
        state.copyWith(
          showErrorMessage:
              !state.filter.isAvailableCreditAmountValueRangeValid,
        ),
      ),
      updateFilterToLastApplied: (e) async => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
          showErrorMessage: false,
        ),
      ),
      resetFilters: (e) async => emit(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.dateRangeEmpty(),
        ),
      ),
    );
  }
}
