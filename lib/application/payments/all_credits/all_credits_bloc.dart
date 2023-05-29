import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_event.dart';
part 'all_credits_state.dart';
part 'all_credits_bloc.freezed.dart';

const int _pageSize = 20;

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
      fetchAllCreditsList: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            credits: <CreditAndInvoiceItem>[],
            totalCount: 0,
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.getAllCredits(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: _pageSize,
          offSet: 0,
          allCreditsFilter: value.allCreditsFilter,
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
          (creditData) {
            emit(
              state.copyWith(
                credits: creditData.invoices,
                totalCount: creditData.totalCount,
                canLoadMore: creditData.invoices.length >= _pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      loadMoreAllCreditsList: (value) async {
        if (state.isLoading || !state.canLoadMore) return;

        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.getAllCredits(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: _pageSize,
          offSet: state.credits.length,
          allCreditsFilter: value.allCreditsFilter,
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
          (creditData) {
            final updateItemList =
                List<CreditAndInvoiceItem>.from(state.credits)
                  ..addAll(creditData.invoices);
            emit(
              state.copyWith(
                credits: updateItemList,
                totalCount: creditData.totalCount,
                canLoadMore: creditData.invoices.length >= _pageSize,
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
