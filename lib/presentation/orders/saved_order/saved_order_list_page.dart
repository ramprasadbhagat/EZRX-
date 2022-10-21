import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/orders/saved_order/order_template_item.dart';

class SavedOrderListPage extends StatelessWidget {
  const SavedOrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Orders').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: BlocConsumer<SavedOrderListBloc, SavedOrderListState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage.tr(),
                  );
                },
                (_) {
                  context.read<AuthBloc>().add(const AuthEvent.authCheck());
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ScrollList<SavedOrder>(
                emptyMessage: 'No saved order found',
                onRefresh: () => context.read<SavedOrderListBloc>().add(
                      SavedOrderListEvent.fetch(
                        userInfo: context.read<UserBloc>().state.user,
                        selectedSalesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        selectedCustomerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customeCodeInfo,
                        selectedShipTo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    ),
                onLoadingMore: () => context.read<SavedOrderListBloc>().add(
                      SavedOrderListEvent.loadMore(
                        userInfo: context.read<UserBloc>().state.user,
                        selectedSalesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        selectedCustomerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customeCodeInfo,
                        selectedShipTo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    ),
                isLoading: state.isFetching,
                itemBuilder: (context, index, item) =>
                    OrderTemplateItem(order: item),
                items: state.savedOrders,
              ),
            );
          },
        ),
      ),
    );
  }
}
