part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    Key? key,
    required this.items,
  }) : super(key: key);
  final List<ReturnMaterial> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const SizedBox.shrink()
        : ExpandableInfo(
            labelText: 'Bonus details'.tr(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items
                  .map(
                    (ReturnMaterial returnMaterial) => BonusMaterialInfo(
                      data: returnMaterial,
                      noteLineVisible: true,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
