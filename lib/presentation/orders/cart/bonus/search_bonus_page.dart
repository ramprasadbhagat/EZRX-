import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class BonusAddPage extends StatelessWidget {
  final CartItem cartItem;

  const BonusAddPage({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.addBonus,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: _AppBar(),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.isStarting != current.isStarting,
          builder: (context, state) {
            return state.isStarting
                ? const SizedBox.shrink(
                    key: WidgetKeys.addBonusEmpty,
                  )
                : state.isFetching
                    ? LoadingShimmer.logo(key: const Key('loaderImage'))
                    : _BonusScrollList(state: state, cartItem: cartItem);
          },
        ),
      ),
    );
  }
}

class _BonusScrollList extends StatelessWidget {
  const _BonusScrollList({
    Key? key,
    required this.state,
    required this.cartItem,
  }) : super(key: key);

  final BonusMaterialState state;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ScrollList<MaterialInfo>(
      noRecordFoundWidget: const NoRecordFound(title: 'No materials found'),
      controller: ScrollController(),
      isLoading: state.isFetching,
      itemBuilder: (_, __, item) => _BonusItem(item: item, cartItem: cartItem),
      items: state.bonus,
    );
  }
}

class _BonusItem extends StatelessWidget {
  const _BonusItem({
    Key? key,
    required this.item,
    required this.cartItem,
  }) : super(key: key);

  final MaterialInfo item;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        key: const Key('bonusItemList'),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.materialNumber.displayMatNo.tr(),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.kPrimaryColor,
                          ),
                    ),
                    Text(
                      item.materialDescription,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      item.principalData.principalName.getOrDefaultValue(''),
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                key: Key(
                  'addItem${item.materialNumber.getOrDefaultValue('')}',
                ),
                onTap: () {
                  CartBottomSheet.showUpdateCartBonusBottomSheet(
                    context: context,
                    cartItem: cartItem,
                    item: item,
                    isUpdateFromCart: false,
                  );
                },
                child: Container(
                  width: 50.0,
                  height: 23.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    gradient: const LinearGradient(
                      colors: [
                        ZPColors.kPrimaryColor,
                        ZPColors.gradient,
                      ],
                    ),
                  ),
                  child: Text(
                    'ADD'.tr(),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
  final TextEditingController _searchController = TextEditingController();
  late BonusMaterialBloc bonusMaterialBloc;

  @override
  void initState() {
    bonusMaterialBloc = context.read<BonusMaterialBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    bonusMaterialBloc.add(const BonusMaterialEvent.initialized());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      child: BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          _searchController.text = state.searchKey.getOrDefaultValue('');

          return SearchBar(
            key: WidgetKeys.addBonusTextField(
              state.searchKey.getOrDefaultValue(''),
            ),
            controller: _searchController,
            enabled: !state.isFetching,
            customValidator: () =>
                SearchKey.search(_searchController.text).isValid(),
            onSearchChanged: (value) {
              bonusMaterialBloc.add(
                BonusMaterialEvent.autoSearch(
                  user: context.read<UserBloc>().state.user,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  configs: context.read<SalesOrgBloc>().state.configs,
                  pickAndPack:
                      context.read<EligibilityBloc>().state.getPNPValueMaterial,
                  customerInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  searchKey: value,
                ),
              );
            },
            onSearchSubmitted: (value) {
              bonusMaterialBloc.add(
                BonusMaterialEvent.fetch(
                  user: context.read<UserBloc>().state.user,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  configs: context.read<SalesOrgBloc>().state.configs,
                  pickAndPack:
                      context.read<EligibilityBloc>().state.getPNPValueMaterial,
                  customerInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  searchKey: value,
                ),
              );
            },
            isDense: true,
            onClear: () {
              if (_searchController.text.isEmpty) return;
              _searchController.clear();
              bonusMaterialBloc.add(
                const BonusMaterialEvent.initialized(),
              );
            },
            clearIconKey: WidgetKeys.addBonusTextFieldClear,
            border: InputBorder.none,
          );
        },
      ),
    );
  }
}
