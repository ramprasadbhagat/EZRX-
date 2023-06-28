import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_list_by_request_event.dart';
part 'return_list_by_request_state.dart';
part 'return_list_by_request_bloc.freezed.dart';

const int _pageSize = 24;

class ReturnListByRequestBloc
    extends Bloc<ReturnListByRequestEvent, ReturnListByRequestState> {
  final IReturnListRepository returnListRepository;

  ReturnListByRequestBloc({required this.returnListRepository})
      : super(ReturnListByRequestState.initial()) {
    on<ReturnListByRequestEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnListByRequestEvent event,
    Emitter<ReturnListByRequestState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ReturnListByRequestState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            returnItemList: <ReturnItem>[],
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await returnListRepository.fetchReturnListByRequest(
          salesOrg: e.salesOrg,
          shipToInfo: e.shipInfo,
          customerCode: e.customerCodeInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: 0,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (returnList) {
            emit(
              state.copyWith(
                returnItemList: returnList,
                canLoadMore: returnList.length >= _pageSize,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await returnListRepository.fetchReturnListByRequest(
          salesOrg: e.salesOrg,
          shipToInfo: e.shipInfo,
          customerCode: e.customerCodeInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: state.returnItemList.length,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (moreItem) {
            final oldList = List<ReturnItem>.from(state.returnItemList);

            final newItemList = oldList..addAll(moreItem);
            emit(
              state.copyWith(
                returnItemList: newItemList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: newItemList.length >= _pageSize,
              ),
            );
          },
        );
      },
    );
  }
}
