import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/orders/saved_order/order_template_item.dart';

class SavedOrderListPage extends StatefulWidget {
  const SavedOrderListPage({Key? key}) : super(key: key);

  @override
  State<SavedOrderListPage> createState() => _SavedOrderListPageState();
}

class _SavedOrderListPageState extends State<SavedOrderListPage> {
  @override
  void initState() {
    context.read<ValidCustomerMaterialBloc>().add(
          const ValidCustomerMaterialEvent.initialized(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Orders').tr(),
        actions: const [CartButton()],
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
                  if (failureMessage == 'authentication failed') {
                    context.read<AuthBloc>().add(const AuthEvent.logout());
                  }
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
                onRefresh: () {
                  context.read<SavedOrderListBloc>().add(
                        SavedOrderListEvent.fetch(
                          userInfo: context.read<UserBloc>().state.user,
                          selectedSalesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                          selectedCustomerCode: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          selectedShipTo:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                        ),
                      );
                  context
                      .read<MaterialPriceDetailBloc>()
                      .add(const MaterialPriceDetailEvent.initialized());
                  context
                      .read<ValidCustomerMaterialBloc>()
                      .add(const ValidCustomerMaterialEvent.initialized());
                },
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
                            .customerCodeInfo,
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
