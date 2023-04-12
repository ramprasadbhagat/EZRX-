import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateListPage extends StatelessWidget {
  const OrderTemplateListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );
    locator<CountlyService>()
        .recordCountlyView('Manage Order Templates Screen');

    return Scaffold(
      key: const Key('OrderTemplateListPage'),
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
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              const AccountSuspendedBanner(),
              Expanded(
                child: state.isFetching && state.orderTemplateList.isEmpty
                    ? LoadingShimmer.logo(key: const Key('loading-shimmer'))
                    : ScrollList<OrderTemplate>(
                        emptyMessage: 'No order template found'.tr(),
                        onRefresh: () {
                          context.read<MaterialPriceDetailBloc>().add(
                                const MaterialPriceDetailEvent.initialized(),
                              );
                          context.read<OrderTemplateListBloc>().add(
                                OrderTemplateListEvent.fetch(
                                  context.read<UserBloc>().state.user,
                                ),
                              );
                        },
                        isLoading: false,
                        itemBuilder: (context, index, item) =>
                            OrderTemplateItem(
                          orderTemplate: state.orderTemplateList[index],
                        ),
                        items: state.orderTemplateList,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
