import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCart extends StatefulWidget {
  const UpdateCart({
    Key? key,
  }) : super(key: key);

  @override
  State<UpdateCart> createState() => _UpdateCartState();
}

class _UpdateCartState extends State<UpdateCart> {
  @override
  void initState() {
    final addToCartBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();

    final cartItem = addToCartBloc.state.cartItem;
    final discountedMaterialCount =
        cartBloc.state.onUpdateDiscountMaterialCount(cartItem);
    addToCartBloc.add(
      AddToCartEvent.updateQuantity(
        cartItem.quantity,
        discountedMaterialCount,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final addToCartBloc = context.read<AddToCartBloc>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        key: const ValueKey('updateCartBottomSheet'),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return ListView(
                children: [
                  CartItemDetailWidget(
                    cartItem: state.cartItem,
                    onQuantityChanged: (int value) {
                      final discountedMaterialCount =
                          cartBloc.state.onUpdateDiscountMaterialCount(
                        addToCartBloc.state.cartItem,
                      );
                      context.read<AddToCartBloc>().add(
                            AddToCartEvent.updateQuantity(
                              value,
                              discountedMaterialCount,
                            ),
                          );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                            CartEvent.updateCartItem(
                              item: state.cartItem,
                              customerCodeInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .customerCodeInfo,
                              doNotallowOutOfStockMaterial: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .doNotAllowOutOfStockMaterials,
                              salesOrganisation: context
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
                              salesOrganisationConfigs:
                                  context.read<SalesOrgBloc>().state.configs,
                              shipToInfo: context
                                  .read<ShipToCodeBloc>()
                                  .state
                                  .shipToInfo,
                            ),
                          );
                      context.router.pop();
                    },
                    child: const Text('Update Cart').tr(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
