part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _MaterialQuantitySection extends StatefulWidget {
  final PriceAggregate comboItem;
  final ComboDealMaterial comboDealMaterial;
  const _MaterialQuantitySection({
    Key? key,
    required this.comboItem,
    required this.comboDealMaterial,
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
      text: widget.comboItem.quantity.toString(),
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
    final bloc = context.read<ComboDealMaterialDetailBloc>();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Focus(
        child: CartItemQuantityInput(
          isEnabled: true,
          quantityAddKey: WidgetKeys.cartItemAddKey,
          quantityDeleteKey: WidgetKeys.cartItemDeleteKey,
          quantityTextKey: WidgetKeys.quantityInputTextKey,
          minimumQty: widget.comboDealMaterial.minQty,
          controller: _controller,
          onFieldChange: (value) {},
          minusPressed: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          addPressed: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          onSubmit: (quantity) {
            bloc.add(
              ComboDealMaterialDetailEvent.updateItemQuantity(
                item: widget.comboItem.getMaterialNumber,
                qty: quantity,
              ),
            );
          },
          isLoading: false,
        ),
      ),
    );
  }
}
