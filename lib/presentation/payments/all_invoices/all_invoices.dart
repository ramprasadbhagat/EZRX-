import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Column(
          children: [
            BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
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
                return Expanded(
                  child: state.isLoading && state.items.groupList.isEmpty
                      ? LoadingShimmer.logo(
                          key: WidgetKeys.loaderImage,
                        )
                      : ScrollList<CreditAndInvoiceGroup>(
                          noRecordFoundWidget: NoRecordFound(
                            title: 'No invoice found'.tr(),
                          ),
                          controller: ScrollController(),
                          onRefresh: () => context.read<AllInvoicesBloc>().add(
                                AllInvoicesEvent.fetch(
                                  appliedFilter:
                                      AllInvoicesFilter.empty().copyWith(
                                    searchKey: context
                                        .read<AllInvoicesBloc>()
                                        .state
                                        .appliedFilter
                                        .searchKey,
                                  ),
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                ),
                              ),
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
                                  ),
                                );
                          },
                          isLoading: state.isLoading,
                          itemBuilder: (context, index, item) => _InvoiceGroup(
                            data: item,
                            showDivider: index != 0,
                          ),
                          items: state.items.groupList,
                        ),
                );
              },
            ),
          ],
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
                children: data.items
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
          context.router.push(
            InvoiceDetailsPageRoute(
              invoiceItem: invoiceItem,
            ),
          );
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Invoice #${invoiceItem.searchKey}',
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
                    'Order #${invoiceItem.orderId.displayNAIfEmpty}',
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
            PriceComponent(
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              price: invoiceItem.amountInTransactionCurrency.toString(),
              currencyCodeTextStyle:
                  Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ZPColors.primary,
                      ),
              priceTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
