part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ReturnMaterialInfo extends StatelessWidget {
  const _ReturnMaterialInfo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.newReturnItem,
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(0),
      child: Column(
        children: [
          if (data.outsidePolicy) const OutsideReturnPolicyTag(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageWithLabel(
                materialNumber: data.materialNumber,
              ),
              Expanded(
                child: MaterialInfoWidget(data: data),
              ),
            ],
          ),
          MaterialQuantityAndPrice(
            quantity: data.balanceQuantity.getOrDefaultValue(0),
            totalPrice: data.totalPrice.getOrDefaultValue(0),
          ),
          ExpandableSection(
            expanded: false,
            children: [
              MaterialDetailsSection(
                data: data,
              ),
              _BonusItemSection(
                items: data.bonusItems,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
