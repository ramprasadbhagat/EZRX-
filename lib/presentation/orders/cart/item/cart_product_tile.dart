import 'package:ezrxmobile/domain/order/entities/cart_product.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';

class CartProductTile extends StatelessWidget {
  final CartProduct cartItem;
  const CartProductTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlidable(
      endActionPaneActions: [
        CustomSlidableAction(
          label: '',
          icon: Icons.delete_outline,
          onPressed: (v) {},
        ),
      ],
      borderRadius: 8,
      child: CustomCard(
        margin: const EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            _MaterialDetailsSection(
              cartItem: cartItem,
            ),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.accentColor,
            ),
            const _ItemSubTotalSection(),
            const Divider(
              indent: 0,
              endIndent: 0,
              color: ZPColors.accentColor,
            ),
            const _BonusSection(),
          ],
        ),
      ),
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  final CartProduct cartItem;
  const _MaterialDetailsSection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MaterialImageSection(),
          const SizedBox(
            width: 8,
          ),
          _MaterialDetails(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _ItemSubTotalSection extends StatelessWidget {
  const _ItemSubTotalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Item subtotal:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: ZPColors.darkGray,
                ),
          ),
          RichText(
            text: TextSpan(
              text: 'MYR ',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ZPColors.primary,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: '11,000.00',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialDetails extends StatelessWidget {
  final CartProduct cartItem;
  const _MaterialDetails({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                cartItem.productID.displayMatNo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              const _OrderTag(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              cartItem.materialDescription,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'MYR 11,200.00 ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.darkGray,
                    decoration: TextDecoration.lineThrough,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'MYR 11,000.00',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.extraLightGrey4,
                        decoration: TextDecoration.none,
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Requested counter offer',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          _MaterialQuantitySection(cartItem: cartItem),
        ],
      ),
    );
  }
}

class _MaterialQuantitySection extends StatefulWidget {
  final CartProduct cartItem;
  const _MaterialQuantitySection({Key? key, required this.cartItem})
      : super(key: key);

  @override
  State<_MaterialQuantitySection> createState() =>
      _MaterialQuantitySectionState();
}

class _MaterialQuantitySectionState extends State<_MaterialQuantitySection> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.value = TextEditingValue(
      text: widget.cartItem.quantity.toString(),
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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Focus(
        child: CartItemQuantityInput(
          isEnabled: true,
          quantityAddKey: WidgetKeys.cartItemAddKey,
          quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
          quantityTextKey: WidgetKeys.quantityInputTextKey,
          controller: _controller,
          onFieldChange: (value) {},
          minusPressed: (k) {},
          addPressed: (k) {},
          isLoading: false,
        ),
      ),
    );
  }
}

class _BonusSection extends StatelessWidget {
  const _BonusSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline,
              color: ZPColors.extraDarkGreen,
            ),
            label: Text(
              'Bonus/sample item',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: ZPColors.extraDarkGreen),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.swap_horiz_sharp,
              color: ZPColors.extraDarkGreen,
            ),
            label: Text(
              'Counter offer',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: ZPColors.extraDarkGreen),
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialImageSection extends StatelessWidget {
  const _MaterialImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCard(
          showShadow: false,
          showBorder: true,
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(
            'assets/svg/default_product_image.svg',
            key: WidgetKeys.cartProductImage,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
          ),
        ),
        const _OfferTag(),
      ],
    );
  }
}

class _OfferTag extends StatelessWidget {
  const _OfferTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: const BoxDecoration(
        color: ZPColors.darkYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: const Icon(
        Icons.local_offer_outlined,
        color: ZPColors.white,
      ),
    );
  }
}

class _OrderTag extends StatelessWidget {
  const _OrderTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: ZPColors.lightYellow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        'Preorder',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
      ),
    );
  }
}
