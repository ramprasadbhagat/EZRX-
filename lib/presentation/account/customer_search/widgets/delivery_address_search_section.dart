part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _DeliveryAddressSearchSection extends StatelessWidget {
  const _DeliveryAddressSearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: BlocConsumer<CustomerCodeBloc, CustomerCodeState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
                current.apiFailureOrSuccessOption ||
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
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
            onSearchChanged: (value) {
              context.read<CustomerCodeBloc>().add(
                    CustomerCodeEvent.search(
                      searchValue: SearchKey.search(value),
                    ),
                  );
            },
            onSearchSubmitted: (value) {
              context.read<CustomerCodeBloc>().add(
                    CustomerCodeEvent.search(
                      searchValue: SearchKey.search(value),
                    ),
                  );
            },
            customValidator: (value) => SearchKey.search(value).isValid(),
            enabled: !state.isFetching,
            onClear: () {
              context.read<CustomerCodeBloc>().add(
                    const CustomerCodeEvent.deletedSearch(),
                  );
            },
            initialValue: state.searchKey.getOrDefaultValue(''),
          );
        },
      ),
    );
  }
}
