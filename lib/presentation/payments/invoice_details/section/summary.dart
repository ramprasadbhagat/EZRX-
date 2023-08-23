import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            'Total summary'.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal with tax'.tr()),
              PriceComponent(
                salesOrgConfig: salesOrgConfigs,
                price: invoiceItem.amountInTransactionCurrency.toString(),
              ),
            ],
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
              Text('Grand total'.tr()),
              PriceComponent(
                salesOrgConfig: salesOrgConfigs,
                price: invoiceItem.amountInTransactionCurrency.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
