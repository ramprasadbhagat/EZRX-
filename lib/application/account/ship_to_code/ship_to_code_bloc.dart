import 'dart:async';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_code_event.dart';
part 'ship_to_code_state.dart';
part 'ship_to_code_bloc.freezed.dart';

class ShipToCodeBloc extends Bloc<ShipToCodeEvent, ShipToCodeState> {
  final CustomerCodeBloc customerCodeBloc;
  late final StreamSubscription _customerCodeBlocSubscription;
  ShipToCodeBloc({required this.customerCodeBloc})
      : super(ShipToCodeState.initial()) {
    on<ShipToCodeEvent>(_onEvent);
    _customerCodeBlocSubscription =
        customerCodeBloc.stream.listen((customerCodeState) async {
      _selectShipTo(customerCodeBloc.state);
    });
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

  void _selectShipTo(CustomerCodeState customerCodeState) {
    if (customerCodeBloc.state.customeCodeInfo != CustomerCodeInfo.empty()) {
      // Check if there is any ship to with defaultShipToAddress set as true and make it selected
      if (customerCodeBloc.state.customeCodeInfo.shipToInfos.isNotEmpty) {
        var index = customerCodeBloc.state.customeCodeInfo.shipToInfos
            .indexWhere((element) => element.defaultShipToAddress);
        add(
          ShipToCodeEvent.selected(
            shipToInfo: index > -1
                ? customerCodeBloc.state.customeCodeInfo.shipToInfos[index]
                : customerCodeBloc.state.customeCodeInfo.shipToInfos.first,
          ),
        );
      }
    } else {
      add(const ShipToCodeEvent.initialized());
    }
  }

  @override
  Future<void> close() async {
    await _customerCodeBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<ShipToCodeState> change) {
    super.onChange(change);
    // print(change);
  }
}
