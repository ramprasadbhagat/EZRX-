import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_section.dart';

class PriceSummaryTile extends StatelessWidget {
  final CartState cartState;

  const PriceSummaryTile({
    Key? key,
    required this.cartState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.priceSummaryListTile,
      onTap: () => _showOrderSummary(context, cartState),
      dense: true,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      title: Text(
        context.tr(
          '{qty} items',
          namedArgs: {'qty': cartState.totalCartCount.toString()},
        ),
        key: WidgetKeys.priceSummaryTotalQty,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _DisplayPrice(
                priceComponent: PriceComponent(
                  key: WidgetKeys.priceSummaryGrandTotal,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartState.grandTotalHidePriceMaterial.toString(),
                  title: '${context.tr('Grand total')}: ',
                  priceLabelStyle:
                      Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.extraLightGrey4,
                          ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: ZPColors.neutralsBlack,
          ),
        ],
      ),
    );
  }

  void _showOrderSummary(BuildContext context, CartState cartState) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => Padding(
        key: WidgetKeys.priceSummarySheet,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PriceSummarySection(cartState: cartState),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: WidgetKeys.closeButton,
                onPressed: () => context.router.pop(),
                child: Text(
                  context.tr('Close'),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
