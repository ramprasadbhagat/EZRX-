import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_invoices_event.dart';
part 'all_invoices_state.dart';
part 'all_invoices_bloc.freezed.dart';

const int _pageSize = 20;

class AllInvoicesBloc
    extends Bloc<AllInvoicesEvent, AllInvoicesState> {
  final IAllInvoicesRepository allInvoicesRepository;

  AllInvoicesBloc({required this.allInvoicesRepository})
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
            invoices: <InvoiceItem>[],
            totalCount: 0,
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await allInvoicesRepository.getAllInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          sortDirection: value.sortDirection,
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

        final failureOrSuccess =
            await allInvoicesRepository.getAllInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          sortDirection: value.sortDirection,
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
            final updateItemList = List<InvoiceItem>.from(state.invoices)
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
