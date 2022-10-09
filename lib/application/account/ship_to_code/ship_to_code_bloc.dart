import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_code_event.dart';
part 'ship_to_code_state.dart';
part 'ship_to_code_bloc.freezed.dart';

class ShipToCodeBloc extends Bloc<ShipToCodeEvent, ShipToCodeState> {
  ShipToCodeBloc() : super(ShipToCodeState.initial()) {
    on<ShipToCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ShipToCodeEvent event,
    Emitter<ShipToCodeState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ShipToCodeState.initial()),
      selected: (e) async {
        emit(state.copyWith(shipToInfo: e.shipToInfo));
      },
    );
  }

  @override
  void onChange(Change<ShipToCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
