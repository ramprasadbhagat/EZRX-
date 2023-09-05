import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/transformers.dart';

part 'all_invoices_event.dart';
part 'all_invoices_state.dart';
part 'all_invoices_bloc.freezed.dart';

class AllInvoicesBloc extends Bloc<AllInvoicesEvent, AllInvoicesState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;
  final Config config;

  AllInvoicesBloc({
    required this.allCreditsAndInvoicesRepository,
    required this.config,
  }) : super(AllInvoicesState.initial()) {
    on<_initialized>(
      (e, emit) => emit(
        AllInvoicesState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
        ),
      ),
    );
    on<_AutoSearchProduct>(
      (e, emit) {
        if (e.searchKey == state.appliedFilter.searchKey) return;
        if (e.searchKey.isValid()) {
          add(
            _Fetch(
              appliedFilter:
                  state.appliedFilter.copyWith(searchKey: e.searchKey),
            ),
          );
        } else {
          emit(
            state.copyWith(
              appliedFilter:
                  state.appliedFilter.copyWith(searchKey: e.searchKey),
            ),
          );
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(Duration(milliseconds: config.autoSearchTimeout))
          .asyncExpand(mapper),
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <CreditAndInvoiceItem>[],
            isLoading: true,
            appliedFilter: e.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.filterInvoices(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          filter: e.appliedFilter,
          pageSize: config.pageSize,
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
                canLoadMore: responseData.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
    on<_LoadMore>(
      (e, emit) async {
        if (state.isLoading || !state.canLoadMore) return;

        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.filterInvoices(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          filter: state.appliedFilter,
          pageSize: config.pageSize,
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
                canLoadMore: responseData.length >= config.pageSize,
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
