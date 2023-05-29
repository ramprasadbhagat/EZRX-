import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/attention_row.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits_filter.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits_filter_by_status.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCredits extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AllCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('All Credits').tr(),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
              buildWhen: (previous, current) =>
                  previous.allCreditsFilter != current.allCreditsFilter ||
                  previous.allCreditsFilter.sortBy !=
                      current.allCreditsFilter.sortBy ||
                  previous.isSubmitting != current.isSubmitting,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      key: const Key('statusFilterButton'),
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return const AllCreditsFilterByStatus();
                          },
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Status'.tr(),
                            key: const ValueKey('status'),
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.kPrimaryColor,
                                    ),
                          ),
                          Text(
                            ' : ${state.allCreditsFilter.sortBy}',
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
                      buildWhen: (previous, current) =>
                          previous.allCreditsFilter.appliedFilterCount !=
                          current.allCreditsFilter.appliedFilterCount,
                      builder: (context, state) {
                        return FilterCountButton(
                          filterCount:
                              state.allCreditsFilter.appliedFilterCount,
                          onTap: () {
                            scaffoldKey.currentState!.openEndDrawer();
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      endDrawer: const AllCreditsFilterDrawer(),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<AllCreditsFilterBloc, AllCreditsFilterState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting &&
                  current.isSubmitting ||
              !scaffoldKey.currentState!.isEndDrawerOpen,
          listener: (context, state) {
            final hasCustomerCodeInfo = context
                .read<CustomerCodeBloc>()
                .state
                .customerCodeInfo
                .customerCodeSoldTo
                .isNotEmpty;
            final hasShipToInfo = context
                .read<ShipToCodeBloc>()
                .state
                .shipToInfo
                .shipToCustomerCode
                .isNotEmpty;
            if (hasCustomerCodeInfo && hasShipToInfo) {
              context.read<AllCreditsBloc>()
                ..add(const AllCreditsEvent.initialized())
                ..add(
                  AllCreditsEvent.fetchAllCreditsList(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    allCreditsFilter: context
                        .read<AllCreditsFilterBloc>()
                        .state
                        .allCreditsFilter,
                  ),
                );
            }
          },
          child: BlocConsumer<AllCreditsBloc, AllCreditsState>(
            listenWhen: (previous, current) {
              return previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption;
            },
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
                previous.credits != current.credits,
            builder: (context, allCreditsState) {
              final configs = context.read<SalesOrgBloc>().state.configs;
              if (allCreditsState.isLoading &&
                  allCreditsState.credits.isEmpty) {
                return LoadingShimmer.logo(
                  key: const Key('LoaderImage'),
                );
              }

              return Column(
                children: [
                  const AttentionRow(
                    valueText:
                        'All Credits document dates pre-set for past 28 days. Change the date range from “Filter” for more data',
                  ),
                  Expanded(
                    child: ScrollList<CreditAndInvoiceItem>(
                      emptyMessage: 'No files found'.tr(),
                      onRefresh: () {
                        context.read<AllCreditsFilterBloc>().add(
                              const AllCreditsFilterEvent.initialized(),
                            );
                        context.read<AllCreditsFilterBloc>().add(
                              AllCreditsFilterEvent.fetch(
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                              ),
                            );
                        context.read<AllCreditsBloc>().add(
                              AllCreditsEvent.fetchAllCreditsList(
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                allCreditsFilter: AllCreditsFilter.empty(),
                              ),
                            );
                      },
                      onLoadingMore: () {
                        context.read<AllCreditsBloc>().add(
                              AllCreditsEvent.loadMoreAllCreditsList(
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                allCreditsFilter: context
                                    .read<AllCreditsFilterBloc>()
                                    .state
                                    .allCreditsFilter,
                              ),
                            );
                      },
                      isLoading: allCreditsState.isLoading,
                      itemBuilder: (context, index, item) => _CreditsItem(
                        creditsItem: item,
                        configs: configs,
                      ),
                      items: allCreditsState.credits,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreditsItem extends StatelessWidget {
  const _CreditsItem({
    Key? key,
    required this.creditsItem,
    required this.configs,
  }) : super(key: key);

  final CreditAndInvoiceItem creditsItem;
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
              keyText: 'Document Date'.tr(),
              valueText: creditsItem.documentDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Document Number'.tr(),
              valueText: creditsItem.accountingDocument,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Credit Amount'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                double.parse(
                  creditsItem.convertIfAmountInTransactionCurrencyIsNegative,
                ),
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Status'.tr(),
              valueText: creditsItem.invoiceProcessingStatus,
              keyFlex: 1,
              valueFlex: 1,
              valueColor: ZPColors.kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
