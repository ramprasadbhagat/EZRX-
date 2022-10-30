import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_list_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateListPage extends StatelessWidget {
  const OrderTemplateListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('OrderTemplateListPage'),
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: Text('Order Templates'.tr()),
        actions: const [CartButton()],
      ),
      body: BlocConsumer<OrderTemplateListBloc, OrderTemplateListState>(
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
                  context.read<AuthBloc>().add(
                        const AuthEvent.logout(),
                      );
                }
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return state.isFetching && state.orderTemplateList.isEmpty
              ? LoadingShimmer.withChild(
                  child: Image.asset(
                    'assets/images/ezrxlogo.png',
                    width: 80,
                    height: 80,
                  ),
                )
              : ScrollList<OrderTemplate>(
                  emptyMessage: 'No order template found',
                  onRefresh: () {
                    context.read<OrderTemplateListBloc>().add(
                          OrderTemplateListEvent.fetch(
                            context.read<UserBloc>().state.user,
                          ),
                        );
                    context
                        .read<MaterialPriceDetailBloc>()
                        .add(const MaterialPriceDetailEvent.initialized());
                  },
                  isLoading: false,
                  onLoadingMore: () {},
                  itemBuilder: (context, index, item) => OrderTemplateListItem(
                    orderTemplate: state.orderTemplateList[index],
                  ),
                  items: state.orderTemplateList,
                );
        },
      ),
    );
  }
}
