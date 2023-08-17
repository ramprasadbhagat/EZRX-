import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/filter/outstanding_invoice_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/widgets/invoice_item_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

class OutstandingInvoicesTab extends StatelessWidget {
  const OutstandingInvoicesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              _FilterTune(),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: ZPColors.lightBorderYellow,
          ),
          child: Row(
            children: [
              Text(
                'Outstanding: '.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: ZPColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: context
                    .read<AccountSummaryBloc>()
                    .state
                    .outstandingBalance
                    .amount,
              ),
            ],
          ),
        ),
        BlocConsumer<OutstandingInvoicesBloc, OutstandingInvoicesState>(
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
            return Expanded(
              child: state.isLoading && state.items.isEmpty
                  ? LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ScrollList<CustomerOpenItem>(
                        noRecordFoundWidget: NoRecordFound(
                          title: 'No record found'.tr(),
                        ),
                        controller: ScrollController(),
                        onRefresh: () {
                          context.read<OutstandingInvoicesBloc>().add(
                                OutstandingInvoicesEvent.fetch(
                                  salesOrganisation: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrganisation,
                                  customerCodeInfo: context
                                      .read<CustomerCodeBloc>()
                                      .state
                                      .customerCodeInfo,
                                  appliedFilter:
                                      OutstandingInvoiceFilter.empty(),
                                ),
                              );
                        },
                        onLoadingMore: () {
                          context.read<OutstandingInvoicesBloc>().add(
                                OutstandingInvoicesEvent.loadMore(
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
                        itemBuilder: (context, index, item) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _PaymentItem(
                            data: item,
                          ),
                        ),
                        items: state.items,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  const _PaymentItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CustomerOpenItem data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocBuilder<NewPaymentBloc, NewPaymentState>(
        builder: (context, state) {
          return EdgeCheckbox(
            onChanged: (bool value) {
              context.read<NewPaymentBloc>().add(
                    NewPaymentEvent.toggleInvoice(selected: value, item: data),
                  );
            },
            value: state.selectedInvoices.contains(data),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: InvoiceItemCard(customerOpenItem: data),
            ),
          );
        },
      ),
    );
  }
}

class _FilterTune extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoicesBloc, OutstandingInvoicesState>(
      builder: (context, state) {
        return CustomBadge(
          Icons.tune,
          count: state.appliedFilter.appliedFilterCount,
          badgeColor: ZPColors.orange,
          onPressed: () =>
              !state.isLoading ? _showFilterPage(context: context) : null,
        );
      },
    );
  }

  void _showFilterPage({required BuildContext context}) {
    context.read<OutstandingInvoiceFilterBloc>().add(
          OutstandingInvoiceFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter:
                context.read<OutstandingInvoicesBloc>().state.appliedFilter,
          ),
        );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const OutstandingInvoicePaymentFilterPage();
      },
    ).then(
      (value) {
        if (value == null) return;
        final newFilter = value as OutstandingInvoiceFilter;
        final alreadyAppliedFilter =
            context.read<OutstandingInvoicesBloc>().state.appliedFilter;
        if (newFilter != alreadyAppliedFilter) {
          context.read<OutstandingInvoicesBloc>().add(
                OutstandingInvoicesEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  appliedFilter: newFilter,
                ),
              );
        }
      },
    );
  }
}
