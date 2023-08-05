import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/credit_item_card.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/invoice_item_card.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/selectable_expansion_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodTab extends StatelessWidget {
  const PaymentMethodTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return ListView(
          children: [
            const _PaymentMethodSelector(),
            const Divider(
              height: 40,
              endIndent: 0,
              indent: 0,
              color: ZPColors.lightGray2,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Payment Info'.tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            const ItemAddressSection(),
            ...state.selectedInvoices
                .map(
                  (e) => CustomCard(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: InvoiceItemCard(customerOpenItem: e),
                  ),
                )
                .toList(),
            ...state.selectedCredits
                .map(
                  (e) => CustomCard(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: CreditItemCard(customerOpenItem: e),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}

enum _PaymentMethod {
  paymentGateway,
  bankTransfer,
}

class _PaymentMethodSelector extends StatefulWidget {
  const _PaymentMethodSelector({Key? key}) : super(key: key);

  @override
  State<_PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<_PaymentMethodSelector> {
  _PaymentMethod selectedPaymentMethod = _PaymentMethod.paymentGateway;
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          SelectableExpansionTileList(
            expansionTileList: [
              SelectableExpansionTile(
                header: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  horizontalTitleGap: 1,
                  leading: Radio(
                    value: _PaymentMethod.paymentGateway,
                    groupValue: selectedPaymentMethod,
                    onChanged: null,
                  ),
                  title: Text(
                    'Payment Gateway'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                body: const _PaymentGateWayDescription(),
                onPress: () => setState(
                  () => selectedPaymentMethod = _PaymentMethod.paymentGateway,
                ),
                expanded: true,
              ),
              SelectableExpansionTile(
                header: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  leading: Radio(
                    value: _PaymentMethod.bankTransfer,
                    groupValue: selectedPaymentMethod,
                    onChanged: null,
                  ),
                  horizontalTitleGap: 1,
                  title: Text(
                    'Bank Transfer'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                body: const _BankTransferDescription(),
                onPress: () => setState(
                  () => selectedPaymentMethod = _PaymentMethod.bankTransfer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentGateWayDescription extends StatelessWidget {
  const _PaymentGateWayDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: const BoxDecoration(
        color: ZPColors.inputBorderColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You have selected Payment Gateway'.tr(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 5),
          _BulletedText(
            'Click “Next” to continue'.tr(),
          ),
          _BulletedText(
            'It might take few seconds for the payment gateway to open the new tab'
                .tr(),
          ),
          _BulletedText(
            'Please do not click on the back button or refresh the page while the payment gateway is loading'
                .tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: ZPColors.skyBlueColor),
          ),
          _BulletedText(
            'Payment advice you can download after the payment process or from the payment summary page'
                .tr(),
          ),
          _BulletedText(
            'Payment advice you can download after the payment process or from the payment summary page'
                .tr(),
          ),
          _BulletedText(
            'The payment advice copy will be sent to the email associated with this account'
                .tr(),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ZPColors.extraLightGrey4),
              children: <TextSpan>[
                TextSpan(
                  text: 'Disclaimer'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.primary),
                ),
                const TextSpan(
                  text: ' : ',
                ),
                TextSpan(
                  text: 'ezrx does not store your card information'.tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BankTransferDescription extends StatelessWidget {
  const _BankTransferDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: const BoxDecoration(
        color: ZPColors.inputBorderColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Information'.tr(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.primary),
          ),
          Text(
            'SC Bank 461-10-012622 Account Holder : Zuellig Pharma Korea'.tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 20),
          Text(
            'The sender must be the name of the representative/hospital.'.tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            '(Ex.) Hong Gil-dong / Hong Gil-dong Internal Medicine Department'
                .tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'Deposit confirmation may be delayed if it is not during banking hours'
                .tr(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            'Note: If payment is not received within 2 days of placing an order, the order will be automatically canceled.'
                .tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BulletedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const _BulletedText(
    this.text, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = style ??
        Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: ZPColors.extraLightGrey4);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.left,
            softWrap: true,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
