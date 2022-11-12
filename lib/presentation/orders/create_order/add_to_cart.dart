import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = '1';
    context.read<AddToCartBloc>().add(AddToCartEvent.updateQuantity(
          1,
          context.read<CartBloc>().state.zmgMaterialCount,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final taxCode =
                  context.read<SalesOrgBloc>().state.salesOrg.taxCode;
              final enableVat =
                  context.read<SalesOrgBloc>().state.configs.enableVat;

              return ListView(
                children: [
                  Center(
                    child: Text(
                      state.cartItem.materialInfo.materialDescription,
                      style: Theme.of(context).textTheme.headline6?.apply(
                            color: ZPColors.black,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.cartItem.materialInfo.principalData.principalName,
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.cartItem.materialInfo.materialNumber.displayMatNo,
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  ),
                  if (state.cartItem.price.zmgDiscount)
                    Column(
                      children: [
                        // const Text('Tiered Pricing:').tr(),
                        ...state.cartItem.price.tiers.first.items
                            .map((e) => _PriceTierLable(priceTierItem: e))
                            .toList(),
                      ],
                    ),
                  // const SizedBox(height: 8),
                  QuantityInput(
                    controller: _controller,
                    onFieldChange: (int value) {
                      context.read<AddToCartBloc>().add(
                            AddToCartEvent.updateQuantity(
                              value,
                              context.read<CartBloc>().state.zmgMaterialCount,
                            ),
                          );
                    },
                    minusPressed: (int value) {
                      context.read<AddToCartBloc>().add(
                            AddToCartEvent.updateQuantity(
                              value,
                              context.read<CartBloc>().state.zmgMaterialCount,
                            ),
                          );
                    },
                    addPressed: (int value) {
                      context.read<AddToCartBloc>().add(
                            AddToCartEvent.updateQuantity(
                              value,
                              context.read<CartBloc>().state.zmgMaterialCount,
                            ),
                          );
                    },
                  ),
                  const SizedBox(height: 15),
                  enableVat
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BalanceTextRow(
                            keyText: 'Unit price before $taxCode'.tr(),
                            valueText:
                                state.cartItem.display(PriceType.listPrice),
                            keyFlex: 1,
                            valueFlex: 1,
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BalanceTextRow(
                      keyText: 'Unit Price'.tr(),
                      valueText: state.cartItem.display(PriceType.unitPrice),
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                  ),
                  enableVat
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: BalanceTextRow(
                            keyText: 'Total price before $taxCode'.tr(),
                            valueText: state.cartItem
                                .display(PriceType.listPriceTotal),
                            keyFlex: 1,
                            valueFlex: 1,
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BalanceTextRow(
                      keyText: 'Total price'.tr(),
                      valueText:
                          state.cartItem.display(PriceType.unitPriceTotal),
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () => _addToCart(context, state.cartItem),
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
      context.read<CartBloc>().add(CartEvent.addToCart(item: selectedCartItem));
      context.router.pop();
    }
  }
}

class _PriceTierLable extends StatelessWidget {
  final PriceTierItem priceTierItem;
  const _PriceTierLable({
    Key? key,
    required this.priceTierItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('priceTierLable'),
      width: 180,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/tierpriceback.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Buy ${priceTierItem.quantity.toString()} or more ',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: context.read<SalesOrgBloc>().state.currency.code,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
            const TextSpan(
              text: ' ',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
            TextSpan(
              text: priceTierItem.rate.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 11,
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
