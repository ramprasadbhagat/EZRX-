import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/domain/core/keyValue/key_value_pair.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSummaryPage extends StatelessWidget {
  const AccountSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.accountSummaryTab,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<AccountSummaryBloc>().add(
                AccountSummaryEvent.fetchInvoiceSummary(
                  custCode: context
                      .read<CustomerCodeBloc>()
                      .state
                      .customerCodeInfo
                      .customerCodeSoldTo,
                  salesOrg: context
                      .read<SalesOrgBloc>()
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
                      .read<SalesOrgBloc>()
                      .state
                      .salesOrganisation
                      .salesOrg,
                ),
              );
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
              buildWhen: (previous, current) =>
                  previous.isFetchingOutstandingBalance !=
                  current.isFetchingOutstandingBalance,
              builder: (context, state) {
                return BlocProvider(
                  create: (context) =>
                      locator<DownloadPaymentAttachmentsBloc>(),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AllInvoicesBloc>().add(
                            AllInvoicesEvent.fetch(
                              salesOrganisation: context
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
                              customerCodeInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .customerCodeInfo,
                              filter: AllInvoicesFilter.empty(),
                            ),
                          );
                      context.router.pushNamed('payments/all_invoices');
                    },
                    child: _ItemCard(
                      label: 'Invoices',
                      keyVal: getInvoices(
                        outstandingBalance: state.outstandingBalance,
                      ),
                      isFetching: state.isFetchingOutstandingBalance,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
              buildWhen: (previous, current) =>
                  previous.isFetchingCreditLimit !=
                  current.isFetchingCreditLimit,
              builder: (context, state) {
                return BlocProvider(
                  create: (context) =>
                      locator<DownloadPaymentAttachmentsBloc>(),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AllCreditsBloc>().add(
                            AllCreditsEvent.fetch(
                              salesOrganisation: context
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
                              customerCodeInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .customerCodeInfo,
                            ),
                          );
                      context.router.pushNamed('payments/all_credits');
                    },
                    child: _ItemCard(
                      label: 'Credits',
                      keyVal: getCredits(creditLimit: state.creditLimit),
                      isFetching: state.isFetchingCreditLimit,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'New Payment'.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    required this.label,
    required this.keyVal,
    required this.isFetching,
  });
  final String label;
  final List<KeyValuePair> keyVal;
  final bool isFetching;
  @override
  Widget build(BuildContext context) {
    final config = context.read<SalesOrgBloc>().state.configs;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Text(
            label.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          trailing: BlocConsumer<DownloadPaymentAttachmentsBloc,
              DownloadPaymentAttachmentsState>(
            listenWhen: (previous, current) =>
                previous.isDownloadInProgress != current.isDownloadInProgress,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {
                    showSnackBar(
                      context: context,
                      message: 'File downloaded successfully'.tr(),
                    );
                  },
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.isDownloadInProgress != current.isDownloadInProgress,
            builder: (context, state) {
              return FittedBox(
                child: LoadingShimmer.withChild(
                  enabled: state.isDownloadInProgress,
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.download_outlined,
                      color: ZPColors.skyBlueColor,
                      size: 16,
                    ),
                    label: Text(
                      'Download xlsx'.tr(),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.skyBlueColor,
                          ),
                    ),
                    onPressed: () {
                      if (label == 'Invoices') {
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
                                salesOrganization: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                queryObject: AllInvoicesFilter.fullyEmpty(),
                              ),
                            );
                      } else if (label == 'Credits') {
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
                                salesOrganization: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                queryObject: AllCreditsFilter.fullyEmpty(),
                              ),
                            );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: ZPColors.accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Column(
            children: keyVal
                .asMap()
                .entries
                .map(
                  (e) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.value.key,
                          ),
                          LoadingShimmer.withChild(
                            enabled: isFetching,
                            child: Text(
                              StringUtils.displayPrice(
                                config,
                                double.parse(e.value.value),
                              ),
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ],
                      ),
                      e.key < keyVal.length - 1
                          ? const SizedBox(
                              height: 14,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<KeyValuePair> getCredits({
  required CreditLimit creditLimit,
}) =>
    [
      KeyValuePair(
        key: 'Current remaining'.tr(),
        value: creditLimit.creditBalance.getOrDefaultValue('0'),
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

List<KeyValuePair> getInvoices({
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
