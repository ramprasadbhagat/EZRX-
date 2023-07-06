import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_event.dart';
part 'all_credits_state.dart';
part 'all_credits_bloc.freezed.dart';

const int _pageSize = 24;

class AllCreditsBloc extends Bloc<AllCreditsEvent, AllCreditsState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;

  AllCreditsBloc({required this.allCreditsAndInvoicesRepository})
      : super(AllCreditsState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    AllCreditsEvent event,
    Emitter<AllCreditsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AllCreditsState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CreditAndInvoiceItem>[],
            isLoading: true,
            appliedFilter: value.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.filterCredits(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          filter: value.appliedFilter,
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
          (responseData) {
            emit(
              state.copyWith(
                items: responseData,
                canLoadMore: responseData.length >= _pageSize,
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
            await allCreditsAndInvoicesRepository.filterCredits(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          filter: state.appliedFilter,
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
          (responseData) {
            final updateItemList = List<CreditAndInvoiceItem>.from(state.items)
              ..addAll(responseData);
            emit(
              state.copyWith(
                items: updateItemList,
                canLoadMore: responseData.length >= _pageSize,
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
