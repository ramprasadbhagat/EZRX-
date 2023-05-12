import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class UpdateCart extends StatelessWidget implements AutoRouteWrapper {
  final PriceAggregate material;

  const UpdateCart({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final isSpecialOrderType =
        context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;
    final updateCartItem = material.copyWith(
      isSpecialOrderType: isSpecialOrderType,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<AddToCartBloc>(
          create: (context) => locator<AddToCartBloc>()
            ..add(
              AddToCartEvent.setCartItem(updateCartItem),
            )
            ..add(
              AddToCartEvent.updateQuantity(
                material.quantity,
                cartState.zmgMaterialWithoutMaterial(updateCartItem),
              ),
            ),
        ),
        BlocProvider<TenderContractBloc>(
          create: (context) => locator<TenderContractBloc>(),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return BlocListener<AddToCartBloc, AddToCartState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching && !current.isFetching,
      listener: (context, state) {
        if (state.cartItem.materialInfo.hasValidTenderContract) {
          final bloc = context.read<TenderContractBloc>();
          final eligibilityBloc = context.read<EligibilityBloc>();
          bloc.add(
            TenderContractEvent.fetch(
              customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
              salesOrganisation: eligibilityBloc.state.salesOrganisation,
              shipToInfo: eligibilityBloc.state.shipToInfo,
              materialInfo: state.cartItem.materialInfo,
              defaultSelectedTenderContract: state.cartItem.tenderContract,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: ZPColors.white,
        appBar: AppBar(
          title: const Text('Material Detail').tr(),
        ),
        key: const ValueKey('updateCartBottomSheet'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            builder: (context, state) {
              if (state.isFetching) {
                return const CartBottomSheetShimmer(
                  isEdit: true,
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SvgPicture.asset(
                            'assets/svg/default_product_image.svg',
                            key: const ValueKey('updateCartProductImage'),
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        CartItemDetailWidget(
                          cartItem: state.cartItem,
                          onQuantityChanged: (int value) {
                            final discountedMaterialCount =
                                cartBloc.state.zmgMaterialWithoutMaterial(
                              state.cartItem,
                            );
                            context.read<AddToCartBloc>().add(
                                  AddToCartEvent.updateQuantity(
                                    value,
                                    discountedMaterialCount,
                                  ),
                                );
                          },
                        ),
                        if (state.cartItem.materialInfo.hasValidTenderContract)
                          const SelectContract(),
                      ],
                    ),
                  ),
                  UpdateCartButton(cartItem: state.cartItem),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
