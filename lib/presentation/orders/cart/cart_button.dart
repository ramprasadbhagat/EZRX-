import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart' as bd;
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class CartButton extends StatelessWidget {
  final Color? cartColor;
  final Color? backgroundCartColor;
  final double? size;
  final double? iconSize;
  final double? positionTop;
  const CartButton({
    Key? key,
    this.cartColor,
    this.backgroundCartColor,
    this.size,
    this.iconSize,
    this.positionTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disableCreateOrder =
        !context.read<EligibilityBloc>().state.user.userCanCreateOrder;

    return disableCreateOrder
        ? const SizedBox.shrink()
        : BlocBuilder<CartBloc, CartState>(
            buildWhen: (previous, current) =>
                previous.cartProducts.length != current.cartProducts.length,
            builder: (context, state) {
              return bd.Badge(
                badgeContent: Text(
                  state.cartProducts.length.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
                badgeColor: ZPColors.red,
                showBadge: state.cartProducts.isNotEmpty,
                elevation: 0,
                position:
                    bd.BadgePosition.topEnd(top: positionTop ?? 0, end: 3),
                animationType: bd.BadgeAnimationType.fade,
                child: Container(
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundCartColor ?? ZPColors.translucentWhite,
                  ),
                  child: IconButton(
                    visualDensity: VisualDensity.compact,
                    key: WidgetKeys.cartButton,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: cartColor ?? ZPColors.white,
                      size: iconSize,
                    ),
                    onPressed: () {
                      trackMixpanelEvent(MixpanelEvents.cartIconClicked);

                      context.read<OrderEligibilityBloc>().add(
                            OrderEligibilityEvent.initialized(
                              configs: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs,
                              customerCodeInfo: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .customerCodeInfo,
                              orderType: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .selectedOrderType
                                  .documentType
                                  .getOrDefaultValue(''),
                              salesOrg: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrganisation,
                              shipInfo: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .shipToInfo,
                              user: context.read<EligibilityBloc>().state.user,
                            ),
                          );
                      final product = context
                          .read<ProductDetailBloc>()
                          .state
                          .productDetailAggregate;
                      context.router.pushNamed('orders/cart').then((value) {
                        final salesOrgConfig = context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs;
                        if (salesOrgConfig.salesOrg.isVN &&
                            salesOrgConfig.enableZDP5) {
                          context.read<MaterialPriceBloc>().add(
                                MaterialPriceEvent.fetchPriceForZDP5Materials(
                                  materialInfo: product.materialInfo,
                                ),
                              );
                        }
                      });
                    },
                  ),
                ),
              );
            },
          );
  }
}
