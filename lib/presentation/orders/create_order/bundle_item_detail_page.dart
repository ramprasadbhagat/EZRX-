import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
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

    return Scaffold(
      key: const Key('BundleItemDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text('#${bundleAggregate.bundle.bundleCode}'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLabel(
              textValue: 'Deals%',
            ),
            ...bundleAggregate.bundle
                .bundleInfoMessage()
                .map(
                  (e) => Text(
                    e,
                    style: Theme.of(context).textTheme.subtitle2?.apply(
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
                      context
                          .read<AddToCartBloc>()
                          .add(AddToCartEvent.updateQuantity(
                            1,
                            context.read<CartBloc>().state.zmgMaterialCount,
                          ));
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
                        bundleCode: bundleAggregate.bundle.bundleCode,
                        controller: controller,
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: BlocBuilder<MaterialPriceDetailBloc,
                  MaterialPriceDetailState>(
                buildWhen: (previous, current) =>
                    previous.isValidating != current.isValidating ||
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  if (state.isFetching || state.isValidating) {
                    return LoadingShimmer.withChild(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const SizedBox(),
                      ),
                    );
                  }

                  return ElevatedButton(
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
    );
  }

  void _addToCartPressed(
    BuildContext context,
    Bundle bundle,
    Map<String, TextEditingController> list,
  ) {
    final cartBloc = context.read<CartBloc>();
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
          discountedMaterialCount: cartBloc.state.zmgMaterialCount,
          isOverride: false,
          bundle: bundle,
        );

        return priceAggregate;
      }

      return PriceAggregate.empty();
    }).toList();
    cartBloc.add(CartEvent.addToCartFromList(items: priceAggregateList));

    //TODO: Will revisit
    context.router.pushNamed('cart_page');
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool enableDefaultMD;
  final String bundleCode;
  final TextEditingController controller;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.enableDefaultMD,
    required this.bundleCode,
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
                  materialInfo.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.kPrimaryColor,
                      ),
                ),
                Text(
                  materialInfo.materialDescription,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                (enableDefaultMD &&
                        materialInfo.defaultMaterialDescription.isNotEmpty)
                    ? Text(
                        materialInfo.defaultMaterialDescription,
                        style: Theme.of(context).textTheme.subtitle2?.apply(
                              color: ZPColors.lightGray,
                            ),
                      )
                    : const SizedBox.shrink(),
                Text(
                  materialInfo.principalData.principalName,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.lightGray,
                      ),
                ),
              ],
            ),
          ),
          QuantityInput(
            quantityTextKey:
                Key('$bundleCode${materialInfo.materialNumber.getValue()}'),
            onFieldChange: (int value) {
              context.read<AddToCartBloc>().add(
                    AddToCartEvent.updateQuantity(
                      value,
                      context.read<CartBloc>().state.zmgMaterialCount,
                    ),
                  );
            },
            minusPressed: (int value) {
              context.read<AddToCartBloc>().add(
                    AddToCartEvent.updateQuantity(
                      value,
                      context.read<CartBloc>().state.zmgMaterialCount,
                    ),
                  );
            },
            addPressed: (int value) {
              context.read<AddToCartBloc>().add(
                    AddToCartEvent.updateQuantity(
                      value,
                      context.read<CartBloc>().state.zmgMaterialCount,
                    ),
                  );
            },
            controller: controller,
          ),
        ],
      ),
    );
  }
}
