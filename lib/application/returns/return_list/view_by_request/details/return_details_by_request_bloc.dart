import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_details_by_request_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_details_by_request_event.dart';
part 'return_details_by_request_state.dart';
part 'return_details_by_request_bloc.freezed.dart';

class ReturnDetailsByRequestBloc
    extends Bloc<ReturnDetailsByRequestEvent, ReturnDetailsByRequestState> {
  final IReturnDetailsByRequestRepository returnDetailsByRequestRepository;
  ReturnDetailsByRequestBloc({
    required this.returnDetailsByRequestRepository,
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

        final returnInformationfailureOrSuccess =
            await returnDetailsByRequestRepository
                .getReturnSummaryDetailsByRequest(
          returnRequestId: ReturnRequestsId(requestId: e.returnId),
        );
        await returnInformationfailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption:
                  optionOf(returnInformationfailureOrSuccess),
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
    );
  }
}
