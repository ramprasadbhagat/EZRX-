import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_principle_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
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
  final List<PriceAggregate> initialComboItems;

  const ComboDealPrincipleDetailPage({
    Key? key,
    required this.comboDeal,
    this.initialComboItems = const [],
  }) : super(key: key);

  bool get isEdit => initialComboItems.isNotEmpty;

  @override
  Widget wrappedRoute(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    return BlocProvider(
      create: (context) => locator<ComboDealPrincipleDetailBloc>()
        ..add(
          ComboDealPrincipleDetailEvent.initFromCart(
            items: initialComboItems,
          ),
        )
        ..add(
          ComboDealPrincipleDetailEvent.fetch(
            user: eligibilityBloc.state.user,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            salesConfigs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            principles: comboDeal.category.values,
            fetchFromCart: isEdit,
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
              previous.isFetchingMaterials != current.isFetchingMaterials &&
              !current.isFetchingMaterials,
          listener: (context, state) {
            final eligibilityBloc = context.read<EligibilityBloc>();

            isEdit
                ? context.read<ComboDealPrincipleDetailBloc>().add(
                      ComboDealPrincipleDetailEvent.setComboDealInfo(
                        comboDealInfo: initialComboItems.firstComboDeal,
                      ),
                    )
                : context.read<ComboDealListBloc>().add(
                      ComboDealListEvent.fetchPrincipleGroupDeal(
                        customerCodeInfo:
                            eligibilityBloc.state.customerCodeInfo,
                        salesOrganisation:
                            eligibilityBloc.state.salesOrganisation,
                        comboDeals: comboDeal,
                      ),
                    );

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
            const AnnouncementWidget(
              appModule: AppModule.orders,
            ),
            Expanded(
              child: BlocBuilder<ComboDealPrincipleDetailBloc,
                  ComboDealPrincipleDetailState>(
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  if (state.isFetching && state.items.isEmpty) {
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
                          onLoadingMore: () {
                            final eligibilityBloc =
                                context.read<EligibilityBloc>();
                            context.read<ComboDealPrincipleDetailBloc>().add(
                                  ComboDealPrincipleDetailEvent.loadMore(
                                    user: eligibilityBloc.state.user,
                                    salesOrganisation:
                                        eligibilityBloc.state.salesOrganisation,
                                    salesConfigs:
                                        eligibilityBloc.state.salesOrgConfigs,
                                    customerCodeInfo:
                                        eligibilityBloc.state.customerCodeInfo,
                                    shipToInfo:
                                        eligibilityBloc.state.shipToInfo,
                                    principles: comboDeal.category.values,
                                  ),
                                );
                          },
                          isLoading: state.isFetching,
                          itemBuilder: (context, index, item) => BlocBuilder<
                              ComboDealPrincipleDetailBloc,
                              ComboDealPrincipleDetailState>(
                            builder: (context, state) {
                              final isSelected =
                                  state.selectedItems[item.getMaterialNumber] ??
                                      false;
                              final material =
                                  state.items[item.getMaterialNumber] ??
                                      PriceAggregate.empty();

                              return Card(
                                child: ComboDealItem(
                                  material: material,
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
                          ),
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
                isEdit: isEdit,
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

    if (isEdit) {
      context.router.pop();
    } else {
      context.router.popAndPush(const CartPageRoute());
    }
  }
}
