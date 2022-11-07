import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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
    context.read<AddToCartBloc>().add(const AddToCartEvent.updateQuantity(1));
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
      height: MediaQuery.of(context).size.height * 0.6,
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

                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _QuantityIcon(
                        pressed: () {
                          //todo
                          //If salesOrg is 'VN', quantity must be less than zDP5RemainingQuota
                          //context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isVN
                          //Get the final Price
                          if (int.parse(_controller.text) > 1) {
                            final value = int.parse(_controller.text) - 1;
                            _controller.text = value.toString();
                            context.read<AddToCartBloc>().add(
                                  AddToCartEvent.updateQuantity(value),
                                );
                          }
                        },
                        icon: Icons.remove,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2.0,
                          vertical: 10.0,
                        ),
                        child: SizedBox(
                          width: 80.0,
                          height: 30.0,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: _controller,
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            onChanged: (value) {
                              context.read<AddToCartBloc>().add(
                                    AddToCartEvent.updateQuantity(
                                      int.parse(_controller.text),
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                      _QuantityIcon(
                        pressed: () {
                          //todo
                          //If salesOrg is 'VN', quantity must be less than zDP5RemainingQuota
                          //context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isVN
                          //Get the final Price
                          final value = int.parse(_controller.text) + 1;
                          _controller.text = value.toString();
                          context.read<AddToCartBloc>().add(
                                AddToCartEvent.updateQuantity(value),
                              );
                        },
                        icon: Icons.add,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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

                  const SizedBox(
                    height: 15,
                  ),
                  //check if VAT is enabled
                  /*Column(
                children: const [
                  //if vat is enabled : context.read<SalesOrgBloc>().state.configs.enableVat
                  //-----// if finalPrice is 0.0 || widget.materialInfo.hidePrice || (selectedSalesOrg != 'TH'&&selectedorderType!=null && (selectedorderType.contains("ZPFC") || selectedorderType.contains("ZPFB")))
                  //-----//-----//Shrink
                  //-----// else
                  //-----//-----//Price before VAT :
                  // Unit Price
                ],
              ),*/

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _addToCart(context, state.cartItem),
                        child: const Text('Add to Cart').tr(),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, PriceAggregate cartItem) {
    if (int.parse(_controller.text) > 0) {
      final cartItemList = context.read<CartBloc>().state.cartItemList;
      if (cartItem.materialInfo.materialGroup4.isFOC &&
          cartItemList.any((e) => !e.materialInfo.materialGroup4.isFOC)) {
        showSnackBar(
          context: context,
          message: 'Covid material cannot be combined with commercial material.'
              .tr(),
        );
      } else if (!cartItem.materialInfo.materialGroup4.isFOC &&
          cartItemList.any((e) => e.materialInfo.materialGroup4.isFOC)) {
        showSnackBar(
          context: context,
          message: 'Commercial material cannot be combined with covid material.'
              .tr(),
        );
      } else {
        context.read<CartBloc>().add(CartEvent.addToCart(item: cartItem));
        context.router.pop();
      }
    } else {
      showSnackBar(
        context: context,
        message: 'Min quantity 1'.tr(),
      );
    }
  }
}

class _QuantityIcon extends StatelessWidget {
  final Function pressed;
  final IconData icon;
  const _QuantityIcon({
    Key? key,
    required this.pressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: ZPColors.primary,
          minimumSize: const Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          pressed();
        },
        child: Icon(
          icon,
          color: ZPColors.white,
        ),
      ),
    );
  }
}
