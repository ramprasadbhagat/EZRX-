import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
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
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete'.tr(),
            icon: Icons.delete_outline,
            onPressed: (context) => context.read<SavedOrderListBloc>().add(
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
                    pickAndPack: context
                        .read<EligibilityBloc>()
                        .state
                        .getPNPValueMaterial,
                  ),
                );
            context.router.push(SavedOrderDetailPageRoute(order: order));
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${order.id}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                order.companyName.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Sold To IDs: ${order.soldToParty.name}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                'Ship To IDs: ${order.shipToParty.name}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                'Order Value: ${StringUtils.displayPrice(context.read<SalesOrgBloc>().state.configs, order.totalOrderValue)}',
                style: Theme.of(context).textTheme.bodyText1?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
