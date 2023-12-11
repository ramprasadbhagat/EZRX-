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
          if (data.displayOutSidePolicy(
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
                  materialNumber: data.materialNumber,
                ),
              ),
              Expanded(
                child: MaterialInfoWidget(data: data),
              ),
            ],
          ),
          MaterialQuantityAndPrice(
            quantity: data.targetQuantity.getOrDefaultValue(0),
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
