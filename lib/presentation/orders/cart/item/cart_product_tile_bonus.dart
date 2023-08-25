import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';

class CartProductTileBonus extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;

  const CartProductTileBonus({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlidable(
      extentRatio: 0.24,
      endActionPaneActions: [
        CustomSlidableAction(
          label: '',
          icon: Icons.delete_outline,
          onPressed: (v) => context.read<CartBloc>().add(
                CartEvent.addBonusToCartItem(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  bonusMaterial: MaterialInfo.empty().copyWith(
                    materialNumber: bonusItem.materialNumber,
                    parentID: cartProduct.materialInfo.materialNumber
                        .getOrDefaultValue(''),
                    quantity: 0,
                  ),
                  user: context.read<UserBloc>().state.user,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                  counterOfferDetails: RequestCounterOfferDetails.empty(),
                  bonusItemId: bonusItem.itemId,
                ),
              ),
        ),
      ],
      borderRadius: 8,
      child: CustomCard(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            _MaterialDetailsSection(
              bonusItem: bonusItem,
              cartProduct: cartProduct,
            ),
            const _ItemSubTotalSection(),
          ],
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetailsSection({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MaterialImageSection(
            bonusItem: bonusItem,
          ),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  const _ItemSubTotalSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8,
        bottom: 8,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'FREE',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.textButtonColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
  const _MaterialDetails({
    Key? key,
    required this.bonusItem,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bonusItem.materialNumber.displayMatNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              const _BonusTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              bonusItem.materialDescription,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          _MaterialQuantitySection(
            bonusItem: bonusItem,
            cartProduct: cartProduct,
          ),
        ],
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final PriceAggregate cartProduct;
  final BonusSampleItem bonusItem;
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
      text: widget.bonusItem.qty.getOrDefaultValue(0).toString(),
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

  String get _qty => widget.bonusItem.qty.getOrDefaultValue(0).toString();

  @override
  void didUpdateWidget(covariant _MaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  void _upsertCart(BuildContext context, int qty) {
    if (MaterialQty(qty).isBonusMaxQuantityExceed) {
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
            bonusMaterial: MaterialInfo.empty().copyWith(
              materialNumber: widget.bonusItem.materialNumber,
              parentID: widget.cartProduct.materialInfo.materialNumber
                  .getOrDefaultValue(''),
              quantity: qty,
            ),
            user: context.read<UserBloc>().state.user,
            salesOrganisationConfigs:
                context.read<SalesOrgBloc>().state.configs,
            counterOfferDetails: RequestCounterOfferDetails.empty(),
            bonusItemId: widget.bonusItem.itemId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: CartItemQuantityInput(
        isEnabled: true,
        quantityAddKey: WidgetKeys.cartItemAddKey,
        quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
        quantityTextKey: WidgetKeys.quantityInputTextKey,
        controller: _controller,
        isLoading: context.read<CartBloc>().state.isUpserting,
        onFieldChange: (value) {},
        minusPressed: (k) => _upsertCart(context, k),
        addPressed: (k) => _upsertCart(context, k),
        onSubmit: (value) => _upsertCart(context, value),
        maximumQty: 999,
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  final BonusSampleItem bonusItem;
  const _MaterialImageSection({required this.bonusItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return CustomCard(
              showShadow: false,
              showBorder: true,
              padding: const EdgeInsets.all(12),
              child: CustomImage(
                imageUrl: state.additionInfo[bonusItem.materialNumber]
                        ?.productImages.first.thumbNail ??
                    '',
                fit: BoxFit.fitHeight,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _BonusTag extends StatelessWidget {
  const _BonusTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: ZPColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'Bonus',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: ZPColors.white,
            ),
      ),
    );
  }
}
