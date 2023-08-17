import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class AllCreditsPage extends StatefulWidget {
  const AllCreditsPage({Key? key}) : super(key: key);

  @override
  State<AllCreditsPage> createState() => _AllCreditsPageState();
}

class _AllCreditsPageState extends State<AllCreditsPage> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Column(
          children: [
            BlocConsumer<AllCreditsBloc, AllCreditsState>(
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
                            title: 'No credit found'.tr(),
                          ),
                          controller: _controller,
                          onRefresh: () {
                            context.read<AllCreditsBloc>().add(
                                  AllCreditsEvent.fetch(
                                    appliedFilter: state.appliedFilter,
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
                          onLoadingMore: () {
                            context.read<AllCreditsBloc>().add(
                                  AllCreditsEvent.loadMore(
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
                          itemBuilder: (context, index, item) => _CreditGroup(
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
      floatingActionButton: ScaleButton(
        icon: Icons.add,
        label: 'New payment'.tr(),
        onPress: () => _toNewPayment(context),
        scrollController: _controller,
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

class _CreditGroup extends StatelessWidget {
  final CreditAndInvoiceGroup data;
  final bool showDivider;
  const _CreditGroup({
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
                  'Documents created on ${data.dueDate.dateString}'.tr(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: data.items
                    .map(
                      (e) => _CreditsItem(creditItem: e),
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

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  final CreditAndInvoiceItem creditItem;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        onTap: () {
          context.read<CreditAndInvoiceDetailsBloc>().add(
                CreditAndInvoiceDetailsEvent.fetch(
                  creditAndInvoiceItem: creditItem,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                ),
              );
          context.router.push(CreditDetailsPageRoute(creditItem: creditItem));
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${creditItem.accountingDocumentType} #${creditItem.searchKey}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            StatusLabel(
              status: StatusType(
                creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                creditItem.postingKeyName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: creditItem.convertIfAmountInTransactionCurrencyIsNegative
                    .toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
