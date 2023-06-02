import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_filter_event.dart';
part 'all_credits_filter_state.dart';
part 'all_credits_filter_bloc.freezed.dart';

class AllCreditsFilterBloc
    extends Bloc<AllCreditsFilterEvent, AllCreditsFilterState> {
  final IAllCreditsAndInvoicesRepository allCreditsAndInvoicesRepository;

  AllCreditsFilterBloc({
    required this.allCreditsAndInvoicesRepository,
  }) : super(AllCreditsFilterState.initial()) {
    on<AllCreditsFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AllCreditsFilterEvent event,
    Emitter<AllCreditsFilterState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async => emit(
        AllCreditsFilterState.initial(),
      ),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            allCreditsStatuses: <String>['All'],
            isFetching: true,
          ),
        );

        final failureOrSuccess = await allCreditsAndInvoicesRepository
            .getAvailableStatusesForAllCredits(
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
            final updateItemList = List<String>.from(state.allCreditsStatuses)
              ..addAll(data.statuses);
            emit(
              state.copyWith(
                allCreditsStatuses: updateItemList,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      applyFilters: (value) async {
        emit(
          state.copyWith(
            isSubmitting: false,
          ),
        );
        if (state.allCreditsFilter.isValid) {
          emit(state.copyWith(
            isSubmitting: true,
          ));
        } else {
          emit(state.copyWith(
            showErrorMessages: true,
          ));
        }
      },
      clearFilters: (value) async {
        emit(state.copyWith(
          isSubmitting: false,
          allCreditsFilter: AllCreditsFilter.empty(),
          showErrorMessages: false,
        ));
      },
      documentNumberChanged: (e) async => emit(
        state.copyWith(
          allCreditsFilter: state.allCreditsFilter.copyWith(
            documentNumber: e.documentNumber,
          ),
          showErrorMessages: false,
        ),
      ),
      sortByChanged: (e) {
        emit(
          state.copyWith(
            allCreditsFilter: state.allCreditsFilter.copyWith(
              sortBy: e.sortBy,
            ),
          ),
        );
      },
      setDocumentDate: (e) async => emit(
        state.copyWith(
          allCreditsFilter: state.allCreditsFilter.copyWith(
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
      creditAmountFromChanged: (e) async => emit(
        state.copyWith(
          allCreditsFilter: state.allCreditsFilter.copyWith(
            creditAmountFrom: RangeValue(e.creditAmountFrom),
          ),
          showErrorMessages: false,
        ),
      ),
      creditAmountToChanged: (e) async => emit(
        state.copyWith(
          allCreditsFilter: state.allCreditsFilter.copyWith(
            creditAmountTo: RangeValue(e.creditAmountTo),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
