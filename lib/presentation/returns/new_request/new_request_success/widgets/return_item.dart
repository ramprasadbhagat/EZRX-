part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnItem extends StatelessWidget {
  final ReturnMaterial returnMaterial;
  final ReturnItemDetails returnItemDetail;
  const _ReturnItem({
    Key? key,
    required this.returnMaterial,
    required this.returnItemDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.returnSuccessfulItemKey,
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          if (returnMaterial.displayOutSidePolicy(
            context
                .read<EligibilityBloc>()
                .state
                .salesOrgConfigs
                .allowReturnsOutsidePolicy,
          ))
            const OutsideReturnPolicyTag(),
          _ReturnMaterialExpAndStatus(returnMaterial: returnMaterial),
          const SizedBox(height: 8.0),
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
                  materialNumber: returnMaterial.materialNumber,
                ),
              ),
              Expanded(
                child: MaterialInfoWidget(
                  data: returnMaterial,
                  showBatchExp: false,
                ),
              ),
            ],
          ),
          MaterialQuantityAndPrice(
            quantity: returnItemDetail.returnQuantity.getIntValue,
            totalPrice: returnItemDetail.returnValue,
          ),
          _ReturnExpandableSection(
            children: [
              _ExpandableMaterialDetails(materialDetail: returnMaterial),
              _ExpandableReturnDetail(returnItemDetail: returnItemDetail),
              _ExpandableBonusItems(
                bonusItems: context
                    .read<NewRequestBloc>()
                    .state
                    .getBonusItemsWithBalanceQuantity(
                      returnMaterial,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
