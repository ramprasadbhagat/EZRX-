import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/widgets/new_request_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/returns/entities/return_item.dart';

class ReturnByRequestPage extends StatefulWidget {
  const ReturnByRequestPage({Key? key}) : super(key: key);

  @override
  State<ReturnByRequestPage> createState() => _ReturnByRequestPageState();
}

class _ReturnByRequestPageState extends State<ReturnByRequestPage> {
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
      key: WidgetKeys.returnByRequestRootPage,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<ReturnListByRequestBloc, ReturnListByRequestState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
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
              previous.isFetching != current.isFetching ||
              previous.returnItemList != current.returnItemList,
          builder: (context, state) {
            return state.isFetching && state.returnItemList.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<ReturnItem>(
                    noRecordFoundWidget: const NoRecordFound(
                      title: 'No Return by Request found',
                    ),
                    controller: _controller,
                    onRefresh: () =>
                        context.read<ReturnListByRequestBloc>().add(
                              ReturnListByRequestEvent.fetch(
                                appliedFilter: ReturnFilter.empty(),
                                searchKey: SearchKey(''),
                              ),
                            ),
                    onLoadingMore: () =>
                        context.read<ReturnListByRequestBloc>().add(
                              const ReturnListByRequestEvent.loadMore(),
                            ),
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) {
                      final currentGroup = item.requestDate;
                      final previousGroup = index != 0
                          ? state.returnItemList[index - 1].requestDate
                          : null;

                      return currentGroup != previousGroup
                          ? _ReturnItem(
                              key: WidgetKeys.returnRequest(index.toString()),
                              data: item,
                              showDivider: index != 0,
                              showHeader: true,
                            )
                          : _ReturnItem(
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
    final config = context.read<SalesOrgBloc>().state.configs;

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
              CustomCard(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () {
                    context.read<ReturnDetailsByRequestBloc>().add(
                          ReturnDetailsByRequestEvent.fetch(
                            returnId: data.requestId,
                          ),
                        );
                    context.router.push(
                      ReturnRequestDetailsRoute(returnItem: data),
                    );
                  },
                  title: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${'Return'.tr()} #${data.requestId}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsBlack,
                                  ),
                            ),
                          ),
                          StatusLabel(
                            status: StatusType(
                              data.status.displayStatusForViewByRequest,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${data.itemQty.getOrDefaultValue('0')} ${data.itemQty.noun}',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          PriceComponent(
                            title: 'Return value: '.tr(),
                            salesOrgConfig: config,
                            price: data.totalPrice.toStringAsFixed(2),
                            priceLabelStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ZPColors.darkerGrey,
                                    ),
                          ),
                        ],
                      ),
                    ],
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
