import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/payments/entities/invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class AllInvoicesPage extends StatelessWidget {
  const AllInvoicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('All Invoices').tr(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      "${'Status'.tr()} : ",
                      key: const ValueKey('status'),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                    ),
                  ],
                ),
                FilterCountButton(
                  filterCount: 0,
                  onTap: () {
                    //open filter drawer
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: const _AllInvoicesList(),
      ),
    );
  }
}
class _AllInvoicesList extends StatelessWidget {
  const _AllInvoicesList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllInvoicesBloc, AllInvoicesState>(
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
          previous.isLoading != current.isLoading ||
          previous.sortDirection != current.sortDirection,
      builder: (context, state) {
        final configs = context.read<SalesOrgBloc>().state.configs;

        return state.isLoading 
            ? LoadingShimmer.logo(
                key: const Key('LoaderImage'),
              )
            : ScrollList<InvoiceItem>(
                emptyMessage: 'No Request for Payment found'.tr(),
                onRefresh: () {
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
                          sortDirection: 'desc',
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
                          sortDirection: 'desc',
                        ),
                      );
                },
                isLoading: state.isLoading,
                itemBuilder: (context, index, item) => _InvoiceItem(
                  invoiceItem: item,
                  configs: configs,
                ),
                items: state.invoices,
              );
      },
    );
  }
}

class _InvoiceItem extends StatelessWidget {
  const _InvoiceItem({
    Key? key,
    required this.invoiceItem,
    required this.configs,
  }) : super(key: key);

  final InvoiceItem invoiceItem;
  final SalesOrganisationConfigs configs;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
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
              keyText: 'Debit Value (SGD)'.tr(),
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
              isStatus: true,
            ),
          ],
        ),
      ),
    );
  }
}
