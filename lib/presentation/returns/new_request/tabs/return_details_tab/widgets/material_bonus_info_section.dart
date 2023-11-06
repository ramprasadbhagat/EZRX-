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
      child: Column(
        children: [
          if (!data.balanceQuantity.isGreaterThanZero)
            InfoLabel(
              margin: EdgeInsets.zero,
              mainColor: ZPColors.priceWarning,
              textValue:
                  'You cannot return this bonus item as there is no balance quantity.'
                      .tr(),
            ),
          BonusMaterialInfo(
            data: data,
            noteLineVisible: true,
          ),
        ],
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
                value: item.balanceQuantity.isGreaterThanZero &&
                    state.isIncludeBonus(item.uuid),
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
