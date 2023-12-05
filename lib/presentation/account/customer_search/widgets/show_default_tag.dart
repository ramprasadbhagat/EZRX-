part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _ShowDefaultTag extends StatelessWidget {
  const _ShowDefaultTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Chip(
        label: Text(
          context.tr('Default'),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: ZPColors.neutralsDarkBlack,
              ),
        ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: -3),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: ZPColors.orangeChipColor,
        visualDensity: const VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
      ),
    );
  }
}
