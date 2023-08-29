import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_invoices_event.dart';
part 'outstanding_invoices_state.dart';
part 'outstanding_invoices_bloc.freezed.dart';

class OutstandingInvoicesBloc
    extends Bloc<OutstandingInvoicesEvent, OutstandingInvoicesState> {
  final INewPaymentRepository newPaymentRepository;
  final Config config;
  OutstandingInvoicesBloc({
    required this.newPaymentRepository,
    required this.config,
  }) : super(OutstandingInvoicesState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    OutstandingInvoicesEvent event,
    Emitter<OutstandingInvoicesState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(OutstandingInvoicesState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CustomerOpenItem>[],
            isLoading: true,
            appliedFilter: value.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.getOutstandingInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: config.pageSize,
          offset: 0,
          appliedFilter: value.appliedFilter,
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
            await newPaymentRepository.getOutstandingInvoices(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          pageSize: config.pageSize,
          offset: state.items.length,
          appliedFilter: state.appliedFilter,
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
          },
        );
      },
    );
  }
}
