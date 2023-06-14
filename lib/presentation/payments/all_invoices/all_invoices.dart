import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/history/status_label.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_drawer.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_status.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Invoices').tr(),
        actions: const [
          SizedBox.shrink(),
        ],
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
        child: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        onSearchChanged: (String value) {},
                        clearIconKey: WidgetKeys.clearIconKey,
                        controller: TextEditingController(),
                        onClear: () {},
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (context.read<AllInvoicesBloc>().state.isLoading) {
                          return;
                        }
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return const AllInvoicesStatusFilterBottomSheet();
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.tune,
                      ),
                    ),
                  ],
                ),
              ),
              BlocListener<AllInvoicesFilterBloc, AllInvoicesFilterState>(
                listenWhen: (previous, current) =>
                    ((previous.changed != current.changed && current.changed) &&
                        current.allInvoicesFilter.anyFilterApplied) ||
                    previous.allInvoicesFilter.filterStatus !=
                        current.allInvoicesFilter.filterStatus,
                listener: (context, state) {
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
                          filter: state.allInvoicesFilter,
                        ),
                      );
                },
                child: BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
                  listenWhen: (previous, current) =>
                      previous.failureOrSuccessOption !=
                      current.failureOrSuccessOption,
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

                    return Expanded(
                      child: ScrollList<CreditAndInvoiceGroup>(
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
                        itemBuilder: (context, index, item) => _InvoiceGroup(
                          data: item,
                          showDivider: index != 0,
                        ),
                        items: state.groups,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InvoiceGroup extends StatelessWidget {
  final CreditAndInvoiceGroup data;
  final bool showDivider;
  const _InvoiceGroup({
    Key? key,
    required this.data,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Documents created on ${data.dueDate.toValidDateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: data.invoiceItems
                    .map(
                      (e) => _InvoiceItem(invoiceItem: e),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const _InvoiceItem({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListTile(
        onTap: () {},
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoice #${invoiceItem.accountingDocument}',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                StatusLabel(
                  status: StatusType(
                    invoiceItem.invoiceProcessingStatus.getOrDefaultValue(''),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${invoiceItem.orderId}',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'Due on ${invoiceItem.netDueDate.toSimpleDateString}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: invoiceItem
                              .invoiceProcessingStatus.displayDueDateColor,
                        ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '${invoiceItem.transactionCurrency} ',
                style: Theme.of(context).textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: StringUtils.displayPrice(
                      context.read<SalesOrgBloc>().state.configs,
                      invoiceItem.amountInTransactionCurrency,
                    ),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
