part of 'package:ezrxmobile/presentation/orders/cart/bonus/bonus_items_sheet.dart';

class _BonusItemSearchBar extends StatelessWidget {
  final PriceAggregate cartItem;
  const _BonusItemSearchBar({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 8),
          child: CustomSearchBar(
            key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
            onClear: () => _search(
              cartItem: cartItem,
              context: context,
              searchKey: '',
              onClear: true,
            ),
            onSearchChanged: (value) => _search(
              cartItem: cartItem,
              context: context,
              searchKey: value,
            ),
            enabled: true,
            onSearchSubmitted: (value) => _search(
              cartItem: cartItem,
              context: context,
              searchKey: value,
            ),
            initialValue: state.searchKey.searchValueOrEmpty,
            customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          ),
        );
      },
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
    required PriceAggregate cartItem,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<BonusMaterialBloc>().add(
          BonusMaterialEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            configs: context.read<EligibilityBloc>().state.salesOrgConfigs,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            principalData: cartItem.materialInfo.principalData,
            user: context.read<EligibilityBloc>().state.user,
            isGimmickMaterialEnabled:
                context.read<EligibilityBloc>().state.isGimmickMaterialEnabled,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }
}
