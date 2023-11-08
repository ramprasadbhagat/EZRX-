import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/widgets/item_tile.dart';

class PaymentMethodTab extends StatelessWidget {
  const PaymentMethodTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: ZPColors.lightBlueColor,
          ),
          child: Column(
            children: [
              Text(
                context.tr(
                  'Please note that once the Payment Advice is created, you can no longer add or remove invoices/credit notes. ',
                ),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ZPColors.shadesBlack,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                context.tr(
                  'Please review and confirm the information below before you proceed. If there are any errors, you’ll be required to delete and create a new Payment Advice.',
                ),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ZPColors.shadesBlack,
                    ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            context.tr('Select payment method'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        const _PaymentMethodSelector(),
        const Divider(
          height: 40,
          endIndent: 0,
          indent: 0,
          color: ZPColors.lightGray2,
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            context.tr('Payment details'),
            style: Theme.of(context).textTheme.labelLarge,
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
        const Divider(
          height: 40,
          endIndent: 0,
          indent: 0,
          color: ZPColors.lightGray2,
          thickness: 0.5,
        ),
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
            : state.paymentMethods.isNotEmpty
                ? Column(
                    children: [
                      Wrap(
                        children: state.paymentMethods
                            .map(
                              (paymentMethod) => ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                horizontalTitleGap: 1,
                                leading: Radio(
                                  key: WidgetKeys.radioPaymentGateway,
                                  value: paymentMethod,
                                  groupValue: state.selectedPaymentMethod,
                                  onChanged:null,
                                ),
                                onTap: () {
                                  context.read<NewPaymentBloc>().add(
                                        NewPaymentEvent
                                            .updatePaymentMethodSelected(
                                          paymentMethodSelected: paymentMethod,
                                        ),
                                      );
                                },
                                title: Text(
                                  paymentMethod.getValue(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
      },
    );
  }
}
