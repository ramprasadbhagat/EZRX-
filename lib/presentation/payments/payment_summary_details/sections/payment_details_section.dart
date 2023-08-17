//ignore_for_file: unused-code

//ignore_for_file: unused-class

//ignore_for_file: unused-files
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    Key? key,
    required this.paymentSummaryDetails,
    required this.paymentItemState,
  }) : super(key: key);
  final PaymentSummaryDetails paymentSummaryDetails;
  final PaymentItemState paymentItemState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PaymentDetailsSection(
          paymentSummaryDetails: paymentSummaryDetails,
        ),
        const _PaymentInfoSection(),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _InvoiceSummarySection(
          paymentItemState: paymentItemState,
          total: paymentSummaryDetails.paymentAmount,
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}

class _PaymentDetailsSection extends StatelessWidget {
  const _PaymentDetailsSection({
    Key? key,
    required this.paymentSummaryDetails,
  }) : super(key: key);
  final PaymentSummaryDetails paymentSummaryDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: ZPColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Payment #${paymentSummaryDetails.zzAdvice.displayDashIfEmpty}',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ZPColors.white),
                ),
              ),
              StatusLabel(
                status: StatusType(
                  paymentSummaryDetails.status.displayStringValue,
                ),
              ),
            ],
          ),
          Column(
            children: [
              BalanceTextRow(
                keyText: 'Payment method'.tr(),
                valueText: paymentSummaryDetails.paymentMethod.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: 'PA created date'.tr(),
                valueText: paymentSummaryDetails.createdDate.dateString.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: 'Advice expiry'.tr(),
                valueText: paymentSummaryDetails.adviceExpiryText,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: 'Payment date'.tr(),
                valueText: paymentSummaryDetails.paymentDate,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentInfoSection extends StatelessWidget {
  const _PaymentInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          child: Text(
            'Payment details'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const ItemAddressSection(),
      ],
    );
  }
}

class _InvoiceSummarySection extends StatelessWidget {
  const _InvoiceSummarySection({
    Key? key,
    required this.paymentItemState,
    required this.total,
  }) : super(key: key);
  final PaymentItemState paymentItemState;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment summary'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          _PriceWidget(
            title: 'Invoice total:',
            price: paymentItemState.paymentItemList.invoiceTotal.toString(),
          ),
          _PriceWidget(
            title: 'Credits applied:',
            price: paymentItemState.paymentItemList.creditTotal.toString(),
          ),
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
          _PriceWidget(
            title: 'Total:',
            price: total.toString(),
            priceStyle: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    Key? key,
    required this.title,
    required this.price,
    this.priceStyle,
  }) : super(key: key);
  final String title;
  final String price;
  final TextStyle? priceStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: price,
        ),
      ],
    );
  }
}
