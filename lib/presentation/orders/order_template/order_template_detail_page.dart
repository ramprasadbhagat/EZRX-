import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/orders/core/order_action_button.dart';
import 'package:ezrxmobile/presentation/orders/core/order_invalid_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateDetailPage extends StatelessWidget {
  final OrderTemplate order;
  const OrderTemplateDetailPage({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('OrderTemplateDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text(order.templateName),
        ),
      ),
      body: RefreshIndicator(
        color: ZPColors.primary,
        onRefresh: () async => context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.refresh(
                user: context.read<UserBloc>().state.user,
                customerCode:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                materialInfoList: order.allMaterialQueryInfo,
                pickAndPack:
                    context.read<EligibilityBloc>().state.getPNPValueMaterial,
              ),
            ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocBuilder<MaterialPriceDetailBloc,
                  MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isValidating != current.isValidating,
                builder: (context, state) {
                  return OrderInvalidWarning(
                    isLoading: state.isValidating,
                    isInvalidOrder: order.allMaterialQueryInfo.every(
                      (item) => !state.isValidMaterial(
                        query: item,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final material = order.items[index];

                  return OrderMaterialItem(
                    materialQueryInfo: MaterialQueryInfo.fromOrderTemplate(
                      orderMaterial: material,
                    ),
                    materialNumber: material.materialNumber.displayMatNo,
                    qty: material.qty.toString(),
                  );
                },
                childCount: order.items.length,
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<MaterialPriceDetailBloc,
                  MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isValidating != current.isValidating ||
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return OrderActionButton(
                    onAddToCartPressed: () => _addToCartPressed(context, state),
                    onDeletePressed: () {
                      context.read<OrderTemplateListBloc>().add(
                            OrderTemplateListEvent.delete(
                              order,
                            ),
                          );
                      context.router.pop();
                    },
                    enableAddToCart: order.allMaterialQueryInfo.any(
                      (item) => state.isValidMaterial(
                        query: item,
                      ),
                    ),
                    isLoading: state.isValidating,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCartPressed(BuildContext context, MaterialPriceDetailState state) {
    final cartBloc = context.read<CartBloc>();
    final items = order.allMaterialQueryInfo.map((queryInfo) {
      final itemInfo = state.materialDetails[queryInfo];
      if (itemInfo != null) {
        final priceAggregate = PriceAggregate(
          price: itemInfo.price,
          materialInfo: itemInfo.info,
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          quantity: queryInfo.qty.getOrCrash(),
          zmgMaterialCountOnCart: cartBloc.state.zmgMaterialCount,
          isOverride: false,
        );

        return priceAggregate;
      }

      return PriceAggregate.empty();
    }).toList();
    context.read<CartBloc>().add(
          CartEvent.addToCartFromList(
            items: items,
          ),
        );

    //TODO: revisit this later
    context.router.pushNamed('cart_page');
  }
}
