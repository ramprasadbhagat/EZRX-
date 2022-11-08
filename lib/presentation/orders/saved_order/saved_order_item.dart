import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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
    return GestureDetector(
      onTap: () {
        context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.fetch(
                user: context.read<UserBloc>().state.user,
                customerCode:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                materialInfoList: order.items
                    .map(
                      (item) => MaterialQueryInfo.fromSavedOrder(
                        orderMaterial: item,
                      ),
                    )
                    .toList(),
              ),
            );
        context.router.push(
          SavedOrderDetailPageRoute(
            order: order,
          ),
        );
      },
      child: Card(
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
            child: Container(
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
          ),
        ),
      ),
    );
  }
}
