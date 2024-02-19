import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_details_by_request_repository.dart';

part 'return_details_by_request_event.dart';
part 'return_details_by_request_state.dart';
part 'return_details_by_request_bloc.freezed.dart';

class ReturnDetailsByRequestBloc
    extends Bloc<ReturnDetailsByRequestEvent, ReturnDetailsByRequestState> {
  final IReturnDetailsByRequestRepository returnDetailsByRequestRepository;
  final IReturnRequestRepository returnRequestRepository;

  ReturnDetailsByRequestBloc({
    required this.returnDetailsByRequestRepository,
    required this.returnRequestRepository,
  }) : super(ReturnDetailsByRequestState.initial()) {
    on<ReturnDetailsByRequestEvent>(_onEvent);
  }
  Future<void> _onEvent(
    ReturnDetailsByRequestEvent event,
    Emitter<ReturnDetailsByRequestState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async =>
          emit(ReturnDetailsByRequestState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final returnInformationFailureOrSuccess =
            await returnDetailsByRequestRepository
                .getReturnSummaryDetailsByRequest(
          returnRequestId: ReturnRequestsId(requestId: e.returnId),
        );
        await returnInformationFailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption:
                  optionOf(returnInformationFailureOrSuccess),
            ),
          ),
          (returnSummaryDetailsByRequest) {
            emit(
              state.copyWith(
                requestInformation:
                    returnSummaryDetailsByRequest.returnRequestInformationList,
                requestInformationHeader:
                    returnSummaryDetailsByRequest.requestInformationHeader,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      downloadFile: (_DownloadFile e) async {
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
          (_) async => emit(
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
