import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_detail_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/widgets/combo_deal_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComboDealDetailPage extends StatefulWidget implements AutoRouteWrapper {
  final List<PriceAggregate> comboItems;
  final bool isEdit;
  const ComboDealDetailPage({
    Key? key,
    required this.comboItems,
    this.isEdit = false,
  }) : super(key: key);

  @override
  State<ComboDealDetailPage> createState() => _ComboDealDetailPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ComboDealDetailBloc(),
      child: this,
    );
  }
}

class _ComboDealDetailPageState extends State<ComboDealDetailPage> {
  late final EligibilityBloc eligibilityBloc;
  late final PriceComboDeal priceComboDeal;

  @override
  void initState() {
    super.initState();
    eligibilityBloc = context.read<EligibilityBloc>();
    priceComboDeal = widget.comboItems.isEmpty
        ? PriceComboDeal.empty()
        : widget.comboItems.first.price.comboDeal;
    context.read<ComboDealDetailBloc>().add(
          ComboDealDetailEvent.initMaterialItems(
            items: widget.comboItems,
            requireFetchInfo: !widget.isEdit,
          ),
        );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isEdit) return;
      context.read<MaterialPriceDetailBloc>().add(
            MaterialPriceDetailEvent.comboDealFetch(
              user: eligibilityBloc.state.user,
              customerCode: eligibilityBloc.state.customerCodeInfo,
              salesOrganisation: eligibilityBloc.state.salesOrganisation,
              salesOrganisationConfigs: eligibilityBloc.state.salesOrgConfigs,
              shipToCode: eligibilityBloc.state.shipToInfo,
              materialInfoList: priceComboDeal.category.comboMaterialNumbers,
            ),
          );
      context.read<ComboDealListBloc>().add(
            ComboDealListEvent.fetch(
              customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
              salesOrganisation: eligibilityBloc.state.salesOrganisation,
              comboDeals: priceComboDeal,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('ComboDealDetailPage'),
      appBar: AppBar(
        title: const Text('Combo Bundle Details').tr(),
        actions: const [CartButton()],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<MaterialPriceDetailBloc, MaterialPriceDetailState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            listener: (context, state) {
              if (!state.isFetching) {
                context.read<ComboDealDetailBloc>().add(
                      ComboDealDetailEvent.setPriceInfo(
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
                context.read<ComboDealDetailBloc>().add(
                      ComboDealDetailEvent.setComboDealInfo(
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
            Expanded(
              child: BlocBuilder<ComboDealDetailBloc, ComboDealDetailState>(
                builder: (context, state) {
                  if (state.isFetchingComboInfo || state.isFetchingPrice) {
                    return LoadingShimmer.logo(
                      key: const Key('loaderImage'),
                    );
                  }

                  return ScrollList<PriceAggregate>(
                    isLoading: false,
                    itemBuilder: (context, index, item) => ComboDealItem(
                      material: item,
                      isSelected:
                          state.selectedItems[item.getMaterialNumber] ?? false,
                    ),
                    items: state.items.values.toList(),
                    emptyMessage: 'Combo bundle is empty'.tr(),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              decoration: const BoxDecoration(
                color: ZPColors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  ),
                ],
              ),
              child: BlocBuilder<ComboDealDetailBloc, ComboDealDetailState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PriceLabel(
                          key: Key(
                            'Total label ${CartItem.comboDeal(state.allSelectedItems).unitPrice}',
                          ),
                          label: 'Total Value'.tr(),
                          discountPrice: StringUtils.displayPrice(
                            eligibilityBloc.state.salesOrgConfigs,
                            CartItem.comboDeal(state.allSelectedItems)
                                .unitPrice,
                          ),
                          price: CartItem.comboDeal(state.allSelectedItems)
                              .listPrice
                              .toStringAsFixed(2),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            key: const ValueKey('addToCartButton'),
                            onPressed: state.isEnableAddToCart
                                ? () => onAddToCartPressed(
                                      context: context,
                                      selectedItems: state.allSelectedItems,
                                    )
                                : null,
                            child: Text(
                              widget.isEdit
                                  ? 'Update cart'.tr()
                                  : 'Add To Cart'.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
      context.router.pushNamed('cart_page');
    }
  }
}
