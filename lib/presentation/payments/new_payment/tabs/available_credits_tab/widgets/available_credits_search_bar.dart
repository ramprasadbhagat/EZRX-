part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart';

class _AvailableCreditsSearchBar extends StatelessWidget {
  const _AvailableCreditsSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          onSearchChanged: (value) => _search(
            appliedFilter: state.appliedFilter,
            context: context,
            searchKey: value,
          ),
          onSearchSubmitted: (value) => _search(
            appliedFilter: state.appliedFilter,
            context: context,
            searchKey: value,
          ),
          hintText: 'Search by document number'.tr(),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Only digits
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          enabled: !state.isLoading,
          onClear: () => _search(
            appliedFilter: state.appliedFilter,
            context: context,
            searchKey: '',
            onClear: true,
          ),
          initialValue: state.searchKey.searchValueOrEmpty,
        );
      },
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
    required AvailableCreditFilter appliedFilter,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    trackMixpanelEvent(MixpanelEvents.documentNumberSearched);
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            appliedFilter: appliedFilter,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }
}
