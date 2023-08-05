import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_items_event.dart';
part 'return_items_state.dart';
part 'return_items_bloc.freezed.dart';

const int _pageSize = 24;

class ReturnItemsBloc extends Bloc<ReturnItemsEvent, ReturnItemsState> {
  final IReturnRequestRepository newRequestRepository;

  ReturnItemsBloc({required this.newRequestRepository})
      : super(ReturnItemsState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    ReturnItemsEvent event,
    Emitter<ReturnItemsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ReturnItemsState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <ReturnMaterial>[],
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await newRequestRepository.searchReturnMaterials(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          shipToInfo: value.shipToInfo,
          pageSize: _pageSize,
          offset: 0,
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
          (data) {
            emit(
              state.copyWith(
                items: data.items,
                canLoadMore: data.items.length >= _pageSize,
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
            await newRequestRepository.searchReturnMaterials(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          shipToInfo: value.shipToInfo,
          pageSize: _pageSize,
          offset: state.items.length,
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
          (data) {
            final updateItemList = List<ReturnMaterial>.from(state.items)
              ..addAll(data.items);
            emit(
              state.copyWith(
                items: updateItemList,
                canLoadMore: data.items.length >= _pageSize,
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
