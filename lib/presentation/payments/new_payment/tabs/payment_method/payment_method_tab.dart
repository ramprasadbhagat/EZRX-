import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/selectable_expansion_tile.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/item_tile.dart';

class PaymentMethodTab extends StatelessWidget {
  const PaymentMethodTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            context.tr('Payment Info'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: AddressInfoSection.noAction(),
        ),
        const SizedBox(height: 20),
        BlocBuilder<NewPaymentBloc, NewPaymentState>(
          buildWhen: (previous, current) =>
              previous.selectedInvoices != current.selectedInvoices ||
              previous.selectedCredits != current.selectedCredits,
          builder: (context, state) {
            return Column(
              children: [
                ...state.allSelectedItems.map(
                  (e) => _InvoiceCreditItemTile(customerOpenItem: e),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _PaymentMethodSelector extends StatelessWidget {
  const _PaymentMethodSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod &&
          !current.isFetchingPaymentMethod,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod ||
          previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        return state.isFetchingPaymentMethod
            ? LoadingShimmer.logo()
            : CustomCard(
                margin: const EdgeInsets.all(20),
                child: state.paymentMethods.isNotEmpty
                    ? SelectableExpansionTileList(
                        expansionTileList: state.paymentMethods
                            .map(
                              (paymentMethod) => SelectableExpansionTile(
                                header: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  horizontalTitleGap: 1,
                                  leading: Radio(
                                    value: paymentMethod,
                                    groupValue: state.selectedPaymentMethod,
                                    onChanged: null,
                                  ),
                                  title: Text(
                                    paymentMethod.getValue(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                body: paymentMethod.isPaymentGateway
                                    ? const _PaymentGateWayDescription()
                                    : const SizedBox.shrink(),
                                onPress: () {
                                  context.read<NewPaymentBloc>().add(
                                        NewPaymentEvent
                                            .updatePaymentMethodSelected(
                                          paymentMethodSelected: paymentMethod,
                                        ),
                                      );
                                },
                                expanded: true,
                              ),
                            )
                            .toList(),
                      )
                    : const SizedBox.shrink(),
              );
      },
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
            context.tr('You have selected Payment Gateway'),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.primary),
          ),
          const SizedBox(height: 5),
          const _BulletedText(
            'Click “Next” to continue',
          ),
          const _BulletedText(
            'It might take few seconds for the payment gateway to open the new tab',
          ),
          _BulletedText(
            'Please do not click on the back button or refresh the page while the payment gateway is loading',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: ZPColors.skyBlueColor),
          ),
          const _BulletedText(
            'Payment advice you can download after the payment process or from the payment summary page',
          ),
          const _BulletedText(
            'Payment advice you can download after the payment process or from the payment summary page',
          ),
          const _BulletedText(
            'The payment advice copy will be sent to the email associated with this account',
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
                  text: context.tr('Disclaimer'),
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall
                      ?.copyWith(color: ZPColors.primary),
                ),
                const TextSpan(
                  text: ' : ',
                ),
                TextSpan(
                  text: context.tr('ezrx does not store your card information'),
                ),
              ],
            ),
          ),
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
            context.tr(text),
            textAlign: TextAlign.left,
            softWrap: true,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
