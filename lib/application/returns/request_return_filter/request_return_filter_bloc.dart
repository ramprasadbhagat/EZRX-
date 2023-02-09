import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_return_filter_event.dart';
part 'request_return_filter_state.dart';
part 'request_return_filter_bloc.freezed.dart';

class RequestReturnFilterBloc
    extends Bloc<RequestReturnFilterEvent, RequestReturnFilterState> {
  RequestReturnFilterBloc() : super(RequestReturnFilterState.initial()) {
    on(_onEvent);
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
        if (state.requestReturnFilter.assignmentNumber.isValid() &&
            state.requestReturnFilter.batch.isValid() &&
            state.requestReturnFilter.principalSearch.isValid() &&
            state.requestReturnFilter.materialDescription.isValid() &&
            state.requestReturnFilter.materialNumber.isValid() &&
            _doDateValidation(
              state.requestReturnFilter.fromInvoiceDate,
              state.requestReturnFilter.toInvoiceDate,
            )) {
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
      setInvoiceToDate: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            toInvoiceDate: value.toInvoiceDate,
          ),
          showErrorMessages: false,
        ),
      ),
      setInvoicefromDate: (value) => emit(
        state.copyWith(
          requestReturnFilter: state.requestReturnFilter.copyWith(
            fromInvoiceDate: value.fromInvoiceDate,
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }

  bool _doDateValidation(DateTime? fromDate, DateTime? toDate) {
    if (fromDate == null && toDate == null) return true;
    if ((fromDate == null && toDate != null) ||
        (fromDate != null && toDate == null)) return false;

    return (toDate != null &&
            toDate.isBefore(DateTime.now().add(const Duration(
              days: 1,
            ))))
        ? (fromDate != null &&
                (fromDate.isBefore(toDate) ||
                    fromDate.isAtSameMomentAs(toDate)))
            ? true
            : false
        : false;
  }
}
