import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';

class InvoiceSummary extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;

  const InvoiceSummary({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Total summary'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr(salesOrgConfigs.salesOrg.subTotalText)}:',
              ),
              PriceComponent(
                type: PriceStyle.summaryPrice,
                key: WidgetKeys.invoiceDetailSubTotal,
                salesOrgConfig: salesOrgConfigs,
                price: salesOrgConfigs.salesOrg.isID
                    ? invoiceItem.totalExcludeTax.toString()
                    : invoiceItem.amountInTransactionCurrency.toString(),
              ),
            ],
          ),
          if (salesOrgConfigs.salesOrg.isID)
            _SummaryBreakDownForID(
              invoiceItem: invoiceItem,
            ),
          const Divider(
            endIndent: 0,
            indent: 0,
            color: ZPColors.extraLightGrey2,
            height: 20,
            thickness: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Grand total')}:',
              ),
              PriceComponent(
                type: PriceStyle.totalPrice,
                key: WidgetKeys.invoiceDetailGrandTotal,
                salesOrgConfig: salesOrgConfigs,
                price: invoiceItem.amountInTransactionCurrency.toString(),
              ),
            ],
          ),
          if (salesOrgConfigs.salesOrg.isID)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Total savings')}:',
                  ),
                  PriceComponent(
                    type: PriceStyle.summaryPrice,
                    key: WidgetKeys.invoiceDetailSubTotal,
                    salesOrgConfig: salesOrgConfigs,
                    price: invoiceItem.discount.toString(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SummaryBreakDownForID extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const _SummaryBreakDownForID({Key? key, required this.invoiceItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Tax at')} ${salesOrgConfigs.vatValue}%:',
              ),
              PriceComponent(
                type: PriceStyle.summaryPrice,
                key: WidgetKeys.invoiceDetailSubTotal,
                salesOrgConfig: salesOrgConfigs,
                price: invoiceItem.taxAmount.toString(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.tr('Small order fee')}:',
                    ),
                    Text(
                      context.tr('Applies to orders less than IDR 300,000 '),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10),
                    ),
                  ],
                ),
                PriceComponent(
                  type: PriceStyle.summaryPrice,
                  key: WidgetKeys.invoiceDetailSubTotal,
                  salesOrgConfig: salesOrgConfigs,
                  price: invoiceItem.deliveryFee.toString(),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Manual Fee')}:',
              ),
              PriceComponent(
                type: PriceStyle.summaryPrice,
                key: WidgetKeys.invoiceDetailSubTotal,
                salesOrgConfig: salesOrgConfigs,
                price: invoiceItem.manualFee.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
