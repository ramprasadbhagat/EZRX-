import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_event.dart';
part 'return_summary_state.dart';
part 'return_summary_bloc.freezed.dart';

const int _pageSize = 10;

class ReturnSummaryBloc extends Bloc<ReturnSummaryEvent, ReturnSummaryState> {
  final IReturnSummaryRepository returnSummaryRepository;

  ReturnSummaryBloc({required this.returnSummaryRepository})
      : super(ReturnSummaryState.initial()) {
    on<ReturnSummaryEvent>(_onEvent);
  }
  Future<void> _onEvent(
    ReturnSummaryEvent event,
    Emitter<ReturnSummaryState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ReturnSummaryState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );
        final failureOrSuccess =
            await returnSummaryRepository.getReturnSummaryRequestByUser(
          user: e.user,
          soldTo: e.customerCodeInfo,
          shipTo: e.shipToInfo,
          pageSize: _pageSize,
          offSet: 0,
          returnSummaryFilter: e.returnSummaryFilter,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (returnSummaryList) {
            emit(
              state.copyWith(
                returnSummaryList: returnSummaryList.requests,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      loadMore: (value) async {
        if (state.isLoading || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await returnSummaryRepository.getReturnSummaryRequestByUser(
          user: value.user,
          soldTo: value.customerCodeInfo,
          shipTo: value.shipToInfo,
          pageSize: _pageSize,
          offSet: state.returnSummaryList.length,
          returnSummaryFilter: value.returnSummaryFilter,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (returnSummaryList) {
            final updateReturnSummaryList = List<ReturnSummaryRequest>.from(
              state.returnSummaryList,
            )..addAll(returnSummaryList.requests);
            emit(
              state.copyWith(
                returnSummaryList: updateReturnSummaryList,
                canLoadMore: returnSummaryList.requests.length >= _pageSize,
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
