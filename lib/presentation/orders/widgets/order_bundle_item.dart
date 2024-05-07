import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/orders/widgets/order_bundle_material.dart';

class OrderBundleItem extends StatelessWidget {
  const OrderBundleItem({
    Key? key,
    required this.orderNumber,
    required this.viewByOrdersGroup,
  }) : super(key: key);
  final OrderNumber orderNumber;
  final ViewByOrdersGroup viewByOrdersGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.cartItemBundleTile(
        viewByOrdersGroup.parentId.getOrDefaultValue(''),
      ),
      children: [
        CustomCard(
          showShadow: false,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTag.bundleOffer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewByOrdersGroup.parentId.displayMatNo,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    !context
                            .read<ViewByOrderDetailsBloc>()
                            .state
                            .isLoadingBundleDetail
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${context.tr('Bundle')} ${viewByOrdersGroup.bundleMaterial.bundle.bundleName.name}',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              _BundleInformation(
                                key: WidgetKeys.orderHistoryBundleInformation,
                                viewByOrdersGroup: viewByOrdersGroup,
                              ),
                            ],
                          )
                        : LoadingShimmer.tile(
                            line: 3,
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Column(
                children: viewByOrdersGroup.viewByOrderItem
                    .map(
                      (orderHistoryDetailsOrderItem) => BundleItemMaterial(
                        orderItem: orderHistoryDetailsOrderItem,
                        orderNumber: orderNumber,
                      ),
                    )
                    .toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${context.tr('Total qty')}: ${viewByOrdersGroup.totalMaterialCount}',
                      key: WidgetKeys.cartItemBundleQty,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    PriceComponent(
                      key: WidgetKeys.cartItemBundleTotalPrice,
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: viewByOrdersGroup.totalPrice.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 20,
          thickness: 0.4,
          indent: 0,
          endIndent: 0,
        ),
      ],
    );
  }
}

class _BundleInformation extends StatelessWidget {
  final ViewByOrdersGroup viewByOrdersGroup;
  const _BundleInformation({
    Key? key,
    required this.viewByOrdersGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (viewByOrdersGroup.bundleMaterial == MaterialInfo.empty()) {
      return const SizedBox.shrink();
    }

    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      children: <Widget>[
        Row(
          children: [
            PriceComponent(
              salesOrgConfig: salesOrgConfigs,
              price: viewByOrdersGroup.bundleOffer.rate.toString(),
              type: PriceStyle.bundleActiveOfferPrice,
              trailingText: context.tr('per item '),
            ),
            if (viewByOrdersGroup.bundleMaterial.bundle.showStrikeThroughPrice)
              PriceComponent(
                salesOrgConfig: salesOrgConfigs,
                price: viewByOrdersGroup
                    .bundleMaterial.bundle.minimumQuantityBundleMaterial.rate
                    .toString(),
                type: PriceStyle.bundleListPriceStrikeThrough,
                trailingText: context.tr('per item'),
              ),
          ],
        ),
        Row(
          key: WidgetKeys.cartItemBundleRate,
          children: [
            Text(
              '${context.tr('Purchase')} ${viewByOrdersGroup.bundleOffer.quantity} ${context.tr('or more for')} ',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ZPColors.darkGray,
                    fontStyle: FontStyle.italic,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfigs,
              price: viewByOrdersGroup.bundleOffer.rate.toString(),
              type: PriceStyle.bundleFinalPrice,
              trailingText: context.tr('per item'),
            ),
          ],
        ),
      ],
    );
  }
}
