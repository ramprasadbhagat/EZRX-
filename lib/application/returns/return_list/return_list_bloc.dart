import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_list_event.dart';
part 'return_list_state.dart';
part 'return_list_bloc.freezed.dart';

const int _pageSize = 24;

class ReturnListBloc extends Bloc<ReturnListEvent, ReturnListState> {
  final IReturnListRepository returnListRepository;

  ReturnListBloc({required this.returnListRepository})
      : super(ReturnListState.initial()) {
    on<ReturnListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnListEvent event,
    Emitter<ReturnListState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ReturnListState.initial()),
      fetchByItems: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            returnItemGroupList: <ReturnItemGroup>[],
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await returnListRepository.fetchReturnListByItem(
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
                returnItemGroupList: returnList,
                canLoadMore: returnList
                        .map((e) => e.items)
                        .toList()
                        .expand((element) => element)
                        .toList()
                        .length >=
                    _pageSize,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      loadMoreFetchByItems: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await returnListRepository.fetchReturnListByItem(
          salesOrg: e.salesOrg,
          shipToInfo: e.shipInfo,
          customerCode: e.customerCodeInfo,
          user: e.user,
          pageSize: _pageSize,
          offset: state.returnItemGroupList
              .map((e) => e.items)
              .expand((element) => element)
              .toList()
              .toList()
              .length,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              canLoadMore: false,
              isFetching: false,
            ),
          ),
          (moreItem) {
            final canLoadMore = moreItem
                    .map((e) => e.items)
                    .toList()
                    .expand((element) => element)
                    .toList()
                    .length >=
                _pageSize;
            final oldList =
                List<ReturnItemGroup>.from(state.returnItemGroupList);

            if (oldList.last.requestDate == moreItem.first.requestDate) {
              final lastGroupList = List<ReturnItem>.from(oldList.last.items)
                ..addAll(moreItem.first.items);
              oldList.removeLast();
              oldList.add(
                ReturnItemGroup.empty().copyWith(
                  requestDate: moreItem.first.requestDate,
                  items: lastGroupList,
                ),
              );
              moreItem.removeAt(0);
            }

            final newItemList = oldList..addAll(moreItem);
            emit(
              state.copyWith(
                returnItemGroupList: newItemList,
                failureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: canLoadMore,
              ),
            );
          },
        );
      },
    );
  }
}
