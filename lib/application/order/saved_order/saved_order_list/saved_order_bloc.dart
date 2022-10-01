import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

part 'saved_order_event.dart';
part 'saved_order_state.dart';
part 'saved_order_bloc.freezed.dart';

const int _defaultPageSize = 10;

class SavedOrderListBloc
    extends Bloc<SavedOrderListEvent, SavedOrderListState> {
  final UserBloc userBloc;
  final SalesOrgBloc salesOrgBloc;
  final CustomerCodeBloc customerCodeBloc;
  final ShipToCodeBloc shipToCodeBloc;
  final IOrderRepository repository;

  late final StreamSubscription _shipToBlocSubscription;

  SavedOrderListBloc({
    required this.userBloc,
    required this.salesOrgBloc,
    required this.customerCodeBloc,
    required this.shipToCodeBloc,
    required this.repository,
  }) : super(SavedOrderListState.initial()) {
    on<SavedOrderListEvent>(_onEvent);
    add(const SavedOrderListEvent.fetch());
    _shipToBlocSubscription = shipToCodeBloc.stream.listen((state) {
      if (state.shipToInfo == ShipToInfo.empty()) {
        add(const SavedOrderListEvent.initialized());
      } else {
        add(const SavedOrderListEvent.fetch());
      }
    });
  }

  @override
  Future<void> close() async {
    await _shipToBlocSubscription.cancel();

    return super.close();
  }

  Future<void> _onEvent(
    SavedOrderListEvent event,
    Emitter<SavedOrderListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SavedOrderListState.initial()),
      fetch: (_) async {
        emit(
          state.copyWith(
            isFetching: true,
            savedOrders: [],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getSavedOrder(
          user: userBloc.state.user,
          salesOrg: salesOrgBloc.state.salesOrganisation,
          customerCode: customerCodeBloc.state.customeCodeInfo,
          shipToCode: shipToCodeBloc.state.shipToInfo,
          pageSize: _defaultPageSize,
          offset: 0,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (savedOrders) async {
            emit(
              state.copyWith(
                savedOrders: savedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: savedOrders.length >= _defaultPageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (_) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getSavedOrder(
          user: userBloc.state.user,
          salesOrg: salesOrgBloc.state.salesOrganisation,
          customerCode: customerCodeBloc.state.customeCodeInfo,
          shipToCode: shipToCodeBloc.state.shipToInfo,
          pageSize: _defaultPageSize,
          offset: state.savedOrders.length,
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (savedOrders) async {
            final newSavedOrders = List<SavedOrder>.from(state.savedOrders)
              ..addAll(savedOrders);
            emit(
              state.copyWith(
                savedOrders: newSavedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: savedOrders.length >= _defaultPageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}
