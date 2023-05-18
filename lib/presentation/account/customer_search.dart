import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSearchPage extends StatelessWidget {
  const CustomerSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('customerSearchPage'),
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: _AppBar(),
      ),
      body: BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
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
  late CustomerCodeBloc _customerCodeBloc;
  late SalesOrgBloc _salesOrgBloc;
  late UserBloc _userBloc;

  @override
  void initState() {
    _searchController = TextEditingController();
    _customerCodeBloc = context.read<CustomerCodeBloc>();
    final searchText = _customerCodeBloc.state.searchKey;
    if (_customerCodeBloc.state.isSearchActive && searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrDefaultValue(''),
        selection: TextSelection.collapsed(
          offset: _searchController.selection.base.offset,
        ),
      );
    }
    _salesOrgBloc = context.read<SalesOrgBloc>();
    _userBloc = context.read<UserBloc>();
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
      child: BlocListener<CustomerCodeBloc, CustomerCodeState>(
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
            selection: TextSelection.collapsed(
              offset: _searchController.selection.base.offset,
            ),
          );
        },
        child: SearchBar(
          key: const Key('customerCodeSearchField'),
          controller: _searchController,
          enabled: !_customerCodeBloc.state.isFetching,
          onSearchSubmitted: (value) {
            _customerCodeBloc.add(CustomerCodeEvent.updateSearchKey(value));
            _customerCodeBloc.add(
              CustomerCodeEvent.search(
                userInfo: _userBloc.state.user,
                selectedSalesOrg: _salesOrgBloc.state.salesOrganisation,
                hidecustomer: _salesOrgBloc.state.hideCustomer,
              ),
            );
          },
          suffixIconKey: const Key('clearCustomerCodeSearch'),
          customValidator: () =>
              SearchKey.search(_searchController.text).isValid(),
          onClear: () {
            if (_searchController.text.isNotEmpty) {
              _customerCodeBloc.add(
                CustomerCodeEvent.fetch(
                  userInfo: _userBloc.state.user,
                  selectedSalesOrg: _salesOrgBloc.state.salesOrganisation,
                  hidecustomer: _salesOrgBloc.state.hideCustomer,
                ),
              );
            }
          },
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  final CustomerCodeState state;

  const _HeaderMessage({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !state.isFetching && state.customerCodeList.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Please select a customer code'.tr(),
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
        itemBuilder: (_, __, item) => _ListContent(customerCodeInfo: item),
        items: state.customerCodeList,
        emptyMessage: 'No Customer Code Found'.tr(),
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
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.kPrimaryColor,
                    ),
              ),
              Text(
                customerCodeInfo.customerName.toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              RichText(
                text: TextSpan(
                  text: customerCodeInfo.customerAddress.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.apply(
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
            if (context.router.stack.last.name ==
                AdminPoAttachmentPageRoute.name) {
              context.router.pop();
              context.read<AdminPoAttachmentFilterBloc>().add(
                    AdminPoAttachmentFilterEvent.soldToChanged(
                      customerCodeInfo,
                    ),
                  );

              return;
            }
            if (customerCodeInfo != customerBloc.state.customerCodeInfo &&
                cartBloc.state.cartItems.isNotEmpty) {
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
                  context.router
                      .popUntilRouteWithName(HomeNavigationTabbarRoute.name);
                  context.read<CustomerCodeBloc>().add(
                        CustomerCodeEvent.selected(
                          customerCodeInfo: customerCodeInfo,
                        ),
                      );
                  trackMixpanelEvent(MixpanelEvents.customerCodeSave, props: {
                    MixpanelProps.customerCode:
                        customerCodeInfo.customerCodeSoldTo,
                  });
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
              trackMixpanelEvent(MixpanelEvents.customerCodeSave, props: {
                MixpanelProps.customerCode: customerCodeInfo.customerCodeSoldTo,
              });
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
