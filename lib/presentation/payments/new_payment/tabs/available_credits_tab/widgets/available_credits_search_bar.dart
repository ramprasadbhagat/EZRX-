part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart';

class _AvailableCreditsSearchBar extends StatelessWidget {
  const _AvailableCreditsSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          onSearchChanged: (value) {},
          onSearchSubmitted: (value) =>
              context.read<AvailableCreditsBloc>().add(
                    AvailableCreditsEvent.fetch(
                      appliedFilter: state.appliedFilter,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      searchKey: SearchKey.search(value),
                    ),
                  ),
          hintText: 'Search by document number'.tr(),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Only digits
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          customValidator: (value) => SearchKey.search(value).isValid(),
          enabled: !state.isLoading,
          onClear: () => context.read<AvailableCreditsBloc>().add(
                AvailableCreditsEvent.fetch(
                  appliedFilter: state.appliedFilter,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  searchKey: SearchKey.search(''),
                ),
              ),
          initialValue: state.searchKey.searchValueOrEmpty,
        );
      },
    );
  }
}
