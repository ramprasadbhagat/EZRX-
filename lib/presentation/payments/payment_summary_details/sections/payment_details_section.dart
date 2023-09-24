import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
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
                  '${context.tr('PA')} #${paymentSummaryDetails.zzAdvice.displayDashIfEmpty}',
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
                keyText: context.tr('Payment method'),
                valueText: context.tr(paymentSummaryDetails.paymentMethod),
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('PA created date'),
                valueText: paymentSummaryDetails.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Advice expiry'),
                valueText: paymentSummaryDetails.adviceExpiryText,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: paymentSummaryDetails
                          .status.getAdviceExpiryTextColorForFailed,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Payment date'),
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
            context.tr('Payment details'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddressInfoSection.noAction(),
        ),
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
            context.tr('Payment summary'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          _PriceWidget(
            title: 'Invoice total:',
            price: paymentItemState.paymentItemList.invoiceTotal.toString(),
            type: PriceStyle.totalPrice,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.tr('Credits applied:'),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              PriceComponent(
                type: PriceStyle.credits,
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: paymentItemState.paymentItemList.creditTotal.toString(),
              ),
            ],
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
            type: PriceStyle.grandTotalPrice,
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
    this.type = PriceStyle.commonPrice,
  }) : super(key: key);
  final String title;
  final String price;
  final PriceStyle type;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.tr(title),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: price,
          type: type,
        ),
      ],
    );
  }
}
