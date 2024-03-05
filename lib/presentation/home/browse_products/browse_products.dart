import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
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
    final eligibilityState = context.read<EligibilityBloc>().state;

    return BlocProvider<MaterialListBloc>(
      create: (context) => locator<MaterialListBloc>()
        ..add(
          MaterialListEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
            user: eligibilityState.user,
          ),
        ),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EligibilityBloc, EligibilityState>(
            listenWhen: (previous, current) =>
                previous.isLoading != current.isLoading && !current.isLoading,
            listener: (context, state) {
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      configs: state.salesOrgConfigs,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      selectedMaterialFilter: MaterialFilter.empty(),
                      user: state.user,
                    ),
                  );
            },
          ),
          BlocListener<MaterialListBloc, MaterialListState>(
            listenWhen: (previous, current) =>
                previous.materialList != current.materialList,
            listener: (context, state) {
              if (state.materialList.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetch(
                        comboDealEligible: context
                            .read<EligibilityBloc>()
                            .state
                            .comboDealEligible,
                        materials: state.materialList,
                      ),
                    );
              }
            },
          ),
        ],
        child: BlocConsumer<MaterialListBloc, MaterialListState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) => state.apiFailureOrSuccessOption.fold(
            () => {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) => {},
            ),
          ),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
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
          : MediaQuery.of(context).size.width * 0.45,
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

    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
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
