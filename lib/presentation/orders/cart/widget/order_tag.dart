import 'package:flutter/cupertino.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/core/status_label.dart';

class OrderTag extends StatelessWidget {
  const OrderTag({
    Key? key,
    required this.cartItem,
  }) : super(key: key);
  final PriceAggregate cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isUpdatingStock != current.isUpdatingStock &&
          !current.isUpdatingStock,
      builder: (context, state) {
        final finalCartItem = state.cartProducts.firstWhere(
          (element) => element.getMaterialNumber == cartItem.getMaterialNumber,
          orElse: () => PriceAggregate.empty(),
        );
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        final statusType = finalCartItem.productTag(
          context.read<EligibilityBloc>().state.validateOutOfStockValue,
        );

        return salesOrgConfig.hideStockDisplay ||
                finalCartItem.inStock ||
                state.isUpdatingStock
            ? const SizedBox.shrink()
            : StatusLabel(
                status: statusType,
                valueColor: statusType.displayStatusTextColor,
              );
      },
    );
  }
}
