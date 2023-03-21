import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_principle_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_checkout.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_header_message.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealPrincipleDetailPage extends StatelessWidget
    implements AutoRouteWrapper {
  final PriceComboDeal comboDeal;
  const ComboDealPrincipleDetailPage({
    Key? key,
    required this.comboDeal,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    return BlocProvider(
      create: (context) => locator<ComboDealPrincipleDetailBloc>()
        ..add(
          ComboDealPrincipleDetailEvent.fetch(
            user: eligibilityBloc.state.user,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            salesConfigs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            principles: comboDeal.category.values,
          ),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ComboDealPrincipleDetailBloc,
            ComboDealPrincipleDetailState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.isFetching != current.isFetching,
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
          },
        ),
        BlocListener<ComboDealPrincipleDetailBloc,
            ComboDealPrincipleDetailState>(
          listenWhen: (previous, current) =>
              previous.items.length != current.items.length,
          listener: (context, state) {
            final eligibilityBloc = context.read<EligibilityBloc>();

            context.read<MaterialPriceDetailBloc>().add(
                  MaterialPriceDetailEvent.comboDealFetch(
                    user: eligibilityBloc.state.user,
                    customerCode: eligibilityBloc.state.customerCodeInfo,
                    salesOrganisation: eligibilityBloc.state.salesOrganisation,
                    salesOrganisationConfigs:
                        eligibilityBloc.state.salesOrgConfigs,
                    shipToCode: eligibilityBloc.state.shipToInfo,
                    materialInfoList: state.items.keys.toList(),
                  ),
                );
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchPrincipleGroupDeal(
                    customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                    salesOrganisation: eligibilityBloc.state.salesOrganisation,
                    comboDeals: comboDeal,
                  ),
                );
          },
        ),
        BlocListener<MaterialPriceDetailBloc, MaterialPriceDetailState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            context.read<ComboDealPrincipleDetailBloc>().add(
                  ComboDealPrincipleDetailEvent.setPriceInfo(
                    priceMap: state.comboDealMaterialDetails,
                    comboDeal: comboDeal,
                  ),
                );
          },
        ),
        BlocListener<ComboDealListBloc, ComboDealListState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            context.read<ComboDealPrincipleDetailBloc>().add(
                  ComboDealPrincipleDetailEvent.setComboDealInfo(
                    comboDealInfo: state.getComboDeal(
                      comboDealId: comboDeal.id,
                    ),
                  ),
                );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Combo Bundle Details').tr(),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ComboDealPrincipleDetailBloc,
                  ComboDealPrincipleDetailState>(
                builder: (context, state) {
                  if (state.isFetching) {
                    return LoadingShimmer.logo(
                      key: const Key('loaderImage'),
                    );
                  }

                  return Column(
                    children: [
                      ComboDealHeaderMessage(comboDeal: state.currentDeal),
                      Expanded(
                        child: ScrollList<PriceAggregate>(
                          emptyMessage: 'Combo bundle is empty'.tr(),
                          isLoading: state.isFetchingMaterials,
                          itemBuilder: (context, index, item) {
                            final isSelected =
                                state.selectedItems[item.getMaterialNumber] ??
                                    false;

                            return Card(
                              child: ComboDealItem(
                                material: item,
                                isSelected: isSelected,
                                onCheckBoxPressed: () => context
                                    .read<ComboDealPrincipleDetailBloc>()
                                    .add(
                                      ComboDealPrincipleDetailEvent
                                          .updateItemSelection(
                                        item: item.getMaterialNumber,
                                      ),
                                    ),
                                onQuantityUpdated: (qty) => context
                                    .read<ComboDealPrincipleDetailBloc>()
                                    .add(
                                      ComboDealPrincipleDetailEvent
                                          .updateItemQuantity(
                                        item: item.getMaterialNumber,
                                        qty: qty,
                                      ),
                                    ),
                              ),
                            );
                          },
                          items: state.items.values.toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            BlocBuilder<ComboDealPrincipleDetailBloc,
                ComboDealPrincipleDetailState>(
              builder: (context, state) => ComboDealCheckout(
                isEdit: false,
                rateEnabled: state.isEnableAddToCart,
                currentDeal: state.currentDeal,
                selectedItems: state.allSelectedItems,
                onCheckoutPressed: () {
                  _onAddToCartPressed(
                    context: context,
                    selectedItems: state.allSelectedItems,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAddToCartPressed({
    required BuildContext context,
    required List<PriceAggregate> selectedItems,
  }) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    context.read<CartBloc>().add(
          CartEvent.addComboDealToCart(
            comboDealItems: selectedItems,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            salesOrganisationConfigs: eligibilityBloc.state.salesOrgConfigs,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            doNotallowOutOfStockMaterial:
                eligibilityBloc.state.doNotAllowOutOfStockMaterials,
            overrideQty: true,
          ),
        );
    //TODO: Implement edit route

    // if (widget.isEdit) {
    //   context.router.pop();
    // } else {
    context.router.popAndPush(const CartPageRoute());
    // }
  }
}
