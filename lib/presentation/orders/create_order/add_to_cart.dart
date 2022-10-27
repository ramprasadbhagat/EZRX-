import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  final MaterialInfo materialInfo;
  final String unitPrice;
  const AddToCart({
    Key? key,
    required this.materialInfo,
    required this.unitPrice,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = '0';
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
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox.shrink(),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.cancel,
                      size: 25,
                      color: ZPColors.primary,
                    ),
                  ),
                ],
              ),
              Text(
                widget.materialInfo.materialDescription,
                style: Theme.of(context).textTheme.headline6?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              const SizedBox(
                height: 30,
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
                      if (int.parse(_controller.text) > 0) {
                        _controller.text =
                            (int.parse(_controller.text) - 1).toString();
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
                      ),
                    ),
                  ),
                  _QuantityIcon(
                    pressed: () {
                      //todo
                      //If salesOrg is 'VN', quantity must be less than zDP5RemainingQuota
                      //context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg.isVN
                      //Get the final Price
                      _controller.text =
                          (int.parse(_controller.text) + 1).toString();
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '${'Unit Price: '.tr()}${widget.unitPrice}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ZPColors.primary,
                ),
              ),
              const SizedBox(
                height: 30,
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
                    onPressed: () => _addToCart(context),
                    child: const Text('Add to Cart').tr(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    if (int.parse(_controller.text) > 0) {
      final cartItemList = context.read<CartBloc>().state.cartItemList;
      if (widget.materialInfo.materialGroup4.isFOC &&
          cartItemList.any((e) => !e.materialInfo.materialGroup4.isFOC)) {
        showSnackBar(
          context: context,
          message: 'Covid material cannot be combined with commercial material.'
              .tr(),
        );
      } else if (!widget.materialInfo.materialGroup4.isFOC &&
          cartItemList.any((e) => e.materialInfo.materialGroup4.isFOC)) {
        showSnackBar(
          context: context,
          message: 'Commercial material cannot be combined with covid material.'
              .tr(),
        );
      } else {
        context.read<CartBloc>().add(
              CartEvent.addToCart(
                item: CartItem.empty().copyWith(
                  materialInfo: widget.materialInfo,
                  quantity: int.parse(_controller.text),
                ),
              ),
            );
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
