part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    Key? key,
    required this.returnItem,
    required this.counterOfferEnabled,
  }) : super(key: key);
  final ReturnMaterial returnItem;
  final bool counterOfferEnabled;

  @override
  Widget build(BuildContext context) {
    final bonusItems = returnItem.bonusItems;

    return bonusItems.isEmpty
        ? const SizedBox.shrink()
        : BlocBuilder<NewRequestBloc, NewRequestState>(
            buildWhen: (previous, current) =>
                previous.invoiceDetails != current.invoiceDetails,
            builder: (context, state) {
              return Column(
                children: bonusItems.map(
                  (bonusItem) {
                    final detail = state.getReturnItemDetails(bonusItem.uuid);

                    return Column(
                      children: [
                        _MaterialBonusInfoSection(
                          returnItem: returnItem,
                          bonusItem: bonusItem,
                        ),
                        if (detail.itemNumber.isNotEmpty &&
                            bonusItem.editDetailsAllowed)
                          _MaterialBonusDetailsSection(
                            item: bonusItem,
                            detail: detail,
                            counterOfferEnabled: counterOfferEnabled,
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
