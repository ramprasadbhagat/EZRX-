import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/repository/i_request_return_repository.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/usage.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'request_return_event.dart';
part 'request_return_state.dart';
part 'request_return_bloc.freezed.dart';

const int _pageSize = 20;

class RequestReturnBloc extends Bloc<RequestReturnEvent, RequestReturnState> {
  final IReturnRequestRepository returnRequestRepository;

  RequestReturnBloc({required this.returnRequestRepository})
      : super(RequestReturnState.initial()) {
    on<RequestReturnEvent>(_onEvent);
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
          pageSize: _pageSize,
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
                canLoadMore: requestReturn.items.length >= _pageSize,
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
          pageSize: _pageSize,
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
                canLoadMore: requestReturn.items.length >= _pageSize,
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
            canLoadMore: sortedItems.length >= _pageSize,
            failureOrSuccessOption: none(),
            isLoading: false,
            sortDirection: value.sortDirection,
          ),
        );
      },
      updateReturnDetails: (e) {
        emit(
          state.copyWith(
            returnItemList: _updatedReturnItemList(e.updatedItem),
          ),
        );
      },
      uploadAttachments: (e) {
        final item = state.getReturnItem(e.uniqueId);
        final updatedItem = item.copyWith(
          poDocuments: List.from(item.poDocuments)..addAll(e.poDocuments),
        );
        emit(
          state.copyWith(
            returnItemList: _updatedReturnItemList(updatedItem),
          ),
        );
      },
      deleteAttachment: (e) {
        final item = state.getReturnItem(e.uniqueId);
        final updatedAttachments = item.updatedDocumentList(e.poDocuments.name);
        emit(
          state.copyWith(
            returnItemList: _updatedReturnItemList(item.copyWith(
              poDocuments: updatedAttachments,
            )),
          ),
        );
      },
      updateReturnRequestReferenceNumber: (e) {
        emit(
          state.copyWith(
            returnReferenceNumber: e.referenceNumber,
          ),
        );
      },
      updateSpecialInstructions: (e) {
        emit(
          state.copyWith(
            specialInstructions: e.specialInstructions,
          ),
        );
      },
      initializeSelectedReturnItems: (e) {
        emit(
          state.copyWith(
            specialInstructions: '',
            returnReferenceNumber: '',
            returnItemList: _getInitializedReturnItemList,
          ),
        );
      },
    );
  }

  List<ReturnItem> _updatedReturnItemList(ReturnItem updatedItem) {
    final returnItemToUpdateIndex = state.returnItemList.indexWhere(
      (element) => element.uniqueId == updatedItem.uniqueId,
    );

    return List.from(state.returnItemList)
      ..removeAt(returnItemToUpdateIndex)
      ..insert(returnItemToUpdateIndex, updatedItem);
  }

  List<ReturnItem> get _getInitializedReturnItemList => state.returnItemList
      .map((e) => e.copyWith(
            isSelected: false,
            poDocuments: [],
            returnQuantity: ReturnQuantity(''),
            usage: Usage.empty(),
          ))
      .toList();

  List<ReturnItem> _getSortedList(List<ReturnItem> oldList, String direction) {
    final newList = oldList
      ..sort((a, b) => _compareTo(a.expiryDate, b.expiryDate, direction));

    return newList;
  }

  int _compareTo(
    DateTimeStringValue a,
    DateTimeStringValue b,
    String direction,
  ) {
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
