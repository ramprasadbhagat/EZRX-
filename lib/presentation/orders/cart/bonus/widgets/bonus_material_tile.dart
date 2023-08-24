import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/presentation/core/product_image.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';

class BonusMaterialTile extends StatelessWidget {
  final MaterialInfo bonusMaterial;
  final PriceAggregate cartProduct;
  const BonusMaterialTile({
    Key? key,
    required this.bonusMaterial,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(bonusMaterial: bonusMaterial),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  bonusMaterial.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    bonusMaterial.displayDescription,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _MaterialQuantitySection(
                        bonusItem: bonusMaterial,
                        cartProduct: cartProduct,
                      ),
                    ),
                    const SizedBox(width: 15),
                    _CartIcon(
                      bonusItem: bonusMaterial,
                      cartProduct: cartProduct,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final MaterialInfo bonusMaterial;
  const _MaterialImageSection({
    required this.bonusMaterial,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageBloc, ProductImageState>(
      buildWhen: (previous, current) =>
          previous.materialUrlMap != current.materialUrlMap,
      builder: (context, state) {
        return CustomCard(
          showShadow: false,
          showBorder: true,
          padding: const EdgeInsets.all(12),
          child: ProductImage(
            width: MediaQuery.of(context).size.height * 0.06,
            height: MediaQuery.of(context).size.height * 0.06,
            fit: BoxFit.fitHeight,
            materialNumber: bonusMaterial.materialNumber,
          ),
        );
      },
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final MaterialInfo bonusItem;
  final PriceAggregate cartProduct;
  const _MaterialQuantitySection({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: widget.bonusItem.quantity.toString(),
      selection: TextSelection.collapsed(
        offset: _controller.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.upsertBonusItemInProgressHashCode !=
          current.upsertBonusItemInProgressHashCode,
      builder: (context, state) {
        final isBonusMaterialLoading =
            state.upsertBonusItemInProgressHashCode.contains(
          widget.bonusItem
              .copyWith(
                parentID: widget.cartProduct.materialInfo.materialNumber
                    .getOrDefaultValue(''),
                quantity: widget.cartProduct
                    .totalCartProductBonusQty(widget.bonusItem),
                type: MaterialInfoType(''),
              )
              .hashCode,
        );

        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CartItemQuantityInput(
            height: 40,
            isEnabled: !isBonusMaterialLoading,
            quantityAddKey: WidgetKeys.cartItemAddKey,
            quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
            quantityTextKey: WidgetKeys.quantityInputTextKey,
            controller: _controller,
            onFieldChange: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: value,
                    ),
                  ),
                ),
            minusPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: k,
                    ),
                  ),
                ),
            addPressed: (k) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: k,
                    ),
                  ),
                ),
            onSubmit: (value) => context.read<BonusMaterialBloc>().add(
                  BonusMaterialEvent.updateBonusItemQuantity(
                    updatedBonusItem: widget.bonusItem.copyWith(
                      quantity: value,
                    ),
                  ),
                ),
            maximumQty: 999,
          ),
        );
      },
    );
  }
}

class _CartIcon extends StatelessWidget {
  final MaterialInfo bonusItem;
  final PriceAggregate cartProduct;
  const _CartIcon({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  void _addBonusMaterial(BuildContext context) {
    if (MaterialQty(bonusItem.quantity).isBonusMaxQuantityExceed) {
      CustomSnackBar(
        icon: const Icon(
          Icons.info,
          color: ZPColors.error,
        ),
        backgroundColor: ZPColors.errorSnackBarColor,
        messageText: 'In cart quantity should not be greater than 999'.tr(),
      ).show(context);

      return;
    }

    context.read<CartBloc>().add(
          CartEvent.addBonusToCartItem(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            bonusMaterial: bonusItem.copyWith(
              parentID:
                  cartProduct.materialInfo.materialNumber.getOrDefaultValue(''),
              quantity: cartProduct.totalCartProductBonusQty(bonusItem),
              type: MaterialInfoType(''),
            ),
            user: context.read<UserBloc>().state.user,
            salesOrganisationConfigs:
                context.read<SalesOrgBloc>().state.configs,
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            bonusItemId:
                cartProduct.bonusMaterialItemId(bonusItem.materialNumber),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BonusMaterialBloc, BonusMaterialState>(
      listenWhen: (previous, current) =>
          previous.isBonusQtyValidated != current.isBonusQtyValidated &&
          current.isBonusQtyValidated,
      listener: (context, state) {
        if (state.bonusMaterialHashCode == bonusItem.hashCode) {
          _addBonusMaterial(context);
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous.upsertBonusItemInProgressHashCode !=
            current.upsertBonusItemInProgressHashCode,
        builder: (context, state) {
          final isBonusMaterialLoading =
              state.upsertBonusItemInProgressHashCode.contains(
            bonusItem
                .copyWith(
                  parentID: cartProduct.materialInfo.materialNumber
                      .getOrDefaultValue(''),
                  quantity: cartProduct.totalCartProductBonusQty(bonusItem),
                  type: MaterialInfoType(''),
                )
                .hashCode,
          );

          return Container(
            height: 40,
            width: 40,
            padding: isBonusMaterialLoading
                ? const EdgeInsets.all(8)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: isBonusMaterialLoading
                  ? ZPColors.lightPrimary
                  : ZPColors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: isBonusMaterialLoading
                ? const CircularProgressIndicator(
                    strokeWidth: 2,
                    color: ZPColors.white,
                  )
                : IconButton(
                    visualDensity: VisualDensity.compact,
                    key: WidgetKeys.cartButton,
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: ZPColors.white,
                    ),
                    onPressed: () => context.read<BonusMaterialBloc>().add(
                          BonusMaterialEvent.validateBonusQuantity(
                            bonusMaterial: bonusItem,
                          ),
                        ),
                  ),
          );
        },
      ),
    );
  }
}
