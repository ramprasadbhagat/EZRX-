import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information.dart';
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
                returnSummaryList: returnSummaryList,
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
            final updateReturnSummaryList =
                List<ReturnSummaryRequestInformation>.from(
                    state.returnSummaryList,)
                  ..addAll(returnSummaryList);
            emit(
              state.copyWith(
                returnSummaryList: updateReturnSummaryList,
                canLoadMore: returnSummaryList.length >= _pageSize,
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
