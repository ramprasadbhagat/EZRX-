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
            context: context,
            searchKey: value,
          ),
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          hintText: context.tr(
            context.isMPPayment ? 'Search by MP document number' : 'Search',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          enabled: !state.isLoading,
          onClear: () => _search(
            context: context,
            searchKey: '',
          ),
          initialValue: state.searchKey.searchValueOrEmpty,
        );
      },
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    trackMixpanelEvent(TrackingEvents.documentNumberSearched);
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            appliedFilter: searchKey.isEmpty
                ? AvailableCreditFilter.defaultFilter()
                : AvailableCreditFilter.empty(),
            searchKey: SearchKey.searchFilter(searchKey),
            isMarketPlace: context.isMPPayment,
          ),
        );
  }
}
