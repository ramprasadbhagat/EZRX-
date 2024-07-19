part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _DeliveryAddressSearchSection extends StatelessWidget {
  const _DeliveryAddressSearchSection();

  @override
  Widget build(BuildContext context) {
    final initialSearchKey = context.read<CustomerCodeBloc>().state.searchKey;

    return Padding(
      padding: const EdgeInsets.all(padding12),
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(
          key: initialSearchKey.searchValueOrEmpty,
        ),
        onSearchChanged: (value) {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(
                  searchValue: SearchKey.search(value),
                ),
              );
        },
        onSearchSubmitted: (value) {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(
                  searchValue: SearchKey.search(value),
                ),
              );
        },
        customValidator: (value) => SearchKey.search(value).isValid(),
        enabled: true,
        onClear: () {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(searchValue: SearchKey.empty()),
              );
        },
        initialValue: initialSearchKey.searchValueOrEmpty,
      ),
    );
  }
}
