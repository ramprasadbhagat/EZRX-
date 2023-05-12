import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';

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

class SavedOrderDetailPage extends StatefulWidget {
  final SavedOrder order;
  const SavedOrderDetailPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<SavedOrderDetailPage> createState() => _SavedOrderDetailPageState();
}

class _SavedOrderDetailPageState extends State<SavedOrderDetailPage> {
  late EligibilityBloc eligibilityBloc;
  @override
  void initState() {
    super.initState();
    eligibilityBloc = context.read<EligibilityBloc>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.fetch(
                user: eligibilityBloc.state.user,
                customerCode: eligibilityBloc.state.customerCodeInfo,
                salesOrganisation: eligibilityBloc.state.salesOrganisation,
                salesOrganisationConfigs: eligibilityBloc.state.salesOrgConfigs,
                shipToCode: eligibilityBloc.state.shipToInfo,
                materialInfoList: _getMaterialList(widget.order.items),
                pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('savedOrderDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: Text('#${widget.order.id}'),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: RefreshIndicator(
          key: const ValueKey('savedDetailRefreshIndicator'),
          color: ZPColors.primary,
          onRefresh: () async {
            context.read<TenderContractListBloc>().add(
                  const TenderContractListEvent.initialize(),
                );
            context.read<MaterialPriceDetailBloc>().add(
                  MaterialPriceDetailEvent.refresh(
                    user: eligibilityBloc.state.user,
                    customerCode: eligibilityBloc.state.customerCodeInfo,
                    salesOrganisation: eligibilityBloc.state.salesOrganisation,
                    salesOrganisationConfigs:
                        eligibilityBloc.state.salesOrgConfigs,
                    shipToCode: eligibilityBloc.state.shipToInfo,
                    materialInfoList: _getMaterialList(widget.order.items),
                    pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
                  ),
                );
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<MaterialPriceDetailBloc,
                    MaterialPriceDetailState>(
                  buildWhen: (previous, current) =>
                      previous.isValidating != current.isValidating,
                  builder: (context, state) {
                    return OrderInvalidWarning(
                      isLoading: state.isValidating,
                      isInvalidOrder: widget.order.allMaterialQueryInfo.every(
                        (item) => !state.isValidMaterial(
                          query: item,
                        ),
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var material = widget.order.items[index];
                        final materialPrice =
                            state.materialDetails[material.queryInfo]?.price ??
                                Price.empty();
                        material = material.copyWith(
                          bonuses: List.from(material.bonuses)
                            ..addAll(
                              PriceAggregate.empty()
                                  .copyWith(
                                    quantity: material.qty,
                                    price: materialPrice,
                                    tenderContract: material.tenderContract,
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
                                        material.materialNumber.displayMatNo.tr(),
                                    qty: material.qty.toString(),
                                  )
                                : OrderMaterialItem(
                                    materialQueryInfo: material.queryInfo,
                                    materialNumber:
                                        material.materialNumber.displayMatNo.tr(),
                                    qty: material.qty.toString(),
                                  ),
                            if (material.bonuses.isNotEmpty &&
                                !material.havingContract)
                              SaveOrderBounsTile(
                                item: material,
                              ),
                          ],
                        );
                      },
                      childCount: widget.order.items.length,
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
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
                                  eligibilityBloc.state.salesOrganisation,
                              customerCodeInfo:
                                  eligibilityBloc.state.customerCodeInfo,
                              shipToInfo: eligibilityBloc.state.shipToInfo,
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

  List<CartItem> _getUniqueItems({
    required List<MaterialItem> items,
    required MaterialPriceDetailState priceState,
    required SalesOrganisationConfigs salesConfigs,
    required TenderContractListState tenderContractState,
  }) {
    final newList = List<MaterialItem>.from(items);
    final groupByList = items
        .where((item) => !item.type.isBundle)
        .groupListsBy((item) => item.materialNumber);
    newList.removeWhere((item) => !item.type.isBundle);
    newList.addAll(groupByList.entries
        .map(
          (entry) => entry.value.first.copyWith(
            qty: entry.value.fold<int>(
              0,
              (sum, item) => sum + item.qty,
            ),
          ),
        )
        .toList());

    return newList
        .map((item) => item.type.isBundle
            ? CartItem.bundleFromOrder(
                priceDetailMap: priceState.materialDetails,
                savedItem: item,
                salesConfigs: salesConfigs,
              )
            : CartItem.materialFromOrder(
                priceDetailMap: priceState.materialDetails,
                material: item,
                salesConfigs: salesConfigs,
                tenderContractMap: tenderContractState.tenderContracts,
              ))
        .toList();
  }

  void _addToCartPressed(
    BuildContext context,
    MaterialPriceDetailState priceState,
    TenderContractListState tenderContractState,
  ) {
    final cartBloc = context.read<CartBloc>();
    final salesConfigs = eligibilityBloc.state.salesOrgConfigs;
    cartBloc.add(
      CartEvent.replaceWithOrderItems(
        items: _getUniqueItems(
          items: widget.order.items,
          priceState: priceState,
          salesConfigs: salesConfigs,
          tenderContractState: tenderContractState,
        ),
        customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
        salesOrganisation: eligibilityBloc.state.salesOrganisation,
        salesOrganisationConfigs: salesConfigs,
        shipToInfo: eligibilityBloc.state.shipToInfo,
        doNotallowOutOfStockMaterial:
            eligibilityBloc.state.doNotAllowOutOfStockMaterials,
      ),
    );

    context.read<AdditionalDetailsBloc>().add(
          AdditionalDetailsEvent.initFromSavedOrder(
            config: salesConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            orderId: widget.order.id,
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
      title: 'Delete Order?',
      message: 'Are you sure you want to delete this Order?',
      confirmText: 'Yes',
      cancelText: 'No',
      onAcceptPressed: () async {
        context.read<SavedOrderListBloc>().add(
              SavedOrderListEvent.delete(
                order: widget.order,
                user: eligibilityBloc.state.user,
              ),
            );
        await context.router.pop();
      },
    );
  }
}
