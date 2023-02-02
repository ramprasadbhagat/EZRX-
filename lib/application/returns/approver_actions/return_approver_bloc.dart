import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_approver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approver_event.dart';
part 'return_approver_state.dart';
part 'return_approver_bloc.freezed.dart';

class ReturnApproverBloc
    extends Bloc<ReturnApproverEvent, ReturnApproverState> {
  final IReturnApproverRepository returnApproverRepository;
  ReturnApproverBloc({
    required this.returnApproverRepository,
  }) : super(ReturnApproverState.initial()) {
    on<ReturnApproverEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ReturnApproverEvent event,
    Emitter<ReturnApproverState> emit,
  ) async {
    await event.map(
      initialized: (_initialized e) async =>
          emit(ReturnApproverState.initial()),
      fetch: (_fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final returnIdsfailureOrSuccess =
            await returnApproverRepository.getReturnRequests(
          user: e.user,
          page: state.page,
        );
        await returnIdsfailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(returnIdsfailureOrSuccess),
            ),
          ),
          (approverReturnRequestIdList) async {
            final returnInformationfailureOrSuccess =
                await returnApproverRepository.getReturnInformation(
              returnRequestIds: approverReturnRequestIdList,
            );

            await returnInformationfailureOrSuccess.fold(
              (failure) async => emit(
                state.copyWith(
                  isFetching: false,
                  failureOrSuccessOption:
                      optionOf(returnInformationfailureOrSuccess),
                ),
              ),
              (approverReturnRequestInformationList) {
                emit(
                  state.copyWith(
                    isFetching: false,
                    page: state.page + 1,
                    approverReturnRequests:
                        List.from(state.approverReturnRequests)
                          ..addAll(approverReturnRequestInformationList),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
