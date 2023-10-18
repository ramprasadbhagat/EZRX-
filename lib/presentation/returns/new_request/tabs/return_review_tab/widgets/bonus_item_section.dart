part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

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
        : BlocBuilder<NewRequestBloc, NewRequestState>(
            buildWhen: (previous, current) =>
                previous.invoiceDetails != current.invoiceDetails,
            builder: (context, state) => ExpandableInfo(
              labelText: 'Bonus details'.tr(),
              child: Column(
                children: items
                    .map(
                      (item) => BonusMaterialInfo(
                        data: item,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
  }
}
