part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _MaterialBonusInfoSection extends StatelessWidget {
  const _MaterialBonusInfoSection({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: 'Bonus details'.tr(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: ZPColors.extraLightGrey3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  data.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: ZPColors.primary,
                  ),
                  child: Text(
                    'Bonus'.tr(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.white,
                          fontSize: 10,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              data.materialDescription,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${'Batch'.tr()} ${data.batch} (${'Expires'.tr()} ${data.expiryDate.dateString})',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.darkGray,
                          fontSize: 12,
                        ),
                  ),
                ),
                Text(
                  '${'Qty'.tr()}: ${data.balanceQuantity.apiParameterValue} ',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
