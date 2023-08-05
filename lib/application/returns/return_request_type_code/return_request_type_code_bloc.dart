import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_type_code_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

part 'return_request_type_code_event.dart';
part 'return_request_type_code_state.dart';
part 'return_request_type_code_bloc.freezed.dart';

class ReturnRequestTypeCodeBloc
    extends Bloc<ReturnRequestTypeCodeEvent, ReturnRequestTypeCodeState> {
  final IReturnRequestTypeCodeRepository returnRequestTypeCodeRepository;

  ReturnRequestTypeCodeBloc({required this.returnRequestTypeCodeRepository})
      : super(ReturnRequestTypeCodeState.initial()) {
    on<ReturnRequestTypeCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnRequestTypeCodeEvent event,
    Emitter<ReturnRequestTypeCodeState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ReturnRequestTypeCodeState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
            isFetching: true,
            returnRequestTypeCodeDetailsList: <ReturnRequestTypeCodeDetails>[],
          ),
        );

        final failureOrSuccess =
            await returnRequestTypeCodeRepository.getReturnRequestTypeCodeList(
          salesOrganisation: e.salesOrganisation,
        );
        failureOrSuccess.fold(
          (faliure) => emit(
            state.copyWith(
              isFetching: false,
              returnRequestTypeCodeDetailsFailureOrSuccessOption:
                  optionOf(failureOrSuccess),
            ),
          ),
          (returnRequestTypeCodeList) {
            emit(
              state.copyWith(
                returnRequestTypeCodeDetailsList: returnRequestTypeCodeList,
                isFetching: false,
                returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onChange(Change<ReturnRequestTypeCodeState> change) {
    super.onChange(change);
  }
}
