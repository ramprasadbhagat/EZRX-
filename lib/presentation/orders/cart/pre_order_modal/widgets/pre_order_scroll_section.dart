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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                index == 0 ||
                        preOrderItems[index]
                                .materialInfo
                                .principalData
                                .principalName
                                .getValue() !=
                            preOrderItems[index - 1]
                                .materialInfo
                                .principalData
                                .principalName
                                .getValue()
                    ? _ManufacturerName(
                        cartProduct: item.materialInfo,
                      )
                    : const SizedBox(),
                _PreOrderProductTile(
                  cartProduct: item,
                ),
                const SizedBox(
                  height: 10,
                ),
                index == state.cartProducts.length - 1
                    ? const SizedBox.shrink()
                    : const Divider(
                        color: ZPColors.lightGray2,
                        indent: 0,
                        endIndent: 0,
                        height: 15,
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
