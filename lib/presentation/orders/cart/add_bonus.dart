import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';

class BonusAddPage extends StatefulWidget {
  final PriceAggregate cartItem;

  @override
  State<BonusAddPage> createState() => _BonusAddPageState();

  const BonusAddPage({Key? key, required this.cartItem}) : super(key: key);
}

class _BonusAddPageState extends State<BonusAddPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    final searchText = context.read<BonusMaterialBloc>().state.searchKey;
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
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomAppBar(
          child: BlocConsumer<BonusMaterialBloc, BonusMaterialState>(
            listenWhen: (previous, current) =>
                previous.searchKey != current.searchKey ||
                previous.isFetching != current.isFetching,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {
                  final searchText = state.searchKey.getValue();
                  _searchController.value = TextEditingValue(
                    text: searchText,
                    selection:
                        TextSelection.collapsed(offset: searchText.length),
                  );
                },
                (either) => either.fold(
                  (failure) {
                    final failureMessage = failure.failureMessage;
                    showSnackBar(
                      context: context,
                      message: failureMessage.tr(),
                    );

                    if (failureMessage == 'authentication failed') {
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    }
                  },
                  (value) {
                    final failureMessage = value.failureMessage;
                    showSnackBar(
                      context: context,
                      message: failureMessage.tr(),
                    );
                  },
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.searchKey != current.searchKey ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return Form(
                child: TextFormField(
                  controller: _searchController,
                  autocorrect: false,
                  enabled: !state.isFetching,
                  onChanged: (value) {
                    context.read<BonusMaterialBloc>().add(
                          BonusMaterialEvent.updateSearchKey(
                            searchKey: value,
                          ),
                        );
                  },
                  onFieldSubmitted: (value) {
                    if (state.searchKey.isValid()) {
                      context.read<BonusMaterialBloc>().add(
                            BonusMaterialEvent.fetch(
                              user: context.read<UserBloc>().state.user,
                              salesOrganisation: context
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
                              configs:
                                  context.read<SalesOrgBloc>().state.configs,
                              pickAndPack: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .getPNPValueMaterial,
                              customerInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .customerCodeInfo,
                              shipInfo: context
                                  .read<ShipToCodeBloc>()
                                  .state
                                  .shipToInfo,
                              searchKey: value,
                            ),
                          );
                    } else {
                      showSnackBar(
                        context: context,
                        message:
                            'Search input must be greater than 4 characters.'
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
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        context.read<BonusMaterialBloc>().add(
                              const BonusMaterialEvent.reset(),
                            );
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: BlocConsumer<BonusMaterialBloc, BonusMaterialState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.isStarting != current.isStarting,
        listenWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.isStarting != current.isStarting,
        listener: (context, state) {},
        builder: (context, state) {
          return state.isStarting
              ? Container()
              : state.isFetching
                  ? LoadingShimmer.withChild(
                      child: Image.asset(
                        'assets/images/ezrxlogo.png',
                        key: const Key('loaderImage'),
                        width: 80,
                        height: 80,
                      ),
                    )
                  : ScrollList<MaterialInfo>(
                      onLoadingMore: () {},
                      emptyMessage: 'No materials found.'.tr(),
                      onRefresh: () {
                        context.read<BonusMaterialBloc>().add(
                              const BonusMaterialEvent.reset(),
                            );
                      },
                      isLoading: state.isFetching,
                      itemBuilder: (context, i, item) => Card(
                        elevation: 1.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 6.0,
                        ),
                        child: Padding(
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
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 5,
                                            child: RichText(
                                              overflow: TextOverflow.visible,
                                              text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: state.bonus[i]
                                                        .materialDescription
                                                        .toUpperCase(),
                                                    style: const TextStyle(
                                                      color:
                                                          ZPColors.darkerGreen,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Mat No: '
                                                '${state.bonus[i].materialNumber.displayMatNo}'
                                            .tr(),
                                        style: const TextStyle(
                                          color: ZPColors.darkGray,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 5.0,
                                        ),
                                        child: Text(
                                          state.bonus[i].principalData
                                              .principalName,
                                          style: const TextStyle(
                                            color: ZPColors.darkGray,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
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
                      ),
                      items: state.bonus,
                    );
        },
      ),
    );
  }
}
