import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_invoices_filter_event.dart';
part 'all_invoices_filter_state.dart';
part 'all_invoices_filter_bloc.freezed.dart';

class AllInvoicesFilterBloc
    extends Bloc<AllInvoicesFilterEvent, AllInvoicesFilterState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;

  AllInvoicesFilterBloc({
    required this.allCreditsAndInvoicesRepository,
  }) : super(AllInvoicesFilterState.initial()) {
    on<AllInvoicesFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AllInvoicesFilterEvent event,
    Emitter<AllInvoicesFilterState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async => emit(
        AllInvoicesFilterState.initial(),
      ),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            statuses: <String>['All'],
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await allCreditsAndInvoicesRepository.getAvailableStatuses(
          salesOrganisation: e.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (data) {
            final updateItemList = List<String>.from(state.statuses)
              ..addAll(data.statuses);
            emit(
              state.copyWith(
                statuses: updateItemList,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      openFilterDrawer: (_OpenFilterDrawer value) async {
        if (state.changed || state.edited || state.showErrorMessages) {
          emit(
            state.copyWith(
              changed: false,
              edited: false,
              showErrorMessages: false,
            ),
          );
        }
      },
      applyFilters: (_ApplyFilters value) async {
        if (state.allInvoicesFilter.isValid) {
          emit(
            state.copyWith(
              changed: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              changed: false,
              showErrorMessages: true,
            ),
          );
        }
      },
      clearFilters: (_ClearFilters value) async {
        emit(
          state.copyWith(
            changed: true,
            allInvoicesFilter: AllInvoicesFilter.empty(),
            showErrorMessages: false,
          ),
        );
      },
      documentNumberChanged: (_DocumentNumberChanged e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            documentNumber: e.documentNumber,
          ),
          edited: true,
          showErrorMessages: false,
        ),
      ),
      statusChanged: (_StatusChanged e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            filterStatus: e.filterStatus,
          ),
        ),
      ),
      setDueDate: (_SetDueDate e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dueDateRange.start),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dueDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      setDocumentDate: (_SetDocumentDate e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      debitValueFromChanged: (_DebitValueFromChanged e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            debitValueFrom: RangeValue(e.debitValueFrom),
          ),
          edited: true,
          showErrorMessages: false,
        ),
      ),
      debitValueToChanged: (_DebitValueToChanged e) async => emit(
        state.copyWith(
          allInvoicesFilter: state.allInvoicesFilter.copyWith(
            debitValueTo: RangeValue(e.debitValueTo),
          ),
          edited: true,
          showErrorMessages: false,
        ),
      ),
    );
  }
}
