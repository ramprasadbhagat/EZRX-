import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ship_to_code_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_code_bloc.freezed.dart';
part 'ship_to_code_event.dart';
part 'ship_to_code_state.dart';

class ShipToCodeBloc extends Bloc<ShipToCodeEvent, ShipToCodeState> {
  late ShipToCodeRepository shipToCodeRepository;

  ShipToCodeBloc({
    required this.shipToCodeRepository,
  }) : super(ShipToCodeState.initial()) {
    on<ShipToCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ShipToCodeEvent event,
    Emitter<ShipToCodeState> emit,
  ) async {
    await event.map(
      loadSavedShipToCode: (e) async {
        final shipToCodeSuccessOrFailure =
            await shipToCodeRepository.getShipToCode();

        // found last selected from local storage => apply
        // not found last selected from local storage => use default ShipToInfo
        final shipToInfo = shipToCodeSuccessOrFailure.fold(
          (_) {
            return e.defaultShipToInfo;
          },
          (shipToCode) {
            return e.shipToInfos.firstWhere(
              (e) => shipToCode == e.shipToCustomerCode,
              orElse: () => e.defaultShipToInfo,
            );
          },
        );
        add(ShipToCodeEvent.selected(shipToInfo: shipToInfo));
      },
      initialized: (e) async {
        emit(ShipToCodeState.initial());
      },
      updateSearchKey: (e) {
        emit(state.copyWith(searchKey: SearchKey.search(e.searchKey)));
      },
      selected: (e) async {
        await shipToCodeRepository.storeShipToCode(
          shipToCode: e.shipToInfo.shipToCustomerCode,
        );
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
