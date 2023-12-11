part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _ReturnMaterialWidget extends StatelessWidget {
  final ReturnMaterial item;
  const _ReturnMaterialWidget({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(item.uuid) !=
          current.getReturnItemDetails(item.uuid),
      builder: (context, state) {
        final detail = state.getReturnItemDetails(item.uuid);
        final returnBonusItems = state.getReturnBonusItemsOfMainItem(item);

        return CustomCard(
          key: WidgetKeys.returnReviewItemKey,
          showBorder: true,
          showShadow: false,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              if (item.displayOutSidePolicy(
                context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .allowReturnsOutsidePolicy,
              ))
                const OutsideReturnPolicyTag(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCard(
                    showShadow: false,
                    showBorder: true,
                    child: ProductImage(
                      width: MediaQuery.of(context).size.height * 0.1,
                      height: MediaQuery.of(context).size.height * 0.1,
                      fit: BoxFit.fitHeight,
                      materialNumber: item.materialNumber,
                    ),
                  ),
                  Expanded(
                    child: MaterialInfoWidget(
                      data: item,
                    ),
                  ),
                ],
              ),
              MaterialQuantityAndPrice(
                quantity: detail.returnQuantity.getIntValue,
                totalPrice: detail.returnValue,
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
                    items: returnBonusItems,
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
