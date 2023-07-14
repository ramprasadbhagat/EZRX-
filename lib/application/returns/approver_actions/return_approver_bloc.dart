import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_approver_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approver_event.dart';
part 'return_approver_state.dart';
part 'return_approver_bloc.freezed.dart';

const int _pageSize = 20;

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
      initialized: (_Initialized e) async =>
          emit(ReturnApproverState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            approverReturnRequestList: <RequestInformation>[],
            nextPageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );
        final returnIdsfailureOrSuccess =
            await returnApproverRepository.getReturnRequests(
          user: e.user,
          offset: 0,
          pageSize: _pageSize,
          approverReturnFilter: e.approverReturnFilter,
        );
        await returnIdsfailureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(returnIdsfailureOrSuccess),
              isFetching: false,
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
                    approverReturnRequestList:
                        approverReturnRequestInformationList,
                    failureOrSuccessOption: none(),
                    canLoadMore: approverReturnRequestInformationList.length >=
                        _pageSize,
                    nextPageIndex: 1,
                  ),
                );
              },
            );
          },
        );
      },
      loadMore: (_LoadMore e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final returnIdsfailureOrSuccess =
            await returnApproverRepository.getReturnRequests(
          user: e.user,
          offset: state.approverReturnRequestList.length,
          pageSize: _pageSize,
          approverReturnFilter: e.approverReturnFilter,
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
                    approverReturnRequestList: List<RequestInformation>.from(
                      state.approverReturnRequestList,
                    )..addAll(approverReturnRequestInformationList),
                    failureOrSuccessOption: none(),
                    canLoadMore: approverReturnRequestInformationList.length >=
                        _pageSize,
                    nextPageIndex: state.nextPageIndex + 1,
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
