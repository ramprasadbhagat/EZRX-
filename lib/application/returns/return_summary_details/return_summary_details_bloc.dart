import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_details_event.dart';
part 'return_summary_details_state.dart';
part 'return_summary_details_bloc.freezed.dart';

class ReturnSummaryDetailsBloc
    extends Bloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState> {
  final IReturnSummaryDetailsRepository returnSummaryDetailsRepository;
  ReturnSummaryDetailsBloc({
    required this.returnSummaryDetailsRepository,
  }) : super(ReturnSummaryDetailsState.initial()) {
    on<ReturnSummaryDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnSummaryDetailsEvent event,
    Emitter<ReturnSummaryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async =>
          emit(ReturnSummaryDetailsState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final returnInformationfailureOrSuccess =
            await returnSummaryDetailsRepository.getReturnInformation(
          returnRequestId: ReturnRequestsId(requestId: e.returnId),
          invoiceId: e.invoiceId,
        );
        await returnInformationfailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption:
                  optionOf(returnInformationfailureOrSuccess),
            ),
          ),
          (returnSummaryDetails) {
            emit(
              state.copyWith(
                requestInformation: returnSummaryDetails
                        .returnRequestInformationList.isNotEmpty
                    ? returnSummaryDetails.returnRequestInformationList.first
                    : ReturnRequestInformation.empty(),
                requestInformationHeader:
                    returnSummaryDetails.requestInformationHeader,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
