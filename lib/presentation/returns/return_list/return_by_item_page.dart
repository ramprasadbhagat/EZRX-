import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/widgets/new_request_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnByItemPage extends StatefulWidget {
  const ReturnByItemPage({Key? key}) : super(key: key);

  @override
  State<ReturnByItemPage> createState() => _ReturnByItemPageState();
}

class _ReturnByItemPageState extends State<ReturnByItemPage> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                            appliedFilter: ReturnFilter.empty(),
                            searchKey: SearchKey(''),
                          ),
                        ),
                    onLoadingMore: () =>
                        context.read<ReturnListByItemBloc>().add(
                              const ReturnListByItemEvent.loadMore(),
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
      floatingActionButton: NewRequestButton(controller: _controller),
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
                    '${'Requested on'.tr()} ${data.requestDate.dateString}',
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
                          returnId: ReturnRequestsId(requestId: data.requestId),
                        ),
                      );
                  context.router.push(
                    const ReturnRequestSummaryByItemDetailsRoute(),
                  );
                },
                label: data.materialNumber.displayMatNo,
                title: data.materialName,
                subtitle:
                    'Batch ${data.batch} (Expires ${data.expiry.dateString})',
                headerText: 'Return #${data.requestId}',
                materialNumber: data.materialNumber,
                quantity: data.itemQty.getOrDefaultValue('0'),
                isQuantityBelowImage: true,
                statusWidget: StatusLabel(
                  status: StatusType(
                    data.status.displayStatus,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
