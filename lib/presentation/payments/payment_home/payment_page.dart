import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/keyValue/key_value_pair.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'widgets/account_statement.dart';
part 'widgets/payment_option.dart';
part 'widgets/payment_summary.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.paymentsTabPage,
      appBar: AppBar(
        key: WidgetKeys.paymentHomeAppBar,
        title: Text(context.tr('Payments')),
        centerTitle: false,
      ),
      bottomNavigationBar: const _NewPaymentButton(),
      body: RefreshIndicator(
        onRefresh: () async => _refreshPayment(context),
        child: ListView(
          key: WidgetKeys.paymentHome,
          padding: const EdgeInsets.all(16.0),
          children: [
            AnnouncementWidget(currentPath: context.router.currentPath),
            const _PaymentOptionMenu(),
            const SizedBox(height: 20),
            const _Invoice(),
            const SizedBox(height: 20),
            const _Credit(),
            const SizedBox(height: 20),
            const _PaymentSummary(),
            const SizedBox(height: 20),
            const _AccountStatement(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _refreshPayment(BuildContext context) {
    context.read<PaymentInProgressBloc>().add(
          PaymentInProgressEvent.fetch(
            salesOrganization:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
          ),
        );
    context.read<AccountSummaryBloc>().add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: context
                .read<CustomerCodeBloc>()
                .state
                .customerCodeInfo
                .customerCodeSoldTo,
            salesOrg: context
                .read<EligibilityBloc>()
                .state
                .salesOrganisation
                .salesOrg,
          ),
        );

    context.read<AccountSummaryBloc>().add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: context
                .read<CustomerCodeBloc>()
                .state
                .customerCodeInfo
                .customerCodeSoldTo,
            salesOrg: context
                .read<EligibilityBloc>()
                .state
                .salesOrganisation
                .salesOrg,
          ),
        );
    context.read<SoaBloc>().add(
          SoaEvent.fetch(
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
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
          key: WidgetKeys.newPaymentButton,
          onPressed: () => _toNewPayment(context),
          child: Text(
            context.tr('New Payment'),
          ),
        ),
      ),
    );
  }

  void _toNewPayment(BuildContext context) {
    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        );
    context.read<NewPaymentBloc>().add(
          NewPaymentEvent.initialized(
            user: context.read<EligibilityBloc>().state.user,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
          ),
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
          key: WidgetKeys.paymentHomeInvoiceCard,
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
          key: 'Total Outstanding',
          value: outstandingBalance.amount.displayNAIfEmpty,
          widgetKey: WidgetKeys.totalOutstanding,
        ),
        KeyValuePair(
          key: 'Total Overdue',
          value: outstandingBalance.overdue.displayNAIfEmpty,
          widgetKey: WidgetKeys.totalOverdue,
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
          key: WidgetKeys.paymentHomeCreditCard,
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
          key: 'Total credit limit',
          value: creditLimit.creditLimit.displayNAIfEmpty,
          widgetKey: WidgetKeys.totalCreditLimit,
        ),
        KeyValuePair(
          key: 'Credit limit utilized',
          value: creditLimit.creditExposure.displayNAIfEmpty,
          widgetKey: WidgetKeys.creditLimitUtilized,
        ),
        KeyValuePair(
          key: 'Credit limit remaining',
          value: creditLimit.creditBalance.displayNAIfEmpty,
          widgetKey: WidgetKeys.creditLimitRemaining,
        ),
      ];
}

class _ItemCard extends StatefulWidget {
  const _ItemCard({
    required this.keyVal,
    required this.isFetching,
    Key? key,
  }) : super(key: key);

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
        color: ZPColors.lightSilver,
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
                      key: e.value.widgetKey,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr(e.value.key),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 2),
                        widget.isFetching
                            ? SizedBox(
                                width: 100,
                                child: LoadingShimmer.tile(),
                              )
                            : PriceComponent(
                                salesOrgConfig: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrgConfigs,
                                price: e.value.value,
                                obscured: obscured,
                              ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          IconButton(
            key: WidgetKeys.paymentHomeObscuredAmount,
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
