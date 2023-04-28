import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_checkout.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_header_message.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealMaterialDetailPage extends StatefulWidget
    implements AutoRouteWrapper {
  final List<PriceAggregate> comboItems;
  final bool isEdit;
  const ComboDealMaterialDetailPage({
    Key? key,
    required this.comboItems,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<ComboDealMaterialDetailPage> createState() =>
      _ComboDealMaterialDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ComboDealMaterialDetailBloc(),
      child: this,
    );
  }
}

class _ComboDealMaterialDetailPageState
    extends State<ComboDealMaterialDetailPage> {
  late final EligibilityBloc eligibilityBloc;
  late final PriceComboDeal priceComboDeal;

  @override
  void initState() {
    super.initState();
    eligibilityBloc = context.read<EligibilityBloc>();
    priceComboDeal = widget.comboItems.isEmpty
        ? PriceComboDeal.empty()
        : widget.comboItems.first.price.comboDeal;

    widget.isEdit
        ? context.read<ComboDealMaterialDetailBloc>().add(
              ComboDealMaterialDetailEvent.initFromCartComboDealItems(
                salesConfigs: eligibilityBloc.state.salesOrgConfigs,
                items: widget.comboItems,
              ),
            )
        : context.read<ComboDealMaterialDetailBloc>().add(
              ComboDealMaterialDetailEvent.initComboDealItems(
                salesConfigs: eligibilityBloc.state.salesOrgConfigs,
                items: widget.comboItems,
              ),
            );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MaterialPriceDetailBloc>().add(
            MaterialPriceDetailEvent.comboDealFetch(
              user: eligibilityBloc.state.user,
              customerCode: eligibilityBloc.state.customerCodeInfo,
              salesOrganisation: eligibilityBloc.state.salesOrganisation,
              salesOrganisationConfigs: eligibilityBloc.state.salesOrgConfigs,
              shipToCode: eligibilityBloc.state.shipToInfo,
              materialInfoList: priceComboDeal.category.values
                  .map((value) => MaterialNumber(value))
                  .toList(),
            ),
          );
      if (!widget.isEdit) {
        context.read<ComboDealListBloc>().add(
              ComboDealListEvent.fetchMaterialDeal(
                customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                salesOrganisation: eligibilityBloc.state.salesOrganisation,
                comboDeals: priceComboDeal,
              ),
            );
      }
    });
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: 'ComboDealDetailPage',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('ComboDealDetailPage'),
      appBar: AppBar(
        title: const Text('Combo Bundle Details').tr(),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MaterialPriceDetailBloc, MaterialPriceDetailState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            listener: (context, state) {
              if (!state.isFetching) {
                context.read<ComboDealMaterialDetailBloc>().add(
                      ComboDealMaterialDetailEvent.setPriceInfo(
                        priceMap: state.comboDealMaterialDetails,
                        comboDeal: priceComboDeal,
                      ),
                    );
              }
            },
          ),
          BlocListener<ComboDealListBloc, ComboDealListState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            listener: (context, state) {
              if (!state.isFetching) {
                context.read<ComboDealMaterialDetailBloc>().add(
                      ComboDealMaterialDetailEvent.setComboDealInfo(
                        comboDealInfo: state.getComboDeal(
                          comboDealId: priceComboDeal.id,
                        ),
                      ),
                    );
              }
            },
          ),
        ],
        child: Column(
          children: [
            AnnouncementWidget(
              currentPath: context.router.currentPath,
            ),
            Expanded(
              child: BlocBuilder<ComboDealMaterialDetailBloc,
                  ComboDealMaterialDetailState>(
                builder: (context, state) {
                  if (state.isFetchingComboInfo || state.isFetchingPrice) {
                    return LoadingShimmer.logo(
                      key: const Key('loaderImage'),
                    );
                  }
                  final comboDeal = state.currentDeal;
                  final isK21Scheme = comboDeal.scheme == ComboDealScheme.k2 &&
                      comboDeal.groupDeal != ComboDealGroupDeal.empty();

                  return isK21Scheme
                      ? _K21ComboDealList(
                          state: state,
                        )
                      : Column(
                          children: [
                            ComboDealHeaderMessage(comboDeal: comboDeal),
                            Expanded(
                              child: ScrollList<PriceAggregate>(
                                isLoading: false,
                                itemBuilder: (context, index, item) {
                                  final isSelected = state.selectedItems[
                                          item.getMaterialNumber] ??
                                      false;

                                  return Card(
                                    child: ComboDealItem(
                                      material: item,
                                      isSelected: isSelected,
                                      onCheckBoxPressed: () => context
                                          .read<ComboDealMaterialDetailBloc>()
                                          .add(
                                            ComboDealMaterialDetailEvent
                                                .updateItemSelection(
                                              item: item.getMaterialNumber,
                                            ),
                                          ),
                                      onQuantityUpdated: (qty) => context
                                          .read<ComboDealMaterialDetailBloc>()
                                          .add(
                                            ComboDealMaterialDetailEvent
                                                .updateItemQuantity(
                                              item: item.getMaterialNumber,
                                              qty: qty,
                                            ),
                                          ),
                                    ),
                                  );
                                },
                                emptyMessage: 'Combo bundle is empty'.tr(),
                                items: state.items.values.toList(),
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
            BlocBuilder<ComboDealMaterialDetailBloc,
                ComboDealMaterialDetailState>(
              builder: (context, state) => ComboDealCheckout(
                isEdit: widget.isEdit,
                rateEnabled: state.isEnableAddToCart,
                currentDeal: state.currentDeal,
                selectedItems: state.allSelectedItems,
                onCheckoutPressed: () => onAddToCartPressed(
                  context: context,
                  selectedItems: state.allSelectedItems,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAddToCartPressed({
    required BuildContext context,
    required List<PriceAggregate> selectedItems,
  }) {
    context.read<CartBloc>().add(
          CartEvent.addComboDealToCart(
            comboDealItems: selectedItems,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            salesOrganisationConfigs: eligibilityBloc.state.salesOrgConfigs,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            doNotallowOutOfStockMaterial:
                eligibilityBloc.state.doNotAllowOutOfStockMaterials,
            overrideQty: widget.isEdit,
          ),
        );

    if (widget.isEdit) {
      context.router.pop();
    } else {
      context.router.popAndPush(const CartPageRoute());
    }
  }
}

class _K21ComboDealList extends StatelessWidget {
  final ComboDealMaterialDetailState state;
  const _K21ComboDealList({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.items.isEmpty) {
      return NoRecordFound.showMessage(
        message: 'Combo bundle is empty'.tr(),
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        final itemSet = state.itemBySets[index];
        final setMinQty = itemSet.fold<int>(
          0,
          (sum, item) => item.selfComboDeal.minQty,
        );

        return Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'You must purchase a mandatory product with a minimum QTY [${setMinQty == 0 ? 1 : setMinQty}] + any other product set ${String.fromCharCode(65 + index)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: ZPColors.primary,
                  ),
                ),
              ),
              const _Divider(),
              ...List.generate(
                itemSet.length,
                (index) {
                  final material = itemSet[index];
                  final isSelected =
                      state.selectedItems[material.getMaterialNumber] ?? false;

                  return Column(
                    children: [
                      ComboDealItem(
                        material: material,
                        isSelected: isSelected,
                        onCheckBoxPressed: () => context
                            .read<ComboDealMaterialDetailBloc>()
                            .add(
                              ComboDealMaterialDetailEvent.updateItemSelection(
                                item: material.getMaterialNumber,
                              ),
                            ),
                        onQuantityUpdated: (qty) => context
                            .read<ComboDealMaterialDetailBloc>()
                            .add(
                              ComboDealMaterialDetailEvent.updateItemQuantity(
                                item: material.getMaterialNumber,
                                qty: qty,
                              ),
                            ),
                      ),
                      if (index != itemSet.length - 1) const _Divider(),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        );
      },
      itemCount: state.itemBySets.length,
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ColoredBox(
        color: ZPColors.lightGray,
        child: SizedBox(
          height: 2,
          width: double.infinity,
        ),
      ),
    );
  }
}
