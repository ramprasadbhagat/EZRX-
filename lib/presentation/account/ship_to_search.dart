import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShiptToSearchPage extends StatefulWidget {
  const ShiptToSearchPage({Key? key}) : super(key: key);

  @override
  State<ShiptToSearchPage> createState() => _ShiptToSearchPage();
}

class _ShiptToSearchPage extends State<ShiptToSearchPage> {
  late TextEditingController _searchController;

  // Timer? _debounce;
  @override
  void initState() {
    _searchController = TextEditingController();
    final searchText = context.read<ShipToCodeBloc>().state.searchKey;
    if (searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrCrash(),
        selection: TextSelection.collapsed(
          offset: searchText.getOrCrash().length,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('shipToSearchPage'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          searchController: _searchController,
        ),
      ),
      body: BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
        buildWhen: (previous, current) =>
            previous.shipToInfoList != current.shipToInfoList,
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

class AppBar extends StatelessWidget {
  final TextEditingController searchController;

  const AppBar({Key? key, required this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      child: BlocConsumer<ShipToCodeBloc, ShipToCodeState>(
        listenWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          final searchText = state.searchKey.getValue();
          searchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(offset: searchText.length),
          );
        },
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return Form(
            child: TextFormField(
              key: const Key('shipToCodeSearchField'),
              controller: searchController,
              enabled: !state.isSearching,
              onChanged: (value) {
                context
                    .read<ShipToCodeBloc>()
                    .add(ShipToCodeEvent.updateSearchKey(value));
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
                  context.read<ShipToCodeBloc>().add(
                        ShipToCodeEvent.search(
                          shipToInfos: context
                              .read<CustomerCodeBloc>()
                              .state
                              .shipToInfos,
                        ),
                      );
                } else {
                  showSnackBar(
                    context: context,
                    message:
                        'Search input must be greater than 4 characters.'.tr(),
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
                  key: const Key('clearShipToSearch'),
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<ShipToCodeBloc>().add(ShipToCodeEvent.load(
                          shipToInfos: context
                              .read<CustomerCodeBloc>()
                              .state
                              .shipToInfos,
                        ));
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  final ShipToCodeState state;
  const _HeaderMessage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !state.isSearching && state.shipToInfoList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Please select a shipping address').tr(),
          )
        : const SizedBox.shrink();
  }
}

class _BodyContent extends StatelessWidget {
  final ShipToCodeState state;
  const _BodyContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<ShipToInfo>(
        key: const Key('shipToCodeSelect'),
        onRefresh: () {},
        onLoadingMore: () {},
        isLoading: state.isSearching,
        itemBuilder: (_, __, item) => _ListContent(shipToInfo: item),
        items: state.shipToInfoList,
        emptyMessage: 'No Shipping Address Found',
      ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final ShipToInfo shipToInfo;
  const _ListContent({Key? key, required this.shipToInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shipToBloc = context.read<ShipToCodeBloc>();
    final cartBloc = context.read<CartBloc>();
    
    return Column(
      children: [
        ListTile(
          key: Key(
            'shipToOption${shipToInfo.shipToCustomerCode}',
          ),
          trailing: shipToInfo.defaultShipToAddress
              ? const CustomLabel(textValue: 'Default')
              : const SizedBox.shrink(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shipToInfo.shipToCustomerCode,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                shipToInfo.shipToName.toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              RichText(
                text: TextSpan(
                  text: shipToInfo.shipToAddress.toString(),
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.lightGray,
                      ),
                  children: [
                    TextSpan(
                      text: shipToInfo.postalCode,
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            if (shipToInfo != shipToBloc.state.shipToInfo &&
                cartBloc.state.cartItemList.isNotEmpty) {
              ConfirmClearDialog.show(
                context: context,
                title: 'Change Shipping Address'.tr(),
                description:
                    'The progress on your cart is going to be lost. Do you want to proceed?'
                        .tr(),
                onCancel: () {
                  context.router.pop();
                },
                onConfirmed: () {
                  cartBloc.add(const CartEvent.clearCart());
                  context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
                  shipToBloc.add(
                        ShipToCodeEvent.selected(
                          shipToInfo: shipToInfo,
                        ),
                      );
                },
              );
            } else {
              context.router
                  .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
              context.read<ShipToCodeBloc>().add(
                    ShipToCodeEvent.selected(
                      shipToInfo: shipToInfo,
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
