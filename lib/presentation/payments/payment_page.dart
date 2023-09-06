import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/core/keyValue/key_value_pair.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_option.dart';
import 'package:ezrxmobile/presentation/payments/widgets/account_statement.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.paymentsTabPage,
      appBar: AppBar(
        title: const Text('Payments').tr(),
        centerTitle: false,
      ),
      bottomNavigationBar: const _NewPaymentButton(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AnnouncementWidget(currentPath: context.router.currentPath),
          const PaymentOptionMenu(),
          const SizedBox(height: 20),
          const _Invoice(),
          const SizedBox(height: 20),
          const _Credit(),
          const SizedBox(height: 20),
          const _PaymentSummary(),
          const SizedBox(height: 20),
          const AccountStatement(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _NewPaymentButton extends StatelessWidget {
  const _NewPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: ZPColors.boxShadowGray,
            ),
          ],
          color: ZPColors.white,
        ),
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
          top: 16,
          bottom: 30,
        ),
        child: ElevatedButton(
          onPressed: () => _toNewPayment(context),
          child: Text(
            'New Payment'.tr(),
          ),
        ),
      ),
    );
  }

  void _toNewPayment(BuildContext context) {
    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: AvailableCreditFilter.empty(),
          ),
        );
    context.read<NewPaymentBloc>().add(
          const NewPaymentEvent.initialized(),
        );
    context.router.pushNamed('payments/new_payment');
  }
}

class _Invoice extends StatelessWidget {
  const _Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
      buildWhen: (previous, current) =>
          previous.isFetchingOutstandingBalance !=
          current.isFetchingOutstandingBalance,
      builder: (context, state) {
        return _ItemCard(
          keyVal: _getInvoices(outstandingBalance: state.outstandingBalance),
          isFetching: state.isFetchingOutstandingBalance,
        );
      },
    );
  }

  List<KeyValuePair> _getInvoices({
    required OutstandingBalance outstandingBalance,
  }) =>
      [
        KeyValuePair(
          key: 'Total Outstanding'.tr(),
          value: outstandingBalance.amount,
        ),
        KeyValuePair(
          key: 'Total Overdue'.tr(),
          value: outstandingBalance.overdue,
        ),
      ];
}

class _Credit extends StatelessWidget {
  const _Credit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
      buildWhen: (previous, current) =>
          previous.isFetchingCreditLimit != current.isFetchingCreditLimit,
      builder: (context, state) {
        return _ItemCard(
          keyVal: _getCredits(creditLimit: state.creditLimit),
          isFetching: state.isFetchingCreditLimit,
        );
      },
    );
  }

  List<KeyValuePair> _getCredits({
    required CreditLimit creditLimit,
  }) =>
      [
        KeyValuePair(
          key: 'Current remaining'.tr(),
          value: creditLimit.creditBalance.displayAmount,
        ),
        KeyValuePair(
          key: 'Total used'.tr(),
          value: creditLimit.creditExposure.getOrDefaultValue('0'),
        ),
        KeyValuePair(
          key: 'Total credit limit'.tr(),
          value: creditLimit.creditLimit.getOrDefaultValue('0'),
        ),
      ];
}

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      buildWhen: (previous, current) =>
          previous.paymentSummaryDetailsResponse.totalPaymentInProgress !=
          current.paymentSummaryDetailsResponse.totalPaymentInProgress,
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Payment summary',
              onTapIconButton: () =>
                  context.router.pushNamed('payments/payment_summary'),
            ),
            _ItemCard(
              keyVal: [
                KeyValuePair(
                  key: 'In progress',
                  value: state.paymentSummaryDetailsResponse
                      .totalPaymentInProgress.displayAmount,
                ),
              ],
              isFetching: state.isFetching,
            ),
          ],
        );
      },
    );
  }
}

class _ItemCard extends StatefulWidget {
  const _ItemCard({
    required this.keyVal,
    required this.isFetching,
  });
  final List<KeyValuePair> keyVal;
  final bool isFetching;

  @override
  State<_ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<_ItemCard> {
  bool obscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: ZPColors.accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.keyVal
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.value.key,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        LoadingShimmer.withChild(
                          enabled: widget.isFetching,
                          child: PriceComponent(
                            salesOrgConfig:
                                context.read<SalesOrgBloc>().state.configs,
                            price: e.value.value,
                            obscured: obscured,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.topRight,
            color: ZPColors.shadesGray,
            icon: Icon(
              obscured
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: () => setState(() => obscured = !obscured),
          ),
        ],
      ),
    );
  }
}
