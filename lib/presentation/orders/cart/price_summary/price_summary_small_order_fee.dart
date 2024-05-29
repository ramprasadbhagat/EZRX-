part of 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';

class _AplSmallOrderFee extends StatelessWidget {
  final CartState cartState;

  const _AplSmallOrderFee({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return SmallOrderFeeSection(
      value: cartState.aplSimulatorOrder.smallOrderFee,
      message: context.tr(
        'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
        namedArgs: {
          'smallOrderFee': StringUtils.priceComponentDisplayPrice(
            eligibilityState.salesOrgConfigs,
            eligibilityState.salesOrg.smallOrderThreshold,
            false,
          ),
        },
      ),
    );
  }
}
