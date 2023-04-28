import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/orders/core/order_action_button.dart';
import 'package:ezrxmobile/presentation/orders/core/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/core/order_invalid_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_bouns_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateDetailPage extends StatefulWidget {
  final OrderTemplate order;

  const OrderTemplateDetailPage({Key? key, required this.order})
      : super(key: key);

  @override
  State<OrderTemplateDetailPage> createState() =>
      _OrderTemplateDetailPageState();
}

class _OrderTemplateDetailPageState extends State<OrderTemplateDetailPage> {
  late EligibilityBloc elibilityBloc;

  @override
  void initState() {
    super.initState();
    elibilityBloc = context.read<EligibilityBloc>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.fetch(
                user: elibilityBloc.state.user,
                customerCode: elibilityBloc.state.customerCodeInfo,
                salesOrganisation: elibilityBloc.state.salesOrganisation,
                salesOrganisationConfigs: elibilityBloc.state.salesOrgConfigs,
                shipToCode: elibilityBloc.state.shipToInfo,
                materialInfoList: _getMaterialList(widget.order.items),
                pickAndPack: elibilityBloc.state.getPNPValueMaterial,
              ),
            );
      },
    );
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: 'OrderTemplateDetailPage',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('OrderTemplateDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: Text(widget.order.templateName),
      ),
      body: RefreshIndicator(
        color: ZPColors.primary,
        onRefresh: () async {
          context.read<TenderContractListBloc>().add(
                const TenderContractListEvent.initialize(),
              );
          context.read<MaterialPriceDetailBloc>().add(
                MaterialPriceDetailEvent.refresh(
                  user: elibilityBloc.state.user,
                  customerCode: elibilityBloc.state.customerCodeInfo,
                  salesOrganisation: elibilityBloc.state.salesOrganisation,
                  salesOrganisationConfigs: elibilityBloc.state.salesOrgConfigs,
                  shipToCode: elibilityBloc.state.shipToInfo,
                  materialInfoList: _getMaterialList(widget.order.items),
                  pickAndPack: elibilityBloc.state.getPNPValueMaterial,
                ),
              );
        },
        child: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: CustomScrollView(
            slivers: [
              BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isValidating != current.isValidating,
                builder: (context, state) {
                  final isInvalidOrder =
                      widget.order.allMaterialQueryInfo.every(
                    (item) => !state.isValidMaterial(
                      query: item,
                    ),
                  );

                  return SliverAppBar(
                    pinned: true,
                    toolbarHeight:
                        !state.isValidating && isInvalidOrder ? 50.0 : 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar.createSettings(
                      currentExtent: double.infinity,
                      minExtent: 0,
                      maxExtent: double.infinity,
                      child: OrderInvalidWarning(
                        key: const Key('invalidWarningMessage'),
                        isLoading: state.isValidating,
                        isInvalidOrder: isInvalidOrder,
                      ),
                    ),
                  );
                },
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var material = widget.order.items[index];
                    final materialPrice = context
                            .read<MaterialPriceDetailBloc>()
                            .state
                            .materialDetails[material.queryInfo]
                            ?.price ??
                        Price.empty();
                    material = material.copyWith(
                      bonuses: List.from(material.bonuses)
                        ..addAll(
                          PriceAggregate.empty()
                              .copyWith(
                                quantity: material.qty,
                                price: materialPrice,
                              )
                              .getMaterialItemBonus,
                        ),
                    );

                    return Column(
                      children: [
                        material.type.isBundle
                            ? OrderBundleItem(
                                material: material,
                                materialNumber:
                                    material.materialNumber.displayMatNo,
                                qty: material.qty.toString(),
                              )
                            : OrderMaterialItem(
                                materialQueryInfo: material.queryInfo,
                                materialNumber:
                                    material.materialNumber.displayMatNo,
                                qty: material.qty.toString(),
                              ),
                        if (material.bonuses.isNotEmpty)
                          SaveOrderBounsTile(
                            item: material,
                          ),
                      ],
                    );
                  },
                  childCount: widget.order.items.length,
                ),
              ),
              SliverToBoxAdapter(
                key: const Key('orderAction'),
                child: BlocConsumer<MaterialPriceDetailBloc,
                    MaterialPriceDetailState>(
                  listenWhen: (previous, current) =>
                      previous.isValidating != current.isValidating ||
                      previous.isFetching != current.isFetching,
                  listener: (context, state) {
                    if (!state.isFetching && !state.isValidating) {
                      final materialNumberWithTenderContract =
                          widget.order.items
                              .where(
                                (item) =>
                                    !item.type.isBundle &&
                                    state.materialDetails[item.queryInfo]?.info
                                            .hasValidTenderContract ==
                                        true,
                              )
                              .map((item) => item.materialNumber)
                              .toList();

                      context.read<TenderContractListBloc>().add(
                            TenderContractListEvent.fetch(
                              salesOrganisation:
                                  elibilityBloc.state.salesOrganisation,
                              customerCodeInfo:
                                  elibilityBloc.state.customerCodeInfo,
                              shipToInfo: elibilityBloc.state.shipToInfo,
                              materialNumbers: materialNumberWithTenderContract,
                            ),
                          );
                    }
                  },
                  buildWhen: (previous, current) =>
                      previous.isValidating != current.isValidating ||
                      previous.isFetching != current.isFetching,
                  builder: (context, state) {
                    return BlocBuilder<TenderContractListBloc,
                        TenderContractListState>(
                      buildWhen: (previous, current) =>
                          previous.isFetching != current.isFetching,
                      builder: (context, tenderState) {
                        return OrderActionButton(
                          onAddToCartPressed: () => _addToCartPressed(
                            context,
                            state,
                            tenderState,
                          ),
                          onDeletePressed: () => _deletePressed(context),
                          enableAddToCart:
                              widget.order.allMaterialQueryInfo.any(
                            (item) => state.isValidMaterial(
                              query: item,
                            ),
                          ),
                          isLoading: state.isFetching ||
                              state.isValidating ||
                              tenderState.isFetching,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<MaterialQueryInfo> _getMaterialList(List<MaterialItem> items) {
    final materialList = items
        .map((item) => item.type.isBundle
            ? item.materials
                .map((material) =>
                    MaterialQueryInfo.fromBundles(materialInfo: material))
                .toList()
            : [MaterialQueryInfo.fromSavedOrder(orderMaterial: item)])
        .toList()
        .expand((element) => element)
        .toList();

    return materialList;
  }

  void _addToCartPressed(
    BuildContext context,
    MaterialPriceDetailState priceState,
    TenderContractListState tenderContractState,
  ) {
    trackMixpanelEvent(
      MixpanelEvents.selectTemplate,
    );
    final cartBloc = context.read<CartBloc>();
    final salesConfigs = elibilityBloc.state.salesOrgConfigs;

    final finalOrderItems = widget.order.items
        .map((item) {
          if (item.type.isBundle) {
            final hasAnyValidMaterial = item.materials.any(
              (material) =>
                  priceState.materialDetails[material.queryInfo]?.price
                      .isValidMaterial ==
                  true,
            );

            if (hasAnyValidMaterial) {
              return CartItem.bundleFromOrder(
                priceDetailMap: priceState.materialDetails,
                savedItem: item,
                salesConfigs: salesConfigs,
              );
            }

            return null;
          }

          return CartItem.materialFromOrder(
            priceDetailMap: priceState.materialDetails,
            tenderContractMap: tenderContractState.tenderContracts,
            material: item,
            salesConfigs: salesConfigs,
          );
        })
        .whereType<CartItem>()
        .toList();

    cartBloc.add(
      CartEvent.replaceWithOrderItems(
        items: finalOrderItems,
        customerCodeInfo: elibilityBloc.state.customerCodeInfo,
        salesOrganisation: elibilityBloc.state.salesOrganisation,
        salesOrganisationConfigs: salesConfigs,
        shipToInfo: elibilityBloc.state.shipToInfo,
        doNotallowOutOfStockMaterial:
            elibilityBloc.state.doNotAllowOutOfStockMaterials,
      ),
    );
    context.router.pushAndPopUntil(
      const CartPageRoute(),
      predicate: (route) => route.settings.name == 'HomeNavigationTabbarRoute',
    );
  }

  Future<void> _deletePressed(
    BuildContext context,
  ) async {
    await CustomDialogs.confirmationDialog(
      context: context,
      title: 'Delete Order Template?'.tr(),
      message: 'Are you sure you want to delete this Order Template?'.tr(),
      confirmText: 'Yes'.tr(),
      cancelText: 'No'.tr(),
      onAcceptPressed: () async {
        context.read<OrderTemplateListBloc>().add(
              OrderTemplateListEvent.delete(
                widget.order,
              ),
            );
        await context.router.pop();
      },
    );
  }
}
