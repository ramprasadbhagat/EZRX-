import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

import 'package:ezrxmobile/domain/account/entities/user.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/returns/repository/i_submit_request_return_repository.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

part 'submit_return_event.dart';
part 'submit_return_state.dart';
part 'submit_return_bloc.freezed.dart';

class SubmitReturnBloc extends Bloc<SubmitReturnEvent, SubmitReturnState> {
  final ISubmitRequestReturnRepository submitRequestRepository;

  SubmitReturnBloc({required this.submitRequestRepository})
      : super(SubmitReturnState.initial()) {
    on<SubmitReturnEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SubmitReturnEvent event,
    Emitter<SubmitReturnState> emit,
  ) async {
    await event.map(
      submitReturnRequest: (value) async {
        emit(
          state.copyWith(
            isSubmitting: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await submitRequestRepository.submitRequestReturn(
          customerCodeInfo: value.customerCodeInfo,
          returnItemsList: value.returnItemsList,
          returnReferenceNumber: value.returnReferenceNumber,
          salesOrg: value.salesOrg,
          specialInstructions: value.specialInstructions,
          user: value.user,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (submitReturn) {
            emit(
              state.copyWith(
                messages: submitReturn.message,
                requestID: submitReturn.requestID,
                failureOrSuccessOption: none(),
                isSubmitting: false,
              ),
            );
          },
        );
      },
    );
  }
}
