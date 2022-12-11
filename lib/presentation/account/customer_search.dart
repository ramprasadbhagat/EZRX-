import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

class CustomerSearchPage extends StatefulWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  State<CustomerSearchPage> createState() => _CustomerSearchPage();
}

class _CustomerSearchPage extends State<CustomerSearchPage> {
  late TextEditingController _searchController;
  late CustomerCodeBloc customerCodeBloc;
  late SalesOrgBloc salesOrgBloc;
  late UserBloc userBloc;
  // Timer? _debounce;
  @override
  void initState() {
    _searchController = TextEditingController();
    customerCodeBloc = context.read<CustomerCodeBloc>();
    final searchText = customerCodeBloc.state.searchKey;
    if (customerCodeBloc.state.isSearchActive && searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrCrash(),
        selection: TextSelection.collapsed(
          offset: searchText.getOrCrash().length,
        ),
      );
    }
    salesOrgBloc = context.read<SalesOrgBloc>();
    userBloc = context.read<UserBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('customerSearchPage'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomAppBar(
          child: BlocConsumer<CustomerCodeBloc, CustomerCodeState>(
            listenWhen: (previous, current) =>
                previous.searchKey != current.searchKey,
            listener: (context, state) {
              state.apiFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {},
                ),
              );
              final searchText = state.searchKey.getValue();
              _searchController.value = TextEditingValue(
                text: searchText,
                selection: TextSelection.collapsed(offset: searchText.length),
              );
            },
            buildWhen: (previous, current) =>
                previous.searchKey != current.searchKey ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return Form(
                child: TextFormField(
                  key: const Key('customerCodeSearchField'),
                  autocorrect: false,
                  controller: _searchController,
                  enabled: !state.isFetching,
                  onChanged: (value) {
                    customerCodeBloc
                        .add(CustomerCodeEvent.updateSearchKey(value));
                    //   if (_debounce?.isActive ?? false) _debounce?.cancel();
                    //   _debounce = Timer(const Duration(seconds: 3), () {
                    //     customerCodeBloc.add(
                    //       CustomerCodeEvent.fetch(
                    //         userInfo: userBloc.state.user,
                    //         selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                    //         isRefresh: true,
                    //         hidecustomer: salesOrgBloc.state.configs.hideCustomer,
                    //       ),
                    //     );
                    //   });
                  },
                  onFieldSubmitted: (value) {
                    if (state.searchKey.isValid()) {
                      customerCodeBloc.add(
                        CustomerCodeEvent.search(
                          userInfo: userBloc.state.user,
                          selectedSalesOrg:
                              salesOrgBloc.state.salesOrganisation,
                          hidecustomer: salesOrgBloc.state.hideCustomer,
                        ),
                      );
                    } else {
                      showSnackBar(
                        context: context,
                        message:
                            'Search input must be greater than 2 characters.'
                                .tr(),
                      );
                    }
                  },
                  // validator: (_) => customerCodeBloc.state.searchKey.value.fold(
                  //   (f) => f.maybeMap(
                  //     subceedLength: (f) =>
                  //         'Search input must be greater than 4 characters.'
                  //             .tr(),
                  //     orElse: () => null,
                  //   ),
                  //   (_) => null,
                  // ),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ZPColors.primary),
                    ),
                    isDense: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      key: const Key('clearCustomerCodeSearch'),
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        if (_searchController.text.isNotEmpty) {
                          customerCodeBloc.add(
                            CustomerCodeEvent.fetch(
                              userInfo: userBloc.state.user,
                              selectedSalesOrg:
                                  salesOrgBloc.state.salesOrganisation,
                              isRefresh: true,
                              hidecustomer: salesOrgBloc.state.hideCustomer,
                            ),
                          );
                        }
                      },
                    ),
                    hintText: 'Search...'.tr(),
                    border: InputBorder.none,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Column(
            children: [
              _HeaderMessage(
                state: state,
              ),
              _BodyContent(
                state: state,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }
}

class _HeaderMessage extends StatelessWidget {
  final CustomerCodeState state;
  const _HeaderMessage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !state.isFetching && state.customerCodeList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Please select a Customer Code').tr(),
          )
        : const SizedBox.shrink();
  }
}

class _BodyContent extends StatelessWidget {
  final CustomerCodeState state;
  const _BodyContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgBloc = context.read<SalesOrgBloc>();
    final userBloc = context.read<UserBloc>();

    return Expanded(
      child: ScrollList<CustomerCodeInfo>(
        key: const Key('customerCodeSelect'),
        onRefresh: () {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(
                  userInfo: userBloc.state.user,
                  selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                  isRefresh: true,
                  hidecustomer: false,
                ),
              );
        },
        onLoadingMore: () {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.loadMore(
                  userInfo: userBloc.state.user,
                  selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                  hidecustomer: false,
                ),
              );
        },
        isLoading: state.isFetching,
        itemBuilder: (_, __, item) => _ListContent(customerCodeInfo: item),
        items: state.customerCodeList,
        emptyMessage: 'No Customer Code Found',
      ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;
  const _ListContent({Key? key, required this.customerCodeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerBloc = context.read<CustomerCodeBloc>();
    final cartBloc = context.read<CartBloc>();

    return Column(
      children: [
        ListTile(
          key: Key(
            'customerCodeOption${customerCodeInfo.customerCodeSoldTo}',
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerCodeInfo.customerCodeSoldTo,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                customerCodeInfo.customerName.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RichText(
                text: TextSpan(
                  text: customerCodeInfo.customerAddress.toString(),
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.lightGray,
                      ),
                  children: [
                    TextSpan(
                      text: customerCodeInfo.postalCode,
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            if (customerCodeInfo != customerBloc.state.customerCodeInfo &&
                cartBloc.state.cartItemList.isNotEmpty) {
              ConfirmClearDialog.show(
                context: context,
                onCancel: () {
                  context.router.pop();
                },
                title: 'Change Customer Code'.tr(),
                description:
                    'The progress on your cart is going to be lost. Do you want to proceed?'
                        .tr(),
                onConfirmed: () {
                  context.read<CartBloc>().add(const CartEvent.clearCart());
                  context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
                  context.read<CustomerCodeBloc>().add(
                        CustomerCodeEvent.selected(
                          customerCodeInfo: customerCodeInfo,
                        ),
                      );
                },
              );
            } else {
              context.router
                  .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
              customerBloc.add(
                CustomerCodeEvent.selected(
                  customerCodeInfo: customerCodeInfo,
                ),
              );
            }
          },
        ),
        const Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
