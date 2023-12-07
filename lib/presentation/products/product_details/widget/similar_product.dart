import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
              current.productDetailAggregate.similarProduct ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        if (!state.isFetching &&
            state.productDetailAggregate.similarProduct.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          key: WidgetKeys.materialDetailsSimilarProductsSection,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Text(
                context.tr('Related products'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            SizedBox(
              height: 300,
              child: state.isFetching
                  ? const _LoadingShimmerSimilarProduct()
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.productDetailAggregate.similarProduct
                          .map(
                            (e) => _SimilarProductCard(material: e),
                          )
                          .toList(),
                    ),
            ),
          ],
        );
      },
    );
  }
}

class _SimilarProductCard extends StatelessWidget {
  final MaterialInfo material;
  const _SimilarProductCard({
    Key? key,
    required this.material,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isLargerThan(context, Breakpoint.desktop)
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.5,
      child: MaterialGridItem(
        key: WidgetKeys.materialDetailsSimilarProductItem,
        materialInfo: material,
        onTap: () => _productOnTap(context, material),
        onFavouriteTap: () => context.read<ProductDetailBloc>().add(
              material.isFavourite
                  ? ProductDetailEvent.deleteFavourite(
                      materialNumber: material.materialNumber,
                      isForSimilarProduct: true,
                    )
                  : ProductDetailEvent.addFavourite(
                      materialNumber: material.materialNumber,
                      isForSimilarProduct: true,
                    ),
            ),
      ),
    );
  }

  void _productOnTap(BuildContext context, MaterialInfo materialInfo) {
    trackMixpanelEvent(
      MixpanelEvents.productItemClicked,
      props: {
        MixpanelProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
        MixpanelProps.isBundle: false,
        MixpanelProps.productName: materialInfo.displayDescription,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
        MixpanelProps.section: 'Related products',
      },
    );
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialInfo: materialInfo,
            locale: context.locale,
          ),
        );
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            comboDealEligible: eligibilityState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }
}

class _LoadingShimmerSimilarProduct extends StatelessWidget {
  const _LoadingShimmerSimilarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4,
          (index) => const MaterialLoading(),
        ),
      ),
    );
  }
}
