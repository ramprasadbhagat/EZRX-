import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _controller = ScrollController();

class ReturnByItemPage extends StatelessWidget {
  const ReturnByItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.returnByItemPage,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching && state.returnItemList.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<ReturnItem>(
                    noRecordFoundWidget:
                        const NoRecordFound(title: 'No Return by Item found'),
                    controller: _controller,
                    onRefresh: () => context.read<ReturnListByItemBloc>().add(
                          ReturnListByItemEvent.fetch(
                            salesOrg: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation
                                .salesOrg,
                            shipInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            user: context.read<UserBloc>().state.user,
                            appliedFilter: ReturnFilter.empty(),
                            searchKey: SearchKey(''),
                          ),
                        ),
                    onLoadingMore: () =>
                        context.read<ReturnListByItemBloc>().add(
                              ReturnListByItemEvent.loadMore(
                                salesOrg: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation
                                    .salesOrg,
                                shipInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .shipToInfo,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                                user: context.read<UserBloc>().state.user,
                              ),
                            ),
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) {
                      final currentGroup = item.requestDate;
                      final previousGroup = index != 0
                          ? state.returnItemList[index - 1].requestDate
                          : null;

                      return currentGroup != previousGroup
                          ? _ReturnItem(
                              key: WidgetKeys.returnItem(index.toString()),
                              data: item,
                              showDivider: index != 0,
                              showHeader: true,
                            )
                          : _ReturnItem(
                              key: WidgetKeys.returnItem(index.toString()),
                              data: item,
                              showDivider: false,
                              showHeader: false,
                            );
                    },
                    items: state.returnItemList,
                  );
          },
        ),
      ),
      floatingActionButton: ScaleButton(
        icon: Icons.add,
        label: 'New request'.tr(),
        onPress: () {
          context.read<ReturnItemsBloc>().add(
                ReturnItemsEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                ),
              );
          context.read<NewRequestBloc>().add(
                const NewRequestEvent.initialized(),
              );
          context.router.pushNamed('returns/new_request');
        },
        scrollController: _controller,
      ),
    );
  }
}

class _ReturnItem extends StatelessWidget {
  final ReturnItem data;
  final bool showDivider;
  final bool showHeader;
  const _ReturnItem({
    Key? key,
    required this.data,
    required this.showDivider,
    required this.showHeader,
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
              if (showHeader)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    'Requested on ${data.requestDate.toValidDateString}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ZPColors.darkerGrey,
                        ),
                  ),
                ),
              CommonTileItem(
                key: WidgetKeys.returnItemTile,
                onTap: () {
                  context.read<ReturnSummaryDetailsBloc>().add(
                        ReturnSummaryDetailsEvent.fetch(
                          returnId: data.requestId,
                          invoiceId: data.invoiceID,
                        ),
                      );
                  context.router.push(
                    ReturnRequestSummaryByItemDetailsRoute(returnItem: data),
                  );
                },
                label: data.materialNumber.displayMatNo,
                title: data.materialName,
                subtitle:
                    'Batch ${data.batch} (Expires ${data.expiry.toValidDateString})',
                headerText: 'Return #${data.requestId}',
                materialNumber: data.materialNumber,
                quantity: data.itemQty.toString(),
                isQuantityBelowImage: true,
                statusWidget: StatusLabel(
                  status: StatusType(
                    data.status.getOrDefaultValue(''),
                  ),
                ),
                priceComponent: const SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
