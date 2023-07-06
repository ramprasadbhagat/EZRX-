import 'dart:async';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_all_credits_and_invoices_repository.dart';
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
      openFilterBottomSheet: (_OpenFilterBottomSheet value) async {
        if (state.showErrorMessages || state.filter != value.appliedFilter) {
          emit(
            state.copyWith(
              filter: value.appliedFilter,
              showErrorMessages: false,
            ),
          );
        }
      },
      validateFilters: (_ValidateFilters value) async {
          emit(
            state.copyWith(
              showErrorMessages: !state.filter.isValid,
            ),
          );
      },
      statusChanged: (_StatusChanged e) async {
        final statuses = List<String>.from(state.filter.filterStatuses);
        e.selected
            ? statuses.add(e.filterStatus)
            : statuses.remove(e.filterStatus);
        emit(
          state.copyWith(
            filter: state.filter.copyWith(
              filterStatuses: statuses,
            ),
          ),
        );
      },
      setDocumentDate: (_SetDocumentDate e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
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
          filter: state.filter.copyWith(
            amountValueFrom: RangeValue(e.amountValueFrom),
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueToChanged: (_AmountValueToChanged e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            amountValueTo: RangeValue(e.amountValueTo),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
