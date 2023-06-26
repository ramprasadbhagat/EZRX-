import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/return_list_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
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
        child: BlocConsumer<ReturnListBloc, ReturnListState>(
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
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching && state.returnItemGroupList.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<ReturnItemGroup>(
                    emptyMessage: 'No Return by Item found'.tr(),
                    controller: _controller,
                    onRefresh: () => context.read<ReturnListBloc>().add(
                          ReturnListEvent.fetchByItems(
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
                    onLoadingMore: () => context.read<ReturnListBloc>().add(
                          ReturnListEvent.loadMoreFetchByItems(
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
                    itemBuilder: (context, index, item) => _ReturnItemGroup(
                      data: item,
                      showDivider: index != 0,
                    ),
                    items: state.returnItemGroupList,
                  );
          },
        ),
      ),
      floatingActionButton: ScaleButton(
        icon: Icons.add,
        label: 'New request'.tr(),
        onPress: () {},
        scrollController: _controller,
      ),
    );
  }
}

class _ReturnItemGroup extends StatelessWidget {
  final ReturnItemGroup data;
  final bool showDivider;
  const _ReturnItemGroup({
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
                  'Requested on ${data.requestDate.toValidDateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              Column(
                children: data.items
                    .map(
                      (e) => CommonTileItem(
                        label: e.materialNumber.displayMatNo,
                        title: e.materialName,
                        subtitle:
                            'Batch ${e.batch} (Expires ${e.expiry.toValidDateString})',
                        headerText: 'Return #${e.requestId}',
                        image: 'assets/svg/default_product_image.svg',
                        quantity: e.itemQty.toString(),
                        isQuantityBelowImage: true,
                        statusWidget: StatusLabel(
                          status: StatusType(
                            e.status.getOrDefaultValue(''),
                          ),
                        ),
                      ),
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
