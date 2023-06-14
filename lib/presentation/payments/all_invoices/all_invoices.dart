import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/attention_row.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_drawer.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_status.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import 'package:ezrxmobile/presentation/core/snackbar.dart';

class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('All Invoices').tr(),
        actions: [
          BlocConsumer<DownloadPaymentAttachmentsBloc,
              DownloadPaymentAttachmentsState>(
            listenWhen: (previous, current) =>
                previous.failureOrSuccessOption !=
                    current.failureOrSuccessOption,
            buildWhen: (previous, current) =>
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
            builder: (context, state) {
              return TextButton(
                onPressed: state.isDownloadInProgress ? null : () {
                  final eligibilityState =
                      context.read<EligibilityBloc>().state;
                  final allInvoicesFilterState =
                      context.read<AllInvoicesFilterBloc>().state;
                  context.read<DownloadPaymentAttachmentsBloc>().add(
                        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
                          salesOrganization: eligibilityState.salesOrganisation,
                          customerCodeInfo: eligibilityState.customerCodeInfo,
                          queryObject: allInvoicesFilterState.allInvoicesFilter,
                        ),
                      );
                },
                child: state.isDownloadInProgress
                    ? const SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Download').tr(),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  key: const Key('statusFilterButton'),
                  onTap: () {
                    if (context.read<AllInvoicesBloc>().state.isLoading) return;
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (_) {
                        return const AllInvoicesStatusFilterBottomSheet();
                      },
                    );
                  },
                  child: BlocBuilder<AllInvoicesFilterBloc,
                      AllInvoicesFilterState>(
                    buildWhen: (previous, current) =>
                        previous.allInvoicesFilter.filterStatus !=
                        current.allInvoicesFilter.filterStatus,
                    builder: (context, state) {
                      return Row(
                        children: <Widget>[
                          Text(
                            "${'Status'.tr()} : ${state.allInvoicesFilter.filterStatus.tr()}",
                            key: const ValueKey('status'),
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.kPrimaryColor,
                                    ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
                  buildWhen: (previous, current) =>
                      previous.allInvoicesFilter.appliedFilterCount !=
                      current.allInvoicesFilter.appliedFilterCount,
                  builder: (context, state) {
                    return FilterCountButton(
                      filterCount: state.allInvoicesFilter.appliedFilterCount,
                      onTap: () {
                        if (!context.read<AllInvoicesBloc>().state.isLoading) {
                          context.read<AllInvoicesFilterBloc>().add(
                                const AllInvoicesFilterEvent.openFilterDrawer(),
                              );
                          scaffoldKey.currentState!.openEndDrawer();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      endDrawer: const AllInvoicesFilterDrawer(),
      body: BlocListener<AllInvoicesFilterBloc, AllInvoicesFilterState>(
        listenWhen: (previous, current) =>
            ((previous.changed != current.changed && current.changed) &&
                current.allInvoicesFilter.anyFilterApplied) ||
            previous.allInvoicesFilter.filterStatus !=
                current.allInvoicesFilter.filterStatus,
        listener: (context, state) {
          context.read<AllInvoicesBloc>().add(
                AllInvoicesEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  filter: state.allInvoicesFilter,
                ),
              );
        },
        child: BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return LoadingShimmer.logo(
                key: const Key('LoaderImage'),
              );
            }


            return AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: Column(
                children: [
                  const AttentionRow(
                    valueText:
                        'All Invoices due dates and document dates pre-set for past 28 days. Change the date ranges from “Filter” for more data',
                  ),
                  _InvoiceScrollList(state: state,),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _InvoiceScrollList extends StatelessWidget {
  const _InvoiceScrollList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final AllInvoicesState state;

  @override
  Widget build(BuildContext context) {
    final configs = context.read<SalesOrgBloc>().state.configs;

    return Expanded(
      child: ScrollList<CreditAndInvoiceItem>(
        emptyMessage: 'No invoice found'.tr(),
        controller: ScrollController(),
        onRefresh: () {
          context.read<AllInvoicesFilterBloc>().add(
                const AllInvoicesFilterEvent.clearFilters(),
              );
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
        },
        onLoadingMore: () {
          context.read<AllInvoicesBloc>().add(
                AllInvoicesEvent.loadMore(
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
        },
        isLoading: state.isLoading,
        itemBuilder: (context, index, item) => _InvoiceItem(
          invoiceItem: item,
          configs: configs,
        ),
        items: state.invoices,
      ),
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  const _InvoiceItem({
    Key? key,
    required this.invoiceItem,
    required this.configs,
  }) : super(key: key);

  final CreditAndInvoiceItem invoiceItem;
  final SalesOrganisationConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.read<CreditAndInvoiceDetailsBloc>().add(
                CreditAndInvoiceDetailsEvent.fetch(
                  creditAndInvoiceItem: invoiceItem,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                ),
              );
          context.router.push(InvoiceDetailsPageRoute(
            invoiceItem: invoiceItem,
          ));
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Due Date'.tr(),
              valueText: invoiceItem.netDueDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Document Number'.tr(),
              valueText: invoiceItem.accountingDocument,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Document Date'.tr(),
              valueText: invoiceItem.documentDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Debit Value'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                invoiceItem.amountInTransactionCurrency,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Status'.tr(),
              valueText: invoiceItem.invoiceProcessingStatus,
              keyFlex: 1,
              valueFlex: 1,
              valueColor: invoiceItem.invoiceProcessingStatus == 'Overdue'
                  ? ZPColors.red
                  : ZPColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
