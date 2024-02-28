part of 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';

class _PreOrderScrollSection extends StatelessWidget {
  const _PreOrderScrollSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CartState state;

  @override
  Widget build(BuildContext context) {
    final preOrderItems = state.allMaterial.preOrderItems;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ScrollList<PriceAggregate>(
          key: WidgetKeys.preOrderModalItemList,
          noRecordFoundWidget: const SizedBox.shrink(),
          controller: ScrollController(),
          onRefresh: null,
          isLoading: false,
          itemBuilder: (context, index, item) {
            final isDifferentSeller =
                preOrderItems.showOOSManufacturerName(index);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (index != 0 && isDifferentSeller)
                  const Divider(
                    color: ZPColors.lightGray2,
                    indent: 0,
                    endIndent: 0,
                    height: 10,
                    thickness: 1,
                  ),
                if (isDifferentSeller)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: _ManufacturerName(
                      cartProduct: item.materialInfo,
                    ),
                  ),
                _PreOrderProductTile(
                  cartProduct: item,
                ),
              ],
            );
          },
          items: preOrderItems,
        ),
      ),
    );
  }
}
