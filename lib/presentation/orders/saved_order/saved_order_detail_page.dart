import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/order_action_button.dart';
import 'package:ezrxmobile/presentation/orders/core/order_bundle_item.dart';
import 'package:ezrxmobile/presentation/orders/core/order_invalid_warning.dart';
import 'package:ezrxmobile/presentation/orders/core/order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_bouns_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderDetailPage extends StatelessWidget {
  final SavedOrder order;
  const SavedOrderDetailPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('Saved Order Details Screen');

    return Scaffold(
      key: const Key('savedOrderDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text('#${order.id}'),
        ),
      ),
      body: RefreshIndicator(
        key: const ValueKey('savedDetailRefreshIndicator'),
        color: ZPColors.primary,
        onRefresh: () async => context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.refresh(
                user: context.read<UserBloc>().state.user,
                customerCode:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs:
                    context.read<SalesOrgBloc>().state.configs,
                shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                materialInfoList: _getMaterialList(order.items),
                pickAndPack:
                    context.read<EligibilityBloc>().state.getPNPValueMaterial,
              ),
            ),
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
                    isInvalidOrder: order.allMaterialQueryInfo.every(
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
                      var material = order.items[index];
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
                    childCount: order.items.length,
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<MaterialPriceDetailBloc,
                  MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isValidating != current.isValidating ||
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  return OrderActionButton(
                    onAddToCartPressed: () => _addToCartPressed(context, state),
                    onDeletePressed: () {
                      context.read<SavedOrderListBloc>().add(
                            SavedOrderListEvent.delete(
                              order: order,
                              user: context.read<UserBloc>().state.user,
                            ),
                          );
                      context.router.pop();
                    },
                    enableAddToCart: order.allMaterialQueryInfo.any(
                      (item) => state.isValidMaterial(
                        query: item,
                      ),
                    ),
                    isLoading: state.isFetching || state.isValidating,
                  );
                },
              ),
            ),
          ],
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

  PriceAggregate _getCommercialTypeMaterial({
    required MaterialPriceDetail itemInfo,
    required MaterialItem material,
    required BuildContext context,
    required bool isBundle,
    required MaterialInfo materialInfo,
  }) {
    final cartBloc = context.read<CartBloc>();
    final priceAggregate = PriceAggregate(
      price: isBundle
          ? itemInfo.price
          : itemInfo.price.copyWith(
              isPriceOverride: material.overridenPrice.isValid(),
              zdp8Override: material.zdp8Override,
              priceOverride: material.overridenPrice,
            ),
      materialInfo: itemInfo.info,
      salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
      quantity: isBundle ? materialInfo.quantity : material.qty,
      discountedMaterialCount: cartBloc.state.zmgMaterialCount,
      bundle: isBundle
          ? Bundle(
              bundleName: BundleName(material.bundleName),
              bundleCode: material.bundleCode,
              bundleInformation: material.bundleInformation,
              materials: material.materials,
            )
          : Bundle.empty(),
      addedBonusList: material.bonuses,
      stockInfo: StockInfo.empty().copyWith(
        materialNumber: itemInfo.info.materialNumber,
      ),
      tenderContract: material.tenderContract,
    );

    return priceAggregate.copyWith(
      addedBonusList: List.from(priceAggregate.addedBonusList)
        ..addAll(priceAggregate.getMaterialItemBonus),
    );
  }

  List<PriceAggregate> _getBundleTypeMaterials({
    required MaterialPriceDetailState state,
    required MaterialItem material,
    required BuildContext context,
    required bool isBundle,
  }) {
    return material.materials
        .map(
          (materialInfo) => _getCommercialTypeMaterial(
            itemInfo: state.materialDetails[materialInfo.queryInfo]!,
            material: material,
            context: context,
            isBundle: true,
            materialInfo: materialInfo,
          ),
        )
        .toList();
  }

  List<PriceAggregate> _buildPriceAggregateList({
    required List<MaterialItem> items,
    required MaterialPriceDetailState state,
    required BuildContext context,
  }) {
    final priceAggregateList = order.items
        .map(
          (item) => item.type.isBundle
              ? _getBundleTypeMaterials(
                  state: state,
                  material: item,
                  context: context,
                  isBundle: true,
                )
              : [
                  _getCommercialTypeMaterial(
                    itemInfo: state.materialDetails[item.queryInfo]!,
                    material: item,
                    context: context,
                    isBundle: false,
                    materialInfo: MaterialInfo.empty(),
                  ),
                ],
        )
        .toList()
        .expand((element) => element)
        .toList();

    return priceAggregateList;
  }

  void _addToCartPressed(BuildContext context, MaterialPriceDetailState state) {
    final cartBloc = context.read<CartBloc>();
    cartBloc.add(const CartEvent.clearCart());

    cartBloc.add(CartEvent.addToCartFromList(
      items: _buildPriceAggregateList(
        items: order.items,
        state: state,
        context: context,
      ),
      customerCodeInfo: context.read<EligibilityBloc>().state.customerCodeInfo,
      salesOrganisation:
          context.read<EligibilityBloc>().state.salesOrganisation,
      salesOrganisationConfigs:
          context.read<EligibilityBloc>().state.salesOrgConfigs,
      shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
      doNotAllowOutOfStockMaterials:
          context.read<EligibilityBloc>().state.doNotAllowOutOfStockMaterials,
    ));

    context.router.pushNamed('cart_page');
    locator<CountlyService>().recordCountlyView('Use saved order');
  }
}
