import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_return_filter_event.dart';
part 'request_return_filter_state.dart';
part 'request_return_filter_bloc.freezed.dart';

class RequestReturnFilterBloc
    extends Bloc<RequestReturnFilterEvent, RequestReturnFilterState> {
  RequestReturnFilterBloc() : super(RequestReturnFilterState.initial()) {
    on<RequestReturnFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    RequestReturnFilterEvent event,
    Emitter<RequestReturnFilterState> emit,
  ) async {
    event.map(
      initialized: (value) => emit(RequestReturnFilterState.initial()),
      filterRequestReturn: (value) async {
        emit(state.copyWith(
          isSubmitting: false,
        ));
        if (state.requestReturnFilter.areFiltersValid) {
          emit(state.copyWith(
            isSubmitting: true,
          ));
        } else {
          emit(state.copyWith(
            showErrorMessages: true,
            isSubmitting: false,
          ));
        }
      },
      assignmentNumberChanged: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            assignmentNumber: SearchKey.searchFilter(value.assignmentNumber),
          ),
          showErrorMessages: false,
        ),
      ),
      batchChanged: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            batch: SearchKey.searchFilter(value.batchNumber),
          ),
          showErrorMessages: false,
        ),
      ),
      materialDescriptionSearchChanged: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            materialDescription:
                SearchKey.searchFilter(value.materialDescriptionSearch),
          ),
          showErrorMessages: false,
        ),
      ),
      materialNumberSearchChanged: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            materialNumber: SearchKey.searchFilter(value.materialNumberSearch),
          ),
          showErrorMessages: false,
        ),
      ),
      principalSearchChanged: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            principalSearch: SearchKey.searchFilter(value.principalSearch),
          ),
          showErrorMessages: false,
        ),
      ),
      setInvoiceDate: (e) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
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
