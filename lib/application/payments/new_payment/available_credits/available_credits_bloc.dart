import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_credits_event.dart';
part 'available_credits_state.dart';
part 'available_credits_bloc.freezed.dart';

const int _pageSize = 24;

class AvailableCreditsBloc
    extends Bloc<AvailableCreditsEvent, AvailableCreditsState> {
  final INewPaymentRepository newPaymentRepository;

  AvailableCreditsBloc({required this.newPaymentRepository})
      : super(AvailableCreditsState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    AvailableCreditsEvent event,
    Emitter<AvailableCreditsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AvailableCreditsState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CustomerOpenItem>[],
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.getAvailableCreditNotes(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
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
                items: data,
                canLoadMore: data.length >=_pageSize,
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
            await newPaymentRepository.getAvailableCreditNotes(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
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
            final updateItemList = List<CustomerOpenItem>.from(state.items)
              ..addAll(data);
            emit(
              state.copyWith(
                items: updateItemList,
                canLoadMore: data.length >= _pageSize,
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
