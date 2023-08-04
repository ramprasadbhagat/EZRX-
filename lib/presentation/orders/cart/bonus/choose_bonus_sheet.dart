import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';

import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class UpdateBonus extends StatefulWidget {
  const UpdateBonus({
    Key? key,
    required this.materialInfo,
    required this.cartItem,
    required this.isUpdateFromCart,
  }) : super(key: key);

  final MaterialInfo materialInfo;
  final CartItem cartItem;
  final bool isUpdateFromCart;

  @override
  State<UpdateBonus> createState() => _UpdateBonusState();
}

class _UpdateBonusState extends State<UpdateBonus> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    controller.text = widget.materialInfo.quantity == 0
        ? '1'
        : widget.materialInfo.quantity.toString();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('updateBonus'),
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
                    widget.materialInfo.materialDescription,
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: ZPColors.black, // ZPColors.black,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    widget.materialInfo.principalData.principalName
                        .getOrDefaultValue(''),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.materialInfo.materialNumber.displayMatNo.tr(),
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QuantityInput(
                      isEnabled: true,
                      quantityAddKey: const Key('bounsAdd'),
                      quantityDeleteKey: const Key('bonusDelete'),
                      quantityTextKey: const Key('bonusItem'),
                      controller: controller,
                      onFieldChange: (p0) {},
                      addPressed: (p0) {},
                      minusPressed: (p0) {},
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
            ElevatedButton(
              key: const Key('addButton'),
              onPressed: () {
                context.read<CartBloc>().add(
                      CartEvent.addBonusToCartItem(
                        item: widget.cartItem,
                        bonusItem: MaterialItemBonus.empty().copyWith(
                          materialInfo: widget.materialInfo,
                          materialDescription:
                              widget.materialInfo.materialDescription,
                          additionalBonusFlag: true,
                          bonusOverrideFlag: true,
                          qty: int.tryParse(controller.text) ?? 1,
                        ),
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
                        shipToInfo:
                            context.read<CustomerCodeBloc>().state.shipToInfo,
                      ),
                    );

                context.router.pop();
                CustomSnackBar(
                  messageText: 'Bonus item added to the cart'.tr(),
                ).show(context);
              },
              child: const Text('Add To Bonus').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
