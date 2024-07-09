import 'dart:async';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approver_filter_event.dart';
part 'return_approver_filter_state.dart';
part 'return_approver_filter_bloc.freezed.dart';

class ReturnApproverFilterBloc
    extends Bloc<ReturnApproverFilterEvent, ReturnApproverFilterState> {
  ReturnApproverFilterBloc() : super(ReturnApproverFilterState.initial()) {
    on<ReturnApproverFilterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ReturnApproverFilterEvent event,
    Emitter<ReturnApproverFilterState> emit,
  ) {
    event.map(
      initialized: (_Initialized e) => emit(
        ReturnApproverFilterState.initial().copyWith(
          approverReturnFilter:
              ReturnApproverFilter.empty().copyWith(sortBy: state.activeSort),
        ),
      ),
      applyFilters: (_ApplyFilters value) {
        emit(
          state.copyWith(
            isSubmitting: false,
          ),
        );
        if (state.areFiltersValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              showErrorMessages: true,
            ),
          );
        }
      },
      createdByChanged: (_CreatedByChanged e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            createdBy: SearchKey.search(e.createdBy),
          ),
          showErrorMessages: false,
        ),
      ),
      returnIdChanged: (_ReturnIdChanged e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            returnId: SearchKey.search(e.returnId),
          ),
          showErrorMessages: false,
        ),
      ),
      shipToChanged: (_ShipToChanged e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            shipTo: SearchKey.search(e.shitTo),
          ),
          showErrorMessages: false,
        ),
      ),
      soldToChanged: (_SoldToChanged e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            soldTo: SearchKey.search(e.soldTo),
          ),
          showErrorMessages: false,
        ),
      ),
      sortByChanged: (_SortByChanged e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            sortBy: e.sortBy,
          ),
        ),
      ),
      setInvoiceDate: (_SetInvoiceDate e) => emit(
        state.copyWith(
          approverReturnFilter: state.approverReturnFilter.copyWith(
            fromInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(e.invoiceDateRange.start),
            ),
            toInvoiceDate: DateTimeStringValue(
              getDateStringByDateTime(e.invoiceDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
