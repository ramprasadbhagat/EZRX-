part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget {
  final ReturnMaterial item;
  final ReturnItemDetails detail;
  const _ReturnMaterialWidget({
    Key? key,
    required this.item,
    required this.detail,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      builder: (context, state) {
        return CustomCard(
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageWithLabel(materialNumber: item.materialNumber),
                  Expanded(
                    child: MaterialInfoWidget(data: item),
                  ),
                ],
              ),
              _QuantityAndPrice(
                quantity: detail.returnQuantity.getIntValue,
                unitPrice: state.returnItemTotal(item.assignmentNumber),
              ),
              ExpandableSection(
                expanded: true,
                children: [
                  MaterialDetailsSection(
                    key: WidgetKeys.newRequestStep3MaterialDetail,
                    data: item,
                  ),
                  _MaterialReturnDetailsSection(
                    detail: detail,
                  ),
                  _BonusItemSection(
                    items: item.bonusItems,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
