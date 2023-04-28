import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/returns/return_summary/return_summary_filter.dart';
import 'package:ezrxmobile/presentation/returns/return_summary/return_summary_filter_by_status.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummary extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ReturnSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Return Summary').tr(),
        actions: <Widget>[Container()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child:
                BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
              buildWhen: (previous, current) =>
                  previous.returnSummaryFilter != current.returnSummaryFilter ||
                  previous.returnSummaryFilter.activeStatus !=
                      current.returnSummaryFilter.activeStatus ||
                  previous.isSubmitting != current.isSubmitting,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return const ReturnSummaryFilterByStatus();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Status'.tr(),
                            key: const ValueKey('status'),
                            style:
                                Theme.of(context).textTheme.titleSmall?.apply(
                                      color: ZPColors.kPrimaryColor,
                                      fontStyle: FontStyle.normal,
                                    ),
                          ),
                          Text(
                            ' : ${state.returnSummaryFilter.activeStatus.displayStatusInList}',
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: ZPColors.darkGray,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<ReturnSummaryFilterBloc,
                        ReturnSummaryFilterState>(
                      buildWhen: (previous, current) =>
                          previous.returnSummaryFilter.appliedFilterCount !=
                          current.returnSummaryFilter.appliedFilterCount,
                      builder: (context, state) {
                        return FilterCountButton(
                          filterCount:
                              state.returnSummaryFilter.appliedFilterCount,
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
      endDrawer: const ReturnSummaryFilterDrawer(),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocListener<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
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
              context.read<ReturnSummaryBloc>()
                ..add(const ReturnSummaryEvent.initialized())
                ..add(
                  ReturnSummaryEvent.fetch(
                    user: context.read<UserBloc>().state.user,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                    returnSummaryFilter: context
                        .read<ReturnSummaryFilterBloc>()
                        .state
                        .returnSummaryFilter,
                  ),
                );
            }
          },
          child: BlocConsumer<ReturnSummaryBloc, ReturnSummaryState>(
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
                previous.returnSummaryList != current.returnSummaryList,
            builder: (context, returnSummaryState) {
              final configs = context.read<SalesOrgBloc>().state.configs;
              final customerCode =
                  context.read<CustomerCodeBloc>().state.customerCodeInfo;
              final shipToInfo =
                  context.read<ShipToCodeBloc>().state.shipToInfo;

              if (returnSummaryState.isLoading &&
                  returnSummaryState.returnSummaryList.isEmpty) {
                return LoadingShimmer.logo(
                  key: const Key('LoaderImage'),
                );
              }

              return Column(
                children: [
                  context
                          .read<ReturnSummaryFilterBloc>()
                          .state
                          .returnSummaryFilter
                          .anyFilterApplied
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                color: ZPColors.darkerGreen,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  'Return summary dates pre-set for past 7 days. Change the date range from “Filter” for more data'
                                      .tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: ScrollList<ReturnSummaryRequest>(
                      emptyMessage:
                          'You have not submitted any return request'.tr(),
                      onRefresh: () {
                        context.read<ReturnSummaryFilterBloc>().add(
                              const ReturnSummaryFilterEvent.initialized(),
                            );
                        context.read<ReturnSummaryBloc>().add(
                              ReturnSummaryEvent.fetch(
                                user: context.read<UserBloc>().state.user,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                returnSummaryFilter:
                                    ReturnSummaryFilter.empty(),
                              ),
                            );
                      },
                      onLoadingMore: () {
                        context.read<ReturnSummaryBloc>().add(
                              ReturnSummaryEvent.loadMore(
                                user: context.read<UserBloc>().state.user,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                shipToInfo: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                returnSummaryFilter: context
                                    .read<ReturnSummaryFilterBloc>()
                                    .state
                                    .returnSummaryFilter,
                              ),
                            );
                      },
                      isLoading: returnSummaryState.isLoading,
                      itemBuilder: (context, index, item) =>
                          ReturnSummaryListItem(
                        returnSummaryRequests: item,
                        configs: configs,
                        customerCodeInfo: customerCode,
                        shipToInfo: shipToInfo,
                      ),
                      items: returnSummaryState.returnSummaryList,
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

class ReturnSummaryListItem extends StatelessWidget {
  const ReturnSummaryListItem({
    Key? key,
    required this.returnSummaryRequests,
    required this.configs,
    required this.customerCodeInfo,
    required this.shipToInfo,
  }) : super(key: key);
  final ReturnSummaryRequest returnSummaryRequests;
  final SalesOrganisationConfigs configs;
  final CustomerCodeInfo customerCodeInfo;
  final ShipToInfo shipToInfo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    returnSummaryRequests.returnId,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: returnSummaryRequests
                        .requestStatus.displayStatusLabelColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    returnSummaryRequests.requestStatus.displayStatus,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 12,
                          color: returnSummaryRequests
                              .requestStatus.displayStatusTextColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Submitted Date'.tr(),
              valueText: returnSummaryRequests.submitDate.toValidDateString,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Refund Total (w/o tax)'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequests.refundTotal,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Material Name'.tr(),
              valueText: returnSummaryRequests.items.first.materialName,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Return Quantity'.tr(),
              valueText: returnSummaryRequests.items.first.returnQty.toString(),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Unit Price (w/o tax) '.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequests.items.first.unitPrice,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Total Price (w/o tax) '.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                returnSummaryRequests.items.first.total,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Status'.tr(),
              valueText:
                  returnSummaryRequests.requestStatus.displayStatusInList,
              keyFlex: 1,
              valueFlex: 1,
            ),
          ],
        ),
        onTap: () {
          context.read<ReturnSummaryDetailsBloc>().add(
                ReturnSummaryDetailsEvent.fetch(
                  returnSummaryRequests: returnSummaryRequests,
                ),
              );
          context.router.push(ReturnSummaryDetailsRoute(
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            returnSummaryRequests: returnSummaryRequests,
          ));
        },
      ),
    );
  }
}
