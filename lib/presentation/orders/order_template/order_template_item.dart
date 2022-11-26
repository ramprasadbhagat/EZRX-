import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

class OrderTemplateItem extends StatelessWidget {
  final OrderTemplate orderTemplate;
  const OrderTemplateItem({Key? key, required this.orderTemplate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(
        'materialOption${orderTemplate.templateId}',
      ),
      child: Card(
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
            key: Key('orderListTile${orderTemplate.templateId}'),
            onTap: () {
              context.read<MaterialPriceDetailBloc>().add(
                    MaterialPriceDetailEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      customerCode: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      salesOrganisationConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      shipToCode:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      materialInfoList: orderTemplate.allMaterialQueryInfo,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                    ),
                  );
              context.router.push(
                OrderTemplateDetailPageRoute(order: orderTemplate),
              );
            },
            title: Text(
              orderTemplate.templateName,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ),
    );
  }
}
