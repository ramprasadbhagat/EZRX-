import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_history_filter.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'view_by_item_filter_event.dart';

part 'view_by_item_filter_state.dart';

part 'view_by_item_filter_bloc.freezed.dart';

class ViewByItemFilterBloc
    extends Bloc<ViewByItemFilterEvent, ViewByItemFilterState> {
  ViewByItemFilterBloc() : super(ViewByItemFilterState.initial()) {
    on<ViewByItemFilterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ViewByItemFilterEvent event,
    Emitter<ViewByItemFilterState> emit,
  ) async {
    await event.map(
      initializeOrReset: (e) async => emit(
        ViewByItemFilterState.initial(),
      ),
      setOrderDate: (e) async => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            dateRange: e.dateRange,
          ),
        ),
      ),
      setOrderStatus: (e) {
        final selectedStatusList = List<StatusType>.from(
          state.filter.orderStatusList,
        );
        final modifiedStatusList = e.value
            ? (selectedStatusList..add(e.status))
            : (selectedStatusList..remove(e.status));
        emit(
          state.copyWith(
            filter: state.filter.copyWith(orderStatusList: modifiedStatusList),
          ),
        );
      },
      resetFiltersToLastApplied: (e) async => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
        ),
      ),
    );
  }
}
