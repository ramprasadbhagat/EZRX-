import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderListPage extends StatelessWidget {
  const SavedOrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('SavedOrderListKey'),
      appBar: AppBar(
        title: const Text('Saved Orders').tr(),
        actions: const [CartButton()],
      ),
      body: BlocConsumer<SavedOrderListBloc, SavedOrderListState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
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
            previous.isDeleting != current.isDeleting ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              AnnouncementWidget(
                currentPath: context.router.currentPath,
              ),
              const AccountSuspendedBanner(),
              _SavedOrderScrollList(
                state: state,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SavedOrderScrollList extends StatelessWidget {
  const _SavedOrderScrollList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final SavedOrderListState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<SavedOrder>(
        emptyMessage: 'No saved order found'.tr(),
        controller: ScrollController(),
        onRefresh: () {
          context
              .read<MaterialPriceDetailBloc>()
              .add(const MaterialPriceDetailEvent.initialized());
          context.read<SavedOrderListBloc>().add(
                SavedOrderListEvent.fetch(
                  userInfo: context.read<UserBloc>().state.user,
                  selectedSalesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  selectedCustomerCode:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  selectedShipTo:
                      context.read<CustomerCodeBloc>().state.shipToInfo,
                ),
              );
        },
        onLoadingMore: () => context.read<SavedOrderListBloc>().add(
              SavedOrderListEvent.loadMore(
                userInfo: context.read<UserBloc>().state.user,
                selectedSalesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                selectedCustomerCode:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                selectedShipTo:
                    context.read<CustomerCodeBloc>().state.shipToInfo,
              ),
            ),
        isLoading: state.isFetching,
        itemBuilder: (context, index, item) => SavedOrderItem(
          key: Key('SavedOrder$index'),
          order: item,
          isDeleting: state.isDeleting,
        ),
        items: state.savedOrders,
      ),
    );
  }
}
