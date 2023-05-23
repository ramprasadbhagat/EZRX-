import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_invoices_event.dart';
part 'all_invoices_state.dart';
part 'all_invoices_bloc.freezed.dart';

const int _pageSize = 20;

class AllInvoicesBloc extends Bloc<AllInvoicesEvent, AllInvoicesState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;

  AllInvoicesBloc({required this.allCreditsAndInvoicesRepository})
      : super(AllInvoicesState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    AllInvoicesEvent event,
    Emitter<AllInvoicesState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AllInvoicesState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            invoices: <CreditAndInvoiceItem>[],
            totalCount: 0,
            isLoading: true,
          ),
        );

        final failureOrSuccess = await allCreditsAndInvoicesRepository.filterInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          filter: value.filter,
          pageSize: _pageSize,
          offSet: 0,
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
          (paymentData) {
            emit(
              state.copyWith(
                invoices: paymentData.invoices,
                totalCount: paymentData.totalCount,
                canLoadMore: paymentData.invoices.length >= _pageSize,
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

        final failureOrSuccess = await allCreditsAndInvoicesRepository.filterInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          filter: value.filter,
          pageSize: _pageSize,
          offSet: state.invoices.length,
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
          (paymentData) {
            final updateItemList = List<CreditAndInvoiceItem>.from(state.invoices)
              ..addAll(paymentData.invoices);
            emit(
              state.copyWith(
                invoices: updateItemList,
                totalCount: paymentData.totalCount,
                canLoadMore: paymentData.invoices.length >= _pageSize,
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
