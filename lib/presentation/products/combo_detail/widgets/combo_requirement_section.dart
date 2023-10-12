part of 'package:ezrxmobile/presentation/products/combo_detail/combo_detail_page.dart';

class _ComboRequirementSection extends StatelessWidget {
  const _ComboRequirementSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      showShadow: false,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      backgroundColor: ZPColors.comboOffersBg,
      borderColor: ZPColors.comboRequirementBorder,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.tr('Requirement'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.comboRequirementSubTitle,
                ),
          ),
          //TODO: Change title base on combo type
          Text(
            context.tr('Purchase all items with min. of its quantity.'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.comboRequirementTitle,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            context.tr('Discount on'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.comboRequirementSubTitle,
                ),
          ),
          //TODO: Change title base on combo type
          Text(
            context.tr('Per item'),
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.comboRequirementTitle,
                ),
          ),
        ],
      ),
    );
  }
}
