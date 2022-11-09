import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/action_button.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        elevation: 1.0,
        margin: const EdgeInsets.all(10.0),
        child: CustomSlidable(
          endActionPaneActions: [
            CustomSlidableAction(
              label: 'Delete',
              icon: Icons.delete_outline,
              onPressed: (context) => context.read<OrderTemplateListBloc>().add(
                    OrderTemplateListEvent.delete(
                      orderTemplate,
                    ),
                  ),
            ),
          ],
          borderRadius: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        orderTemplate.templateName,
                        softWrap: true,
                        style: _textStyle,
                      ),
                    ),
                  ],
                ),
                _sizedBoxH20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ActionButton(
                      text: 'View',
                      width: 72,
                      onTap: () {
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
                                shipToCode: context
                                    .read<ShipToCodeBloc>()
                                    .state
                                    .shipToInfo,
                                materialInfoList:
                                    orderTemplate.allMaterialQueryInfo,
                              ),
                            );
                        context.router.push(
                          OrderTemplateDetailPageRoute(
                            order: orderTemplate,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const _sizedBoxW20 = SizedBox(
    width: 20,
  );

  static const _sizedBoxH20 = SizedBox(
    height: 20,
  );
  static const _textStyle = TextStyle(
    fontSize: 18.0,
    color: ZPColors.black,
    fontWeight: FontWeight.w600,
  );
}
