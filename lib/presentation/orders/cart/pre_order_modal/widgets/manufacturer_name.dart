part of '../pre_order_modal.dart';

class _ManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _ManufacturerName({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        cartProduct.principalData.principalName.getValue(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}
