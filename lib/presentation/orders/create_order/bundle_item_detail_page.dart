import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/custom_label.dart';
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
                          final queryInfo = MaterialQueryInfo.fromBundles(
                              materialInfo:
                                  bundleAggregate.materialInfos[index],);
                          final materialDetail =
                              state.materialDetails[queryInfo]!;
                          final enableDefaultMD = context
                              .read<SalesOrgBloc>()
                              .state
                              .configs
                              .enableDefaultMD;

                          // final priceAggregate = PriceAggregate(
                          //   price: priceDetail.price,
                          //   materialInfo: priceDetail.info,
                          //   salesOrgConfig:
                          //       context.read<SalesOrgBloc>().state.configs,
                          //   quantity: 1,
                          //   zmgMaterialCountOnCart: 0,
                          //   isOverride: false,
                          // );
                          return _ListContent(
                              materialInfo: materialDetail.info,
                              enableDefaultMD: enableDefaultMD,);
                        },);
                  },
                ),
              ),
            ],
          ),
        ),);
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final bool enableDefaultMD;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.enableDefaultMD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key('materialOption${materialInfo.materialNumber.getValue()}'),
        onTap: () {},
        title: Column(
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
        trailing: SizedBox(
          width: 150,
          child: QuantityInput(
            controller: TextEditingController(text: '1'),
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
          ),
        ),
      ),
    );
  }
}
