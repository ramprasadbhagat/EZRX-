part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ReturnMaterialExpAndStatus extends StatelessWidget {
  final ReturnMaterial returnMaterial;
  const _ReturnMaterialExpAndStatus({
    Key? key,
    required this.returnMaterial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'Batch'.tr()} ${returnMaterial.batch}} ',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.extraLightGrey4,
                    fontSize: 12,
                  ),
            ),
            Text(
              '(${'EXP:'.tr()} ${returnMaterial.expiryDate.dateString})',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.extraLightGrey4,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
        StatusLabel(
          status: StatusType('Pending approval'),
          valueColor: ZPColors.neutralsBlack,
        ),
      ],
    );
  }
}
