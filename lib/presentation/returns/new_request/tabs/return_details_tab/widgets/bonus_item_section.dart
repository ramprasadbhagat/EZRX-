part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

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
            builder: (context, state) {
              return Column(
                children: items.map(
                  (item) {
                    final detail = context
                        .read<NewRequestBloc>()
                        .state
                        .getReturnItemDetails(item.uuid);

                    return Column(
                      children: [
                        _MaterialBonusInfoSection(data: item),
                        if (detail.itemNumber.isNotEmpty)
                          _MaterialBonusDetailsSection(
                            item: item,
                            detail: detail,
                          ),
                      ],
                    );
                  },
                ).toList(),
              );
            },
          );
  }
}
