import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_material_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderItem extends StatelessWidget {
  const SavedOrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(10.0),
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete',
            icon: Icons.delete_outline,
            onPressed: (context) => context.read<SavedOrderListBloc>().add(
                  SavedOrderListEvent.delete(
                    order: order,
                    user: context.read<UserBloc>().state.user,
                  ),
                ),
          ),
        ],
        borderRadius: 10,
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                context.read<MaterialPriceDetailBloc>().add(
                      MaterialPriceDetailEvent.fetch(
                        user: context.read<UserBloc>().state.user,
                        customerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        salesOrganisationConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToCode:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                        materialInfoList: order.items
                            .map(
                              (item) => MaterialQueryInfo.fromSavedOrder(
                                orderMaterial: item,
                              ),
                            )
                            .toList(),
                      ),
                    );
              }
            },
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Company Name: ${order.companyName.name}',
                      order.companyName.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Order No: ${order.id}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'Sold To IDs: ${order.soldToParty.name}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'Ship To IDs: ${order.shipToParty.name}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Order Value: ',
                            style: TextStyle(
                              color: ZPColors.lightGray,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${context.read<SalesOrgBloc>().state.configs.currency.code} ${order.totalOrderValue}',
                            style: const TextStyle(
                              color: ZPColors.darkerGreen,
                              fontSize: 13.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            childrenPadding: const EdgeInsets.only(left: 20, bottom: 15),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...order.items
                      .map(
                        (item) => SavedOrderMaterialItem(
                          material: item,
                        ),
                      )
                      .toList(),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          //TODO: Implement Add to cart
                        },
                        child: const Text('Add to Cart').tr(),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<SavedOrderListBloc>().add(
                                SavedOrderListEvent.delete(
                                  order: order,
                                  user: context.read<UserBloc>().state.user,
                                ),
                              );
                          // showPlatformDialog(
                          //   context: context,
                          //   barrierDismissible: true,
                          //   builder: (context) => PlatformAlertDialog(
                          //     title: const Text('Info').tr(),
                          //     content: SingleChildScrollView(
                          //       child: ListBody(
                          //         children: <Widget>[
                          //           const Text(
                          //             'This action will delete the item from your saved orders.',
                          //           ).tr(),
                          //           const Text(
                          //             'Do you want to proceed?',
                          //           ).tr(),
                          //         ],
                          //       ),
                          //     ),
                          //     actions: [
                          //       PlatformDialogAction(
                          //         child: const Text('Cancel').tr(),
                          //         onPressed: () {
                          //           context.router.pop();
                          //         },
                          //       ),
                          //       PlatformDialogAction(
                          //         child: const Text('Confirm').tr(),
                          //         onPressed: () {
                          //           context.router.pop();
                          //           context
                          //               .read<SavedOrderListBloc>()
                          //               .add(
                          //                 SavedOrderListEvent.delete(
                          //                   order: order,
                          //                   user: context
                          //                       .read<UserBloc>()
                          //                       .state
                          //                       .user,
                          //                 ),
                          //               );
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                        child: const Text('Delete').tr(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
