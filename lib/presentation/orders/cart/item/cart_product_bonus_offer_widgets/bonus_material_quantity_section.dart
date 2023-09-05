part of 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';

class _MaterialQuantitySection extends StatefulWidget {
  final MaterialItemBonus bonusItem;
  const _MaterialQuantitySection({
    Key? key,
    required this.bonusItem,
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
      text: _qty,
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

  String get _qty => widget.bonusItem.qty.toString();

  @override
  void didUpdateWidget(covariant _MaterialQuantitySection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_qty != _controller.text) {
      _controller.text = _qty;
      _controller.selection = TextSelection.collapsed(offset: _qty.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Focus(
        child: CartItemQuantityInput(
          isEnabled: false,
          quantityAddKey: WidgetKeys.bonusOfferItemAddKey,
          quantityDeleteKey: WidgetKeys.bonusOfferItemDeleteKey,
          quantityTextKey: WidgetKeys.bonusOfferItemInputKey,
          controller: _controller,
          onFieldChange: (value) {},
          minusPressed: (k) {},
          addPressed: (k) {},
          onSubmit: (value) {},
        ),
      ),
    );
  }
}
