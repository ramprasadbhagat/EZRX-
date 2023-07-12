import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'view_by_request_return_filter_event.dart';
part 'view_by_request_return_filter_state.dart';
part 'view_by_request_return_filter_bloc.freezed.dart';

class ViewByRequestReturnFilterBloc extends Bloc<ViewByRequestReturnFilterEvent,
    ViewByRequestReturnFilterState> {
  ViewByRequestReturnFilterBloc()
      : super(ViewByRequestReturnFilterState.initial()) {
    on<ViewByRequestReturnFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByRequestReturnFilterEvent event,
    Emitter<ViewByRequestReturnFilterState> emit,
  ) async {
    await event.map(
      initializeOrResetFilters: (e) async => emit(
        ViewByRequestReturnFilterState.initial(),
      ),
      setReturnDate: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            returnDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.returnDateRange.start),
            ),
            returnDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.returnDateRange.end),
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
      setReturnStatus: (e) {
        final selectedStatusList = List<StatusType>.from(
          state.filter.returnStatusList,
        );
        final modifiedStatusList = e.value
            ? (selectedStatusList..add(e.status))
            : (selectedStatusList..remove(e.status));
        emit(
          state.copyWith(
            filter: state.filter.copyWith(returnStatusList: modifiedStatusList),
          ),
        );
      },
      updateFilterToLastApplied: (e) async => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
        ),
      ),
      setValidationFailure: (_) async => emit(
        state.copyWith(
          showErrorMessage: !state.filter.isReturnAmountValueRangeValid,
        ),
      ),
    );
  }
}
