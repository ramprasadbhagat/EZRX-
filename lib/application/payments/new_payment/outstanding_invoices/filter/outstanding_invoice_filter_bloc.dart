import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'outstanding_invoice_filter_event.dart';
part 'outstanding_invoice_filter_state.dart';
part 'outstanding_invoice_filter_bloc.freezed.dart';

class OutstandingInvoiceFilterBloc
    extends Bloc<OutstandingInvoiceFilterEvent, OutstandingInvoiceFilterState> {
  OutstandingInvoiceFilterBloc()
      : super(OutstandingInvoiceFilterState.initial()) {
    on<OutstandingInvoiceFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OutstandingInvoiceFilterEvent event,
    Emitter<OutstandingInvoiceFilterState> emit,
  ) async {
    await event.map(
      initialize: (e) async => emit(
        OutstandingInvoiceFilterState.initial(),
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
      setDueDate: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dueDateRange.start),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dueDateRange.end),
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
      setOutstandingInvoiceStatus: (e) {
        final selectedStatus = e.value ? e.status : StatusType('');
        emit(
          state.copyWith(
            filter:
                state.filter.copyWith(outstandingInvoiceStatus: selectedStatus),
          ),
        );
      },
      setValidationFailure: (_) async => emit(
        state.copyWith(
          showErrorMessage:
              !state.filter.isOutstandingInvoiceAmountValueRangeValid,
        ),
      ),
      updateFilterToLastApplied: (e) async => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
          showErrorMessage: false,
        ),
      ),
      resetFilters: (e) async => emit(
        OutstandingInvoiceFilterState.initial().copyWith(
          filter: OutstandingInvoiceFilter.dateRangeEmpty(),
        ),
      ),
    );
  }
}
