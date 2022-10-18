import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
      updateSearchKey: (e) {
        emit(state.copyWith(searchKey: SearchKey.search(e.searchKey)));
      },
      selected: (e) async {
        emit(state.copyWith(shipToInfo: e.shipToInfo));
      },
      load: (e) async {
        emit(state.copyWith(
          searchKey: SearchKey.search(''),
          shipToInfoList: e.shipToInfos,
        ));
      },
      search: (e) async {
        final shipToInfos = e.shipToInfos
            .where(
              (i) => i.shipToCustomerCode.contains(state.searchKey.getValue()),
            )
            .toList();
        emit(state.copyWith(shipToInfoList: shipToInfos));
      },
    );
  }

  @override
  void onChange(Change<ShipToCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
