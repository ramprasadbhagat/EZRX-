import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_invoices_event.dart';

part 'outstanding_invoices_state.dart';

part 'outstanding_invoices_bloc.freezed.dart';

class OutstandingInvoicesBloc
    extends Bloc<OutstandingInvoicesEvent, OutstandingInvoicesState> {
  final INewPaymentRepository newPaymentRepository;
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  final Config config;

  OutstandingInvoicesBloc({
    required this.newPaymentRepository,
    required this.allCreditsAndInvoicesRepository,
    required this.config,
  }) : super(OutstandingInvoicesState.initial()) {
    on<_Initialized>((event, emit) {
      emit(
        OutstandingInvoicesState.initial().copyWith(
          salesOrganisation: event.salesOrganisation,
          customerCodeInfo: event.customerCodeInfo,
          appliedFilter: OutstandingInvoiceFilter.init(),
        ),
      );
    });

    on<_Fetch>(
      (event, emit) async {
        if (event.searchKey == state.searchKey &&
            event.searchKey.isValid() &&
            event.appliedFilter == state.appliedFilter) {
          return;
        }

        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CustomerOpenItem>[],
            isLoading: true,
            appliedFilter: event.appliedFilter,
            searchKey: event.searchKey,
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.getOutstandingInvoices(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          pageSize: config.pageSize,
          offset: 0,
          appliedFilter: event.appliedFilter,
          searchKey: event.searchKey,
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
                canLoadMore: data.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
            add(OutstandingInvoicesEvent.fetchOrderForInvoices(invoices: data));
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMore>(
      ((event, emit) async {
        if (state.isLoading || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.getOutstandingInvoices(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          pageSize: config.pageSize,
          offset: state.items.length,
          appliedFilter: state.appliedFilter,
          searchKey: state.searchKey,
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
                canLoadMore: data.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
            add(OutstandingInvoicesEvent.fetchOrderForInvoices(invoices: data));
          },
        );
      }),
    );

    on<_FetchOrderForInvoices>(
      (e, emit) async {
        if (e.invoices.isEmpty) return;

        final invoiceIds = e.invoices.map((e) => e.billingDocument).toList();
        emit(
          state.copyWith(
            isOrderFetching: true,
            failureOrSuccessOption: none(),
            orderFetchingInvoiceIdList: invoiceIds,
          ),
        );
        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.fetchOrder(
          invoiceIds: invoiceIds,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isOrderFetching: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                orderFetchingInvoiceIdList: <String>[],
              ),
            );
          },
          (responseData) {
            final items = state.items
                .map(
                  (e) => e.orderId.isValid()
                      ? e
                      : e.copyWith(
                          orderId: responseData[e.accountingDocument] ??
                              StringValue(''),
                        ),
                )
                .toList();
            emit(
              state.copyWith(
                isOrderFetching: false,
                items: items,
                orderFetchingInvoiceIdList: <String>[],
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}
