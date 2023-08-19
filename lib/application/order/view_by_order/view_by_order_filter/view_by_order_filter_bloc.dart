import 'dart:async';

import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_filter_event.dart';
part 'view_by_order_filter_state.dart';
part 'view_by_order_filter_bloc.freezed.dart';

class ViewByOrderFilterBloc
    extends Bloc<ViewByOrderFilterEvent, ViewByOrderFilterState> {
  ViewByOrderFilterBloc() : super(ViewByOrderFilterState.initial()) {
    on<ViewByOrderFilterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ViewByOrderFilterEvent event,
    Emitter<ViewByOrderFilterState> emit,
  ) {
    event.map(
      initialized: (_) => emit(ViewByOrderFilterState.initial()),
      setDateRange: (_SetDateRange e) => emit(
        state.copyWith(filter: e.viewByOrdersFilter),
      ),
    );
  }
}
