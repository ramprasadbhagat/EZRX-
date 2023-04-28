import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';

class BonusAddPage extends StatefulWidget {
  final CartItem cartItem;

  @override
  State<BonusAddPage> createState() => _BonusAddPageState();

  const BonusAddPage({Key? key, required this.cartItem}) : super(key: key);
}

class _BonusAddPageState extends State<BonusAddPage> {
  final TextEditingController _searchController = TextEditingController();
  late BonusMaterialBloc bonusMaterialBloc;

  @override
  void initState() {
    bonusMaterialBloc = context.read<BonusMaterialBloc>();
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: 'BonusAddPage',
      },
    );
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
    return Scaffold(
      key: const Key('addBonus'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomAppBar(
          child: BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
            buildWhen: (previous, current) =>
                previous.searchKey != current.searchKey ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              _searchController.text = state.searchKey.getOrDefaultValue('');

              return Form(
                child: TextFormField(
                  key: Key(
                    'addBonusTextField${state.searchKey.getOrDefaultValue('')}',
                  ),
                  controller: _searchController,
                  autocorrect: false,
                  enabled: !state.isFetching,
                  onFieldSubmitted: (value) {
                    if (value.length > 2) {
                      bonusMaterialBloc.add(
                        BonusMaterialEvent.fetch(
                          user: context.read<UserBloc>().state.user,
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                          configs: context.read<SalesOrgBloc>().state.configs,
                          pickAndPack: context
                              .read<EligibilityBloc>()
                              .state
                              .getPNPValueMaterial,
                          customerInfo: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          shipInfo:
                              context.read<ShipToCodeBloc>().state.shipToInfo,
                          searchKey: value,
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
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ZPColors.primary),
                    ),
                    isDense: true,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      key: const ValueKey('addBonusTextFieldClear'),
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        if (_searchController.text.isEmpty) return;
                        _searchController.clear();
                        bonusMaterialBloc.add(
                          const BonusMaterialEvent.reset(),
                        );
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
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<BonusMaterialBloc, BonusMaterialState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.isStarting != current.isStarting,
          builder: (context, state) {
            return state.isStarting
                ? Container(
                    key: const Key('empty'),
                  )
                : state.isFetching
                    ? LoadingShimmer.logo(key: const Key('loaderImage'))
                    : ScrollList<MaterialInfo>(
                        emptyMessage: 'No materials found'.tr(),
                        // onRefresh: () {
                        // context.read<BonusMaterialBloc>().add(
                        //       const BonusMaterialEvent.reset(),
                        //     );
                        // },
                        isLoading: state.isFetching,
                        itemBuilder: (context, i, item) => Card(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          state.bonus[i].materialNumber
                                              .displayMatNo,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.apply(
                                                color: ZPColors.kPrimaryColor,
                                              ),
                                        ),
                                        Text(
                                          state.bonus[i].materialDescription,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        Text(
                                          state.bonus[i].principalData
                                              .principalName
                                              .getOrDefaultValue(''),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.apply(
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
                                      'addItem${state.bonus[i].materialNumber.getOrDefaultValue('')}',
                                    ),
                                    onTap: () {
                                      CartBottomSheet
                                          .showUpdateCartBonusBottomSheet(
                                        context: context,
                                        cartItem: widget.cartItem,
                                        item: state.bonus[i],
                                        isUpdateFromCart: false,
                                      );
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 23.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
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
                        ),
                        items: state.bonus,
                      );
          },
        ),
      ),
    );
  }
}
