import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseProduct extends StatelessWidget {
  const BrowseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaterialListBloc>(
      create: (context) => locator<MaterialListBloc>(),
      child: BlocListener<EligibilityBloc, EligibilityState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading && !current.isLoading,
        listener: (context, state) {
          context.read<MaterialListBloc>().add(
                MaterialListEvent.fetch(
                  salesOrganisation:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  configs:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
                  selectedMaterialFilter: MaterialFilter.empty(),
                ),
              );
        },
        child: BlocBuilder<MaterialListBloc, MaterialListState>(
          buildWhen: (previous, current) =>
              previous.materialList != current.materialList,
          builder: (_, state) {
            return state.isFetching || state.materialList.isNotEmpty
                ? Column(
                    key: WidgetKeys.browseProduct,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: SectionTitle(
                          key: WidgetKeys.browseProductIcon,
                          title: 'Browse products',
                          onTapIconButton: () => state.isFetching
                              ? null
                              : _navigateForMoreProducts(context),
                        ),
                      ),
                      state.isFetching
                          ? const _BrowseProductLoadingShimmer(
                              key: WidgetKeys.browseProductLoadingShimmer,
                            )
                          : SizedBox(
                              height: 300,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: state.materialList
                                    .map((e) => _BrowseProductCard(product: e))
                                    .toList(),
                              ),
                            ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _navigateForMoreProducts(BuildContext context) {
    if (context.read<MaterialListBloc>().state.isFilterSelected) {
      context.read<MaterialListBloc>().add(
            MaterialListEvent.fetch(
              salesOrganisation:
                  context.read<EligibilityBloc>().state.salesOrganisation,
              configs: context.read<EligibilityBloc>().state.salesOrgConfigs,
              customerCodeInfo:
                  context.read<EligibilityBloc>().state.customerCodeInfo,
              shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
              selectedMaterialFilter: MaterialFilter.empty(),
            ),
          );
    }
    context.navigateTo(const ProductsTabRoute());
  }
}

class _BrowseProductCard extends StatelessWidget {
  final MaterialInfo product;
  const _BrowseProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isLargerThan(context, Breakpoint.desktop)
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.5,
      child: MaterialGridItem(
        key: WidgetKeys.browseProductsList,
        materialInfo: product,
        onTap: () => _productOnTap(context, product),
        onFavouriteTap: () {
          context.read<MaterialListBloc>().add(
                product.isFavourite
                    ? MaterialListEvent.deleteFavourite(
                        item: product,
                      )
                    : MaterialListEvent.addFavourite(
                        item: product,
                      ),
              );
        },
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
        MixpanelProps.section: 'Browse products',
      },
    );
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialInfo: materialInfo,
          ),
        );
    if (context.read<EligibilityBloc>().state.isZDP5eligible) {
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: product,
            ),
          );
    }
    context.router.pushNamed('orders/material_details');
  }
}

class _BrowseProductLoadingShimmer extends StatelessWidget {
  const _BrowseProductLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
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
