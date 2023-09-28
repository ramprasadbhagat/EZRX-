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
      labelText: context.tr('Bonus details'),
      toggle: _ToggleActiveButton(item: data),
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
                const SizedBox(
                  width: 5,
                ),
                StatusLabel(
                  status: StatusType('Bonus'),
                  valueColor: ZPColors.white,
                ),
              ],
            ),
            Text(
              data.materialDescription,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              '${context.tr('Batch')} ${data.batch} (${context.tr('Expires')} ${data.expiryDate.dateString})',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                    fontSize: 12,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceComponent(
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: data.unitPrice.apiParameterValue,
                  type: PriceStyle.summaryPrice,
                ),
                Text(
                  '${context.tr('Qty')}: ${data.balanceQuantity.apiParameterValue} ',
                ),
              ],
            ),
            Text(
              context.tr(
                'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
              ),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.changePasswordRecommendationColor,
                    fontSize: 10,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleActiveButton extends StatelessWidget {
  final ReturnMaterial item;

  const _ToggleActiveButton({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.isIncludeBonus(item.uuid) !=
          current.isIncludeBonus(item.uuid),
      builder: (context, state) {
        return Row(
          children: [
            Text(
              context.tr('Include bonus'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                    fontSize: 12.0,
                  ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                useMaterial3: true,
                colorScheme: const ColorScheme.light().copyWith(
                  outline: ZPColors.extraLightGrey3,
                ),
              ),
              child: Switch(
                key: WidgetKeys.toggleIncludeBonusButton,
                activeTrackColor: ZPColors.textButtonColor,
                inactiveTrackColor: ZPColors.extraLightGrey3,
                thumbColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) => ZPColors.white,
                ),
                thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Icon(
                        Icons.check,
                        color: ZPColors.textButtonColor,
                      );
                    }

                    return const Icon(
                      Icons.close,
                      color: ZPColors.extraLightGrey3,
                    );
                  },
                ),
                value: state.isIncludeBonus(item.uuid),
                onChanged: (bool value) {
                  context.read<NewRequestBloc>().add(
                        NewRequestEvent.toggleBonusItem(
                          item: item,
                          included: value,
                        ),
                      );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
