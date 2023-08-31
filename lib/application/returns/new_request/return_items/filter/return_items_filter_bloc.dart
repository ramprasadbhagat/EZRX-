import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_items_filter_event.dart';
part 'return_items_filter_state.dart';
part 'return_items_filter_bloc.freezed.dart';

class ReturnItemsFilterBloc
    extends Bloc<ReturnItemsFilterEvent, ReturnItemsFilterState> {
  ReturnItemsFilterBloc() : super(ReturnItemsFilterState.initial()) {
    on<ReturnItemsFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ReturnItemsFilterEvent event,
    Emitter<ReturnItemsFilterState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async => emit(
        ReturnItemsFilterState.initial(),
      ),
      openFilterBottomSheet: (_OpenFilterBottomSheet value) {
        if (state.filter != value.appliedFilter) {
          emit(
            state.copyWith(
              filter: value.appliedFilter,
            ),
          );
        }
      },
      setInvoiceDate: (_SetInvoiceDate e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            invoiceDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            invoiceDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
        ),
      ),
    );
  }
}
