import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/repository/i_request_return_repository.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_return_event.dart';
part 'request_return_state.dart';
part 'request_return_bloc.freezed.dart';

const int _defaultPageSize = 10;

class RequestReturnBloc extends Bloc<RequestReturnEvent, RequestReturnState> {
  final IReturnRequestRepository returnRequestRepository;

  RequestReturnBloc({required this.returnRequestRepository})
      : super(RequestReturnState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    RequestReturnEvent event,
    Emitter<RequestReturnState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(RequestReturnState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            returnItemList: [],
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await returnRequestRepository.searchReturnRequestList(
          salesOrganisation: value.salesOrg,
          shipToInfo: value.shipInfo,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: _defaultPageSize,
          offSet: 0,
          requestReturnFilter: value.requestReturnFilter,
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
          (requestReturn) {
            emit(
              state.copyWith(
                returnItemList: requestReturn.items,
                canLoadMore: requestReturn.items.length >= _defaultPageSize,
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
            await returnRequestRepository.searchReturnRequestList(
          salesOrganisation: value.salesOrg,
          shipToInfo: value.shipInfo,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: _defaultPageSize,
          offSet: state.returnItemList.length,
          requestReturnFilter: value.requestReturnFilter,
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
          (requestReturn) {
            final updateItemList = List<ReturnItem>.from(state.returnItemList)
              ..addAll(requestReturn.items);
            emit(
              state.copyWith(
                returnItemList: updateItemList,
                canLoadMore: requestReturn.items.length >= _defaultPageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      sortByDate: (value) {
        final sortedItems = _getSortedList(
          List<ReturnItem>.from(state.returnItemList),
          value.sortDirection,
        );
        emit(
          state.copyWith(
            returnItemList: sortedItems,
            canLoadMore: sortedItems.length >= _defaultPageSize,
            failureOrSuccessOption: none(),
            isLoading: false,
            sortDirection: value.sortDirection,
          ),
        );
      },
    );
  }

  List<ReturnItem> _getSortedList(List<ReturnItem> oldList, String direction) {
    final newList = oldList
      ..sort((a, b) => _compareTo(a.expiryDate, b.expiryDate, direction));

    return newList;
  }

  int _compareTo(SimpleDate a, SimpleDate b, String direction) {
    switch (direction) {
      case 'asc':
        return a.getOrDefaultValue('').compareTo(b.getOrDefaultValue(''));
      case 'desc':
        return b.getOrDefaultValue('').compareTo(a.getOrDefaultValue(''));
      default:
        return 1;
    }
  }
}
