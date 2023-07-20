import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_list_by_item_event.dart';
part 'return_list_by_item_state.dart';
part 'return_list_by_item_bloc.freezed.dart';

const int _pageSize = 24;

class ReturnListByItemBloc
    extends Bloc<ReturnListByItemEvent, ReturnListByItemState> {
  final IReturnListRepository returnListRepository;
  final IProductImagesRepository productImagesRepository;

  ReturnListByItemBloc({
    required this.returnListRepository,
    required this.productImagesRepository,
  }) : super(ReturnListByItemState.initial()) {
    on<ReturnListByItemEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnListByItemEvent event,
    Emitter<ReturnListByItemState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ReturnListByItemState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            returnItemList: <ReturnItem>[],
            isFetching: true,
            appliedFilter: e.appliedFilter,
            searchKey: e.searchKey,
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
          appliedFilter: e.appliedFilter,
          searchKey: e.searchKey,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: false,
              ),
            );
          },
          (returnList) {
            emit(
              state.copyWith(
                returnItemList: returnList,
                canLoadMore: returnList.length >= _pageSize,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) {
          return;
        }
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
          offset: state.returnItemList.length,
          appliedFilter: state.appliedFilter,
          searchKey: state.searchKey,
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
            final newItemList = List<ReturnItem>.from(state.returnItemList)
              ..addAll(moreItem);

            emit(
              state.copyWith(
                returnItemList: newItemList,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: moreItem.length >= _pageSize,
              ),
            );
          },
        );
      },
    );
  }
}
