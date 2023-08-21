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
                        const SizedBox(
                          height: 8,
                        ),
                        _ActiveBonusButton(
                          data: item,
                          included: detail.itemNumber.isNotEmpty,
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

class _ActiveBonusButton extends StatelessWidget {
  const _ActiveBonusButton({
    Key? key,
    required this.data,
    required this.included,
  }) : super(key: key);

  final ReturnMaterial data;
  final bool included;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        key: WidgetKeys.returnActivateBonusButton(data.uuid),
        onPressed: () {
          context.read<NewRequestBloc>().add(
                NewRequestEvent.toggleBonusItem(
                  assignmentNumber: data.assignmentNumber,
                  itemNumber: data.itemNumber,
                  materialNumber: data.materialNumber,
                  included: !included,
                ),
              );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ZPColors.whiteBgCard,
          foregroundColor: ZPColors.primary,
          side: const BorderSide(color: ZPColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          included
              ? 'Exclude bonus from return request'.tr()
              : 'Include bonus in return request'.tr(),
        ),
      ),
    );
  }
}
