part of '../pre_order_modal.dart';

class _PreOrderScrollSection extends StatelessWidget {
  const _PreOrderScrollSection({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CartState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ScrollList<PriceAggregate>(
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
                        state.cartProducts[index].materialInfo.principalData
                                .principalName
                                .getValue() !=
                            state.cartProducts[index - 1].materialInfo
                                .principalData.principalName
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
          items: state.cartProducts.where((e) => e.isPreOrder).toList(),
        ),
      ),
    );
  }
}
