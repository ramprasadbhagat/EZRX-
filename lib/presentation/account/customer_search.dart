import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';

import 'package:ezrxmobile/presentation/account/change_delivery_address.dart';

import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/search_bar.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

class CustomerSearchPage extends StatelessWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.customerSearchPage,
      appBar: AppBar(
        title: Text(
          'Select delivery address'.tr(),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          const _DeliveryAddressSearchSection(),
          BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _BodyContent(
                state: state,
              );
            },
          ),
        ],
      ),
    );
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
        controller: ScrollController(),
        key: WidgetKeys.customerCodeSelect,
        onRefresh: () {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetch(
                  userInfo: userBloc.state.user,
                  selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                  hidecustomer: false,
                ),
              );
        },
        onLoadingMore: () {
          context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.loadMore(
                  userInfo: userBloc.state.user,
                  selectedSalesOrg: salesOrgBloc.state.salesOrganisation,
                  hidecustomer: salesOrgBloc.state.configs.hideCustomer,
                ),
              );
        },
        isLoading: state.isFetching,
        itemBuilder: (_, __, item) =>
            _DeliveryAddressItem(customerCodeInfo: item),
        items: state.customerCodeList,
        emptyMessage: 'No delivery address found'.tr(),
      ),
    );
  }
}

class _DeliveryAddressItem extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;

  const _DeliveryAddressItem({Key? key, required this.customerCodeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      initiallyExpanded: true,
      trailingWidgetPadding: 20,
      iconColor: ZPColors.textButtonColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: _TitleSection(
          prefixText: customerCodeInfo.customerCodeSoldTo,
          suffixText: customerCodeInfo.customerName.name1,
          titleColor: ZPColors.textButtonColor,
        ),
      ),
      children: [
        Column(
          children: customerCodeInfo.shipToInfos
              .map(
                (e) => _ShipToAddressSection(
                  shipToInfo: e,
                  customerCodeInfo: customerCodeInfo,
                ),
              )
              .toList(),
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: ZPColors.extraLightGrey2,
        ),
      ],
    );
  }
}

class _ShipToAddressSection extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;
  const _ShipToAddressSection({
    Key? key,
    required this.shipToInfo,
    required this.customerCodeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minLeadingWidth: 0,
          horizontalTitleGap: 9,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          minVerticalPadding: 16,
          leading: Column(
            children: const [
              Icon(
                Icons.location_on_sharp,
                color: ZPColors.darkYellow,
              ),
            ],
          ),
          title: _TitleSection(
            prefixText: shipToInfo.shipToCustomerCode,
            suffixText: shipToInfo.shipToName.name1,
            titleColor: ZPColors.neutralsBlack,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              shipToInfo.deliveryAddress.toLowerCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
          ),
          onTap: () => _onShipToCodeChange(context),
        ),
        _isDividerVisible
            ? const Divider(
                indent: 20,
                endIndent: 20,
                color: ZPColors.extraLightGrey3,
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  void _onShipToCodeChange(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    final customerBloc = context.read<CustomerCodeBloc>();
    final shipToBloc = context.read<ShipToCodeBloc>();
    if (shipToInfo != shipToBloc.state.shipToInfo &&
        cartBloc.state.cartItems.isNotEmpty) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        builder: (_) {
          return ChangeDeliveryAddress(
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          );
        },
      );
    } else {
      context.router.popUntilRouteWithName(HomeNavigationTabbarRoute.name);
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
      customerBloc.add(
        CustomerCodeEvent.selected(
          customerCodeInfo: customerCodeInfo,
        ),
      );
      trackMixpanelEvent(MixpanelEvents.customerCodeSave, props: {
        MixpanelProps.customerCode: customerCodeInfo.customerCodeSoldTo,
      });
    }
  }

  bool get _isDividerVisible =>
      customerCodeInfo.shipToInfos.indexOf(shipToInfo) !=
      customerCodeInfo.shipToInfos.length - 1;
}

class _TitleSection extends StatelessWidget {
  final String prefixText;
  final String suffixText;
  final Color titleColor;
  const _TitleSection({
    Key? key,
    required this.prefixText,
    required this.suffixText,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$prefixText | ',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: titleColor,
            ),
        children: <TextSpan>[
          TextSpan(
            text: suffixText,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: titleColor,
                ),
          ),
        ],
      ),
    );
  }
}

class _DeliveryAddressSearchSection extends StatefulWidget {
  const _DeliveryAddressSearchSection({Key? key}) : super(key: key);

  @override
  State<_DeliveryAddressSearchSection> createState() =>
      _DeliveryAddressSearchSectionState();
}

class _DeliveryAddressSearchSectionState
    extends State<_DeliveryAddressSearchSection> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.value = TextEditingValue(
      text: context.read<CustomerCodeBloc>().state.searchKey.getOrDefaultValue(''),
      selection: TextSelection.collapsed(
        offset: _searchController.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          final searchText = state.searchKey.getValue();
          _searchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(
              offset: _searchController.selection.base.offset,
            ),
          );
        },
        builder: (context, state) {
          return SearchBar(
            key: WidgetKeys.customerCodeSearch,
            controller: _searchController,
            enabled: !state.isFetching,
            onSearchChanged: (value) {
              context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.autoSearch(
                  userInfo: context.read<UserBloc>().state.user,
                  selectedSalesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
                  hidecustomer: context.read<SalesOrgBloc>().state.hideCustomer,
                  searchValue: value,
                ),
              );
            },
            onSearchSubmitted: (value) {
              context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.autoSearch(
                  userInfo: context.read<UserBloc>().state.user,
                  selectedSalesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
                  hidecustomer: context.read<SalesOrgBloc>().state.hideCustomer,
                  searchValue: value,
                ),
              );
            },
            clearIconKey: WidgetKeys.clearIconKey,
            customValidator: () =>
                SearchKey.search(_searchController.text).isValid(),
            onClear: () {
              if (_searchController.text.isEmpty) return;
              _searchController.clear();
              context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.deletedSearch(
                  userInfo: context.read<UserBloc>().state.user,
                  selectedSalesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
                  hidecustomer: context.read<SalesOrgBloc>().state.hideCustomer,
                ),
              );
            },
            border: InputBorder.none,
          );
        },
      ),
    );
  }
}
