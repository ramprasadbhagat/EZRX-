import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_eligibility_event.dart';
part 'order_eligibility_state.dart';
part 'order_eligibility_bloc.freezed.dart';

class OrderEligibilityBloc
    extends Bloc<OrderEligibilityEvent, OrderEligibilityState> {
  OrderEligibilityBloc() : super(OrderEligibilityState.initial()) {
    on<OrderEligibilityEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderEligibilityEvent event,
    Emitter<OrderEligibilityState> emit,
  ) async {
    event.map(
      initialized: (e) => emit(
        state.copyWith(
          cartItems: e.cartItems,
          configs: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          grandTotal: e.grandTotal,
          orderType: e.orderType,
          salesOrg: e.salesOrg,
          shipInfo: e.shipInfo,
          user: e.user,
          subTotal: e.subTotal,
        ),
      ),
      update: (e) => emit(
        state.copyWith(
          subTotal: e.subTotal,
          grandTotal: e.grandTotal,
          cartItems: e.cartItems,
          orderType: e.orderType,
        ),
      ),
    );
  }
}
