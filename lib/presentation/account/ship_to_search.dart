import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class ShiptToSearchPage extends StatelessWidget {
  const ShiptToSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.shipToSearchPage,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: _AppBar(),
      ),
      body: BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
        buildWhen: (previous, current) =>
            previous.shipToInfoList != current.shipToInfoList,
        builder: (context, state) {
          return Column(
            children: [
              AnnouncementWidget(
                currentPath: context.router.currentPath,
              ),
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
}

class _AppBar extends StatefulWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  State<_AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<_AppBar> {
  late TextEditingController _searchController;
  late ShipToCodeBloc _shipToCodeBloc;

  // Timer? _debounce;
  @override
  void initState() {
    _searchController = TextEditingController();
    _shipToCodeBloc = context.read<ShipToCodeBloc>();

    final searchText = _shipToCodeBloc.state.searchKey;
    if (searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrCrash(),
        selection: TextSelection.collapsed(
          offset: _searchController.selection.base.offset,
        ),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      child: BlocListener<ShipToCodeBloc, ShipToCodeState>(
        listenWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          final searchText = state.searchKey.getValue();
          _searchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(
              offset: _searchController.selection.base.offset,
            ),
          );
        },
        child: SearchBar(
          key: WidgetKeys.shipToCodeSearchField,
          controller: _searchController,
          enabled: !_shipToCodeBloc.state.isSearching,
          onSearchSubmitted: (value) {
            context
                .read<ShipToCodeBloc>()
                .add(ShipToCodeEvent.updateSearchKey(value));
            context.read<ShipToCodeBloc>().add(
                  ShipToCodeEvent.search(
                    shipToInfos:
                        context.read<CustomerCodeBloc>().state.shipToInfos,
                  ),
                );
          },
          customValidator: () =>
              SearchKey.search(_searchController.text).isValid(),
          clearIconKey: WidgetKeys.clearShipToSearch,
          onClear: () {
            if (_searchController.text.isEmpty) return;
            _searchController.clear();
            context.read<ShipToCodeBloc>().add(ShipToCodeEvent.load(
                  shipToInfos:
                      context.read<CustomerCodeBloc>().state.shipToInfos,
                ));
          },
          onSearchChanged: (value) {
            context
                .read<ShipToCodeBloc>()
                .add(ShipToCodeEvent.updateSearchKey(value));
            context.read<ShipToCodeBloc>().add(
                  ShipToCodeEvent.search(
                    shipToInfos:
                        context.read<CustomerCodeBloc>().state.shipToInfos,
                  ),
                );
          },
          border: InputBorder.none,
        ),
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
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Please select a shipping address',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ZPColors.red),
            ).tr(),
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
        controller: ScrollController(),
        key: WidgetKeys.shipToCodeSelect,
        isLoading: state.isSearching,
        itemBuilder: (_, __, item) => _ListContent(shipToInfo: item),
        items: state.shipToInfoList,
        emptyMessage: 'No Shipping Address Found'.tr(),
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
          key: WidgetKeys.shipToAddressOption(shipToInfo.shipToCustomerCode),
          trailing: shipToInfo.defaultShipToAddress
              ? CustomLabel(textValue: 'Default'.tr())
              : const SizedBox.shrink(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shipToInfo.shipToCustomerCode,
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                shipToInfo.shipToName.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              RichText(
                text: TextSpan(
                  text: shipToInfo.shipToAddress.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.apply(
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
                cartBloc.state.cartItems.isNotEmpty) {
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
                  context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
                  shipToBloc.add(
                    ShipToCodeEvent.selected(
                      shipToInfo: shipToInfo,
                    ),
                  );
                  trackMixpanelEvent(
                    MixpanelEvents.shipToAddressSave,
                    props: {
                      MixpanelProps.shipToAddress:
                          shipToInfo.shipToCustomerCode,
                    },
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
              trackMixpanelEvent(
                MixpanelEvents.shipToAddressSave,
                props: {
                  MixpanelProps.shipToAddress: shipToInfo.shipToCustomerCode,
                },
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
