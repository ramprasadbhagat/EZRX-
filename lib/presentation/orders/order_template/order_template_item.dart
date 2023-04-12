import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

class OrderTemplateItem extends StatelessWidget {
  final OrderTemplate orderTemplate;
  const OrderTemplateItem({Key? key, required this.orderTemplate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key(
        'materialOption${orderTemplate.templateId}',
      ),
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete'.tr(),
            icon: Icons.delete_outline,
            onPressed: (context) {
              context.read<OrderTemplateListBloc>().add(
                    OrderTemplateListEvent.delete(
                      orderTemplate,
                    ),
                  );
            },
          ),
        ],
        borderRadius: 8,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          key: Key('orderListTile${orderTemplate.templateId}'),
          onTap: () {
            context.router.push(
              OrderTemplateDetailPageRoute(order: orderTemplate),
            );
          },
          title: Row(
            children: [
              Expanded(
                child: Text(
                  orderTemplate.templateName,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              TextButton.icon(
                key: const Key('deleteFromList'),
                onPressed: () async {
                  await CustomDialogs.confirmationDialog(
                    context: context,
                    title: 'Delete Order Template?'.tr(),
                    message:
                        'Are you sure you want to delete this Order Template?'
                            .tr(),
                    confirmText: 'Yes'.tr(),
                    cancelText: 'No'.tr(),
                    onAcceptPressed: () async {
                      context.read<OrderTemplateListBloc>().add(
                            OrderTemplateListEvent.delete(
                              orderTemplate,
                            ),
                          );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
                label: Text('Delete'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
