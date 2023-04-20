import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleItemDetailPage extends StatelessWidget {
  final BundleAggregate bundleAggregate;
  const BundleItemDetailPage({
    Key? key,
    required this.bundleAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quantityControllerList = <String, TextEditingController>{};
    final userCanCreateOrder =
        context.read<UserBloc>().state.userCanCreateOrder;

    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return Scaffold(
      key: const Key('BundleItemDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text('#${bundleAggregate.bundle.bundleCode}'),
        ),
      ),
      body: AnnouncementBanner(
        appModule: AppModule.orders,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomLabel(
                textValue: 'Deals%',
              ),
              ...bundleAggregate.bundle.bundleInfoMessage
                  .map(
                    (e) => Text(
                      e,
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    ),
                  )
                  .toList(),
              Expanded(
                child: BlocBuilder<MaterialPriceDetailBloc,
                    MaterialPriceDetailState>(
                  buildWhen: (previous, current) =>
                      previous.isValidating != current.isValidating ||
                      previous.isFetching != current.isFetching,
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: bundleAggregate.materialInfos.length,
                      itemBuilder: (context, index) {
                        if (state.isValidating || state.isFetching) {
                          return LoadingShimmer.withChild(
                            child: const Card(
                              child: SizedBox(
                                key: Key('itemLoading'),
                                height: 60,
                                width: double.infinity,
                              ),
                            ),
                          );
                        }
                        final queryInfo = MaterialQueryInfo.fromBundles(
                          materialInfo: bundleAggregate.materialInfos[index],
                        );
                        final controller = TextEditingController();
                        controller.text = '0';
                        quantityControllerList[bundleAggregate
                            .materialInfos[index].materialNumber
                            .getOrCrash()] = controller;
                        final materialDetail = state.materialDetails[queryInfo]!;
                        final enableDefaultMD = context
                            .read<SalesOrgBloc>()
                            .state
                            .configs
                            .enableDefaultMD;
      
                        return _ListContent(
                          materialInfo: materialDetail.info,
                          enableDefaultMD: enableDefaultMD,
                          controller: controller,
                        );
                      },
                    );
                  },
                ),
              ),
              if (userCanCreateOrder)
                Center(
                  child: BlocBuilder<MaterialPriceDetailBloc,
                      MaterialPriceDetailState>(
                    buildWhen: (previous, current) =>
                        previous.isValidating != current.isValidating ||
                        previous.isFetching != current.isFetching,
                    builder: (context, state) {
                      if (state.isValidating || state.isFetching) {
                        return LoadingShimmer.withChild(
                          child: ElevatedButton(
                            key: const Key('buttonLoading'),
                            onPressed: () {},
                            child: const SizedBox(),
                          ),
                        );
                      }
      
                      return ElevatedButton(
                        key: const Key('addBundlesToCart'),
                        onPressed: () {
                          _addToCartPressed(
                            context,
                            bundleAggregate.bundle,
                            quantityControllerList,
                          );
                        },
                        child: const Text('Add to Cart').tr(),
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

  void _addToCartPressed(
    BuildContext context,
    Bundle bundle,
    Map<String, TextEditingController> list,
  ) {
    final materialPriceDetailBloc = context.read<MaterialPriceDetailBloc>();
    final priceAggregateList = bundleAggregate.materialInfos.map((material) {
      final itemInfo =
          materialPriceDetailBloc.state.materialDetails[material.queryInfo];
      if (itemInfo != null) {
        final priceAggregate = PriceAggregate(
          price: itemInfo.price,
          materialInfo: itemInfo.info,
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          quantity: int.parse(list[material.materialNumber.getOrCrash()]!.text),
          bundle: bundle,
          addedBonusList: [],
          stockInfo: StockInfo.empty().copyWith(
            materialNumber: itemInfo.info.materialNumber,
          ),
          tenderContract: TenderContract.empty(),
          comboDeal: ComboDeal.empty(),
        );

        return priceAggregate;
      }

      return PriceAggregate.empty();
    }).toList();
    context.read<CartBloc>().add(
          CartEvent.addBundleToCart(
            bundleItems: priceAggregateList,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            salesOrganisationConfigs:
                context.read<SalesOrgBloc>().state.configs,
            shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
            doNotallowOutOfStockMaterial: context
                .read<EligibilityBloc>()
                .state
                .doNotAllowOutOfStockMaterials,
          ),
        );

    //TODO: Will revisit
    context.router.pushNamed('cart_page');
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool enableDefaultMD;
  final TextEditingController controller;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.enableDefaultMD,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key('materialOption${materialInfo.materialNumber.getValue()}'),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materialInfo.materialDescription,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.kPrimaryColor,
                      ),
                ),
                Text(
                  materialInfo.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.lightGray,
                      ),
                ),
                (enableDefaultMD &&
                        materialInfo.defaultMaterialDescription.isNotEmpty)
                    ? Text(
                        materialInfo.defaultMaterialDescription,
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.lightGray,
                            ),
                      )
                    : const SizedBox.shrink(),
                Text(
                  materialInfo.principalData.principalName
                      .getOrDefaultValue(''),
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.lightGray,
                      ),
                ),
              ],
            ),
          ),
          QuantityInput(
            isEnabled: true,
            quantityAddKey: Key(
              'bundleAdd${materialInfo.materialNumber.getOrDefaultValue('')}',
            ),
            quantityDeleteKey: Key(
              'bundleDelete${materialInfo.materialNumber.getOrDefaultValue('')}',
            ),
            quantityTextKey: Key(
              'bundleText${materialInfo.materialNumber.getOrDefaultValue('')}',
            ),
            onFieldChange: (int value) {},
            addPressed: (int value) {},
            minusPressed: (int value) {},
            controller: controller,
            minimumQty: 0,
          ),
        ],
      ),
    );
  }
}
