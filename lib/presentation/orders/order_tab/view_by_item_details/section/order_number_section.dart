import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderNumberSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const OrderNumberSection({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ViewByOrderBloc>()
        ..add(
          ViewByOrderEvent.initialized(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            salesOrgConfigs:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            user: context.read<EligibilityBloc>().state.user,
            sortDirection: 'desc',
          ),
        ),
      child: BlocConsumer<ViewByOrderBloc, ViewByOrderState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption &&
            current.searchKey.validateNotEmpty,
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching &&
            current.searchKey.validateNotEmpty,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () => {},
            (option) => option.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {
                if (state.viewByOrderList.orderHeaders.isNotEmpty) {
                  context.read<ViewByOrderDetailsBloc>().add(
                        ViewByOrderDetailsEvent.setOrderDetails(
                          orderHistoryDetails:
                              state.viewByOrderList.orderHeaders.first,
                        ),
                      );
                  context.router.push(
                    const ViewByOrderDetailsPageRoute(),
                  );
                }
              },
            ),
          );
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Text(
                  '${context.tr('Order')} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
                  key: WidgetKeys.viewByItemsOrderDetailOrderCode,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
              state.isFetching
                  ? Align(
                      alignment: Alignment.center,
                      child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: ZPColors.attachmentColor,
                        size: 20,
                      ),
                    )
                  : IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => context.read<ViewByOrderBloc>().add(
                            ViewByOrderEvent.fetch(
                              filter: ViewByOrdersFilter.empty(),
                              searchKey: SearchKey.searchFilter(
                                orderHistoryItem.orderNumber
                                    .getOrDefaultValue(''),
                              ),
                            ),
                          ),
                      icon: const Icon(
                        Icons.open_in_new,
                        color: ZPColors.attachmentColor,
                        size: 20,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
