import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:ezrxmobile/presentation/orders/create_order/update_cart_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
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
    if (cartItem.materialInfo.hasValidTenderContract) {
      context.read<TenderContractBloc>().add(
            TenderContractEvent.fetch(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              materialInfo: cartItem.materialInfo,
              defaultSelectedTenderContract: cartItem.tenderContract,
            ),
          );
    }
    super.initState();
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
        key: const ValueKey('updateCartBottomSheet'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (!state.cartItem.materialInfo.hasValidTenderContract) {
                context.read<TenderContractBloc>().add(
                      const TenderContractEvent.unselected(),
                    );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView(
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
                        state.cartItem.materialInfo.hasValidTenderContract
                            ? SelectContract(
                                materialInfo: state.cartItem.materialInfo,
                              )
                            : const SizedBox.shrink(),
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
