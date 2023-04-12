import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderItem extends StatelessWidget {
  const SavedOrderItem({
    Key? key,
    required this.order,
    required this.isDeleting,
  }) : super(key: key);

  final SavedOrder order;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete'.tr(),
            icon: Icons.delete_outline,
            onPressed: (context) => isDeleting
                ? showSnackBar(
                    context: context,
                    message: 'Another Deletion in Progress'.tr(),
                  )
                : context.read<SavedOrderListBloc>().add(
                      SavedOrderListEvent.delete(
                        order: order,
                        user: context.read<UserBloc>().state.user,
                      ),
                    ),
          ),
        ],
        borderRadius: 8,
        child: ListTile(
          onTap: () {
            context.router.push(SavedOrderDetailPageRoute(order: order));
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${order.id}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                order.companyName.name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${'Sold To IDs:'.tr()} ${order.soldToParty.name}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Ship To IDs:'.tr()} ${order.shipToParty.name}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Order Value:'.tr()} ${StringUtils.displayPrice(context.read<SalesOrgBloc>().state.configs, order.totalOrderValue)}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ],
          ),
          trailing: IconButton(
            key: const Key('deleteFromList'),
            constraints: const BoxConstraints(),
            onPressed: () async {
              await CustomDialogs.confirmationDialog(
                context: context,
                title: 'Delete Order?',
                message: 'Are you sure you want to delete this Order?',
                confirmText: 'Yes',
                cancelText: 'No',
                onAcceptPressed: () async {
                  isDeleting
                      ? showSnackBar(
                          context: context,
                          message: 'Another Deletion in Progress'.tr(),
                        )
                      : context.read<SavedOrderListBloc>().add(
                            SavedOrderListEvent.delete(
                              order: order,
                              user: context.read<UserBloc>().state.user,
                            ),
                          );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
