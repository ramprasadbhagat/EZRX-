import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_details_event.dart';
part 'return_summary_details_state.dart';
part 'return_summary_details_bloc.freezed.dart';

class ReturnSummaryDetailsBloc
    extends Bloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState> {
  final IReturnSummaryDetailsRepository returnSummaryDetailsRepository;
  final IReturnRequestRepository returnRequestRepository;
  ReturnSummaryDetailsBloc({
    required this.returnSummaryDetailsRepository,
    required this.returnRequestRepository,
  }) : super(ReturnSummaryDetailsState.initial()) {
    on<ReturnSummaryDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnSummaryDetailsEvent event,
    Emitter<ReturnSummaryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ReturnSummaryDetailsState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
            downloadFailureOrSuccessOption: none(),
          ),
        );

        final returnInformationFailureOrSuccess =
            await returnSummaryDetailsRepository.getReturnInformation(
          returnRequestId: e.returnId,
        );
        await returnInformationFailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption:
                  optionOf(returnInformationFailureOrSuccess),
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
      downloadFile: (e) async {
        emit(
          state.copyWith(
            downloadFailureOrSuccessOption: none(),
            downloadedAttachment: ReturnRequestAttachment.empty(),
            downloadingAttachments: [...state.downloadingAttachments, e.file],
          ),
        );

        final failureOrSuccessPermission =
            await returnRequestRepository.getDownloadPermission();

        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              downloadedAttachment: e.file,
              downloadingAttachments: [...state.downloadingAttachments]
                ..remove(e.file),
              downloadFailureOrSuccessOption:
                  optionOf(failureOrSuccessPermission),
            ),
          ),
          (success) async {
            final failureOrSuccess = await returnRequestRepository.downloadFile(
              file: e.file,
            );

            emit(
              state.copyWith(
                downloadedAttachment: e.file,
                downloadingAttachments: [...state.downloadingAttachments]
                  ..remove(e.file),
                downloadFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}
