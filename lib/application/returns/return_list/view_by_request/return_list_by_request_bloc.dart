import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'return_list_by_request_event.dart';
part 'return_list_by_request_state.dart';
part 'return_list_by_request_bloc.freezed.dart';

class ReturnListByRequestBloc
    extends Bloc<ReturnListByRequestEvent, ReturnListByRequestState> {
  final IReturnListRepository returnListRepository;
  final Config config;
  ReturnListByRequestBloc({
    required this.returnListRepository,
    required this.config,
  }) : super(ReturnListByRequestState.initial()) {
    on<_Initialized>(
      (event, emit) => emit(
        ReturnListByRequestState.initial().copyWith(
          salesOrg: event.salesOrg,
          user: event.user,
          customerCodeInfo: event.customerCodeInfo,
          shipInfo: event.shipInfo,
        ),
      ),
    );
    on<_AutoSearchProduct>(
      (e, emit) {
        if (e.searchKey == state.searchKey) return;
        if (e.searchKey.isValid()) {
          add(
            _Fetch(
              appliedFilter: e.appliedFilter,
              searchKey: e.searchKey,
            ),
          );
        } else {
          emit(state.copyWith(searchKey: e.searchKey));
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(
            Duration(milliseconds: config.autoSearchTimeout),
          )
          .asyncExpand(mapper),
    );
    on<_Fetch>(
      (e, emit) async {
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
            await returnListRepository.fetchReturnListByRequest(
          salesOrg: state.salesOrg,
          shipToInfo: state.shipInfo,
          customerCode: state.customerCodeInfo,
          user: state.user,
          pageSize: config.pageSize,
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
              ),
            );
          },
          (returnList) {
            emit(
              state.copyWith(
                returnItemList: returnList,
                canLoadMore: returnList.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await returnListRepository.fetchReturnListByRequest(
          salesOrg: state.salesOrg,
          shipToInfo: state.shipInfo,
          customerCode: state.customerCodeInfo,
          user: state.user,
          pageSize: config.pageSize,
          offset: state.returnItemList.length,
          appliedFilter: state.appliedFilter,
          searchKey: state.searchKey,
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
                canLoadMore: moreItem.length >= config.pageSize,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
  }
}
