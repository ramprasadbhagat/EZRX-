import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
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
      openFilterBottomSheet: (_OpenFilterBottomSheet value) async {
        if (state.applied || state.showErrorMessages) {
          emit(
            state.copyWith(
              applied: false,
              showErrorMessages: false,
            ),
          );
        }
      },
      closeFilterBottomSheet: (_CloseFilterBottomSheet value) async {
        emit(
          state.copyWith(
            applied: false,
            tempFilter: state.appliedFilter,
            showErrorMessages: false,
          ),
        );
      },
      applyFilters: (_ApplyFilters value) async {
        if (state.tempFilter != state.appliedFilter) {
          if (state.tempFilter.isValid) {
            emit(
              state.copyWith(
                appliedFilter: state.tempFilter,
                applied: true,
              ),
            );
          } else {
            emit(
              state.copyWith(
                applied: false,
                showErrorMessages: true,
              ),
            );
          }
        }
      },
      resetFilters: (_ResetFilters value) async {
        final emptyValue = AllInvoicesFilter.empty();
        if (!state.appliedFilter.isEmpty) {
          emit(
            state.copyWith(
              applied: true,
              tempFilter: emptyValue,
              appliedFilter: emptyValue,
              showErrorMessages: false,
            ),
          );
        } else if (!state.tempFilter.isEmpty) {
          emit(
            state.copyWith(
              applied: false,
              tempFilter: emptyValue,
              showErrorMessages: false,
            ),
          );
        }
      },
      statusChanged: (_StatusChanged e) async {
        final statuses = List<String>.from(state.tempFilter.filterStatuses);
        e.selected
            ? statuses.add(e.filterStatus)
            : statuses.remove(e.filterStatus);
        emit(
          state.copyWith(
            tempFilter: state.tempFilter.copyWith(
              filterStatuses: statuses,
            ),
          ),
        );
      },
      setDueDate: (_SetDueDate e) async => emit(
        state.copyWith(
          tempFilter: state.tempFilter.copyWith(
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      setDocumentDate: (_SetDocumentDate e) async => emit(
        state.copyWith(
          tempFilter: state.tempFilter.copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueFromChanged: (_AmountValueFromChanged e) async => emit(
        state.copyWith(
          tempFilter: state.tempFilter.copyWith(
            amountValueFrom: RangeValue(e.amountValueFrom),
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueToChanged: (_AmountValueToChanged e) async => emit(
        state.copyWith(
          tempFilter: state.tempFilter.copyWith(
            amountValueTo: RangeValue(e.amountValueTo),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
