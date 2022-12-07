import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';

class AddToCart extends StatefulWidget {
  final bool isCovid19Tab;
  bool hasValidTenderContract = false;
  bool hasMandatoryTenderContract = false;

  AddToCart({
    Key? key,
    required this.isCovid19Tab,
    required this.hasValidTenderContract,
    required this.hasMandatoryTenderContract,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late SalesOrgBloc salesOrgBloc;
  late AddToCartBloc addToCartBloc;

  @override
  void initState() {
    salesOrgBloc = context.read<SalesOrgBloc>();

    addToCartBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();
    final cartItem = addToCartBloc.state.cartItem;
    addToCartBloc.add(
      AddToCartEvent.updateQuantity(
        1,
        cartItem.price.zmgDiscount
            ? cartBloc.state.zmgMaterialCount
            : cartBloc.state.onAddCartDiscountMaterialCount(cartItem),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get _isAddToCartAllowed {
    return !salesOrgBloc.state.configs.materialWithoutPrice &&
        addToCartBloc.state.cartItem.price.finalPrice.isEmpty &&
        !widget.isCovid19Tab;
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final addToCartBloc = context.read<AddToCartBloc>();

    return SizedBox(
      height: MediaQuery.of(context).size.height -
          AppBar().preferredSize.height -
          MediaQuery.of(context).padding.top,
      child: Scaffold(
        backgroundColor: ZPColors.white,
        appBar: AppBar(
          title: const Text('Material Detail').tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        CartItemDetailWidget(
                          cartItem: state.cartItem,
                          onQuantityChanged: (int value) {
                            final cartItem = addToCartBloc.state.cartItem;
                            final discountedMaterialCount = cartItem
                                    .price.zmgDiscount
                                ? cartBloc.state.zmgMaterialCount
                                : cartBloc.state
                                    .onAddCartDiscountMaterialCount(cartItem);
                            addToCartBloc.add(
                              AddToCartEvent.updateQuantity(
                                value,
                                discountedMaterialCount,
                              ),
                            );
                          },
                        ),
                        widget.hasValidTenderContract
                            ? SelectContract(
                                materialInfo: state.cartItem.materialInfo,
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: _isAddToCartAllowed
                        ? ElevatedButton.styleFrom(
                            backgroundColor: ZPColors.lightGray,
                          )
                        : null,
                    onPressed: () => _isAddToCartAllowed
                        ? null
                        : _addToCart(context, state.cartItem),
                    child: const Text('Add to Cart').tr(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, PriceAggregate selectedCartItem) {
    final cartState = context.read<CartBloc>().state;
    if (selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containNonFocMaterial) {
      showSnackBar(
        context: context,
        message:
            'Covid material cannot be combined with commercial material.'.tr(),
      );
    } else if (!selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containFocMaterial) {
      showSnackBar(
        context: context,
        message:
            'Commercial material cannot be combined with covid material.'.tr(),
      );
    } else {
      final eligibilityState = context.read<EligibilityBloc>().state;
      context.read<CartBloc>().add(CartEvent.addToCart(
            item: context.read<AddToCartBloc>().state.cartItem,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            salesOrganisation: eligibilityState.salesOrganisation,
            salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
            shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
            doNotallowOutOfStockMaterial:
                eligibilityState.doNotAllowOutOfStockMaterials,
          ));
      context.router.pop();
    }
  }
}
