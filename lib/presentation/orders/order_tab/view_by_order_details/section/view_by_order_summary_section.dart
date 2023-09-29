import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;
    final taxDisplayForOrderHistoryAndDetails = context
        .read<SalesOrgBloc>()
        .state
        .configs
        .taxDisplayForOrderHistoryAndDetails;
    final orderDetails =
        context.read<ViewByOrderDetailsBloc>().state.orderHistoryDetails;

    final isMYExternalSalesRep =
        context.read<EligibilityBloc>().state.isMYExternalSalesRepUser;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Order Summary'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          BalanceTextRow(
            keyText: context.tr('Subtotal (excl. tax)'),
            valueText: orderDetails.orderNumber.isValid()
                ? StringUtils.displayPrice(
                    salesOrgConfigs,
                    orderDetails.orderedItemsValue(isMYExternalSalesRep),
                  )
                : context.tr('NA'),
          ),
          /* BalanceTextRow(   //TODO:It will be applicable only for SG market so once get all details will enhance and allign with web
          keyText: 'Tax at x%',
          valueText: viewByOrderHistoryItem.totalTax.toString(),
        ),
        const BalanceTextRow(
          keyText: 'Stamp duty',
          valueText: '',
        ),
        const BalanceTextRow(
          keyText: 'Small order fee',
          valueText: '',
        ),*/
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            thickness: 1,
            color: ZPColors.lightGray2,
          ),
          BalanceTextRow(
            keyText: context.tr('Grand total'),
            valueText: orderDetails.orderNumber.isValid()
                ? StringUtils.displayPrice(
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                    taxDisplayForOrderHistoryAndDetails
                        ? orderDetails.grandTotal(isMYExternalSalesRep)
                        : orderDetails.orderedItemsValue(isMYExternalSalesRep),
                  )
                : context.tr('NA'),
          ),
          // const BalanceTextRow(
          //   keyText: 'Total savings', // TODO: after getting information will enhance and allign with web
          //   valueText: '',
          // ),
        ],
      ),
    );
  }
}
