import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_eligibility_event.dart';
part 'order_eligibility_state.dart';
part 'order_eligibility_bloc.freezed.dart';

class OrderEligibilityBloc
    extends Bloc<OrderEligibilityEvent, OrderEligibilityState> {
  final IOrderRepository repository;
  OrderEligibilityBloc({
    required this.repository,
  }) : super(OrderEligibilityState.initial()) {
    on<OrderEligibilityEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderEligibilityEvent event,
    Emitter<OrderEligibilityState> emit,
  ) async {
    event.map(
      checkMinimumOrderValue: (e) {
        emit(state.copyWith(
          eligibleForOrderSubmit: false,
        ));
        final minOrderValuePassed = repository.checkMinOrderValue(
          cartItems: e.cartItems,
          configs: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          grandTotal: e.grandTotal,
          orderType: e.orderType,
          salesOrg: e.salesOrg,
          shipInfo: e.shipInfo,
          user: e.user,
        );
        emit(state.copyWith(
          eligibleForOrderSubmit: minOrderValuePassed,
        ));
      },
    );
  }
}
