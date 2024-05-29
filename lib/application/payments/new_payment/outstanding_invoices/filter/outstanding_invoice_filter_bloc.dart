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
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.documentDate(),
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
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.dueDate(),
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
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: RangeValue(e.amountFrom),
            amountValueTo: state.filter.amountValueTo,
          ),
          showErrorMessage: false,
        ),
      ),
      setAmountTo: (e) async => emit(
        state.copyWith(
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: state.filter.amountValueFrom,
            amountValueTo: RangeValue(e.amountTo),
          ),
          showErrorMessage: false,
        ),
      ),
      setOutstandingInvoiceStatus: (e) {
        final selectedStatus = e.value ? e.status : StatusType('');
        emit(
          state.copyWith(
            filter: OutstandingInvoiceFilter.empty().copyWith(
              outstandingInvoiceStatus: selectedStatus,
              filterOption: FilterOption.status(),
            ),
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
          filter: OutstandingInvoiceFilter.defaultFilter(),
        ),
      ),
    );
  }
}
