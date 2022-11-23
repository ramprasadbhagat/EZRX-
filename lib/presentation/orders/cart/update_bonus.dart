import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateBonus extends StatelessWidget {
  const UpdateBonus({
    Key? key,
    required this.materialInfo,
    required this.cartItem,
    required this.isUpdateFromCart,
  }) : super(key: key);

  final MaterialInfo materialInfo;
  final PriceAggregate cartItem;
  final bool isUpdateFromCart;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: '${materialInfo.quantity == 0 ? "1" : materialInfo.quantity}',
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      materialInfo.materialDescription,
                      style: Theme.of(context).textTheme.headline6?.apply(
                            color: ZPColors.black, // ZPColors.black,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      materialInfo.principalData.principalName,
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  ),
                  Center(
                    child: Text(
                      materialInfo.materialNumber.displayMatNo,
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      QuantityInput(
                        quantityAddKey: const Key('bounsAdd'),
                        quantityDeleteKey: const Key('bonusDelete'),
                        quantityTextKey: const Key('bonusItem'),
                        controller: controller,
                        onFieldChange: (p0) {},
                        minusPressed: (p0) {},
                        addPressed: (p0) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // final updatedCartItem = cartItem.copyWith(
                  //   quantity: int.tryParse(controller.text) ?? 1,
                  // );
                  context.read<CartBloc>().add(
                        CartEvent.updateBonusItem(
                          bonusItem: materialInfo,
                          bonusItemCount: int.tryParse(controller.text) ?? 1,
                          cartItem: cartItem,
                          isUpdateFromCart: isUpdateFromCart,
                        ),
                      );

                  context.router.pop();
                  showSnackBar(
                    context: context,
                    message: 'Bonus item added to the cart'.tr(),
                  );
                },
                child: const Text('Add To Bonus').tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
