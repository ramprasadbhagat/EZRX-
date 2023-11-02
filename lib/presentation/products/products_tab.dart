import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/search_and_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

part 'package:ezrxmobile/presentation/products/widgets/bundle_grid_item.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.materialListPage,
      appBar: AppBar(
        title: const CustomerCodeSelector(
          key: WidgetKeys.customerCodeSelector,
        ),
        backgroundColor: ZPColors.primary,
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 8),
            child: CartButton(),
          ),
        ],
      ),
      body: BlocBuilder<MaterialListBloc, MaterialListState>(
        buildWhen: (previous, current) =>
            previous.materialList != current.materialList ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          final isFavourite = context
              .read<MaterialFilterBloc>()
              .state
              .materialFilter
              .isFavourite;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAndFilter(),
              FilterValueList(
                isFetching: state.isFetching,
              ),
              Expanded(
                child: state.isFetching && state.materialList.isEmpty
                    ? LoadingShimmer.logo(
                        key: WidgetKeys.loaderImage,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ScrollableGridView<MaterialInfo>(
                          emptyImage: isFavourite
                              ? SvgImage.emptyFavourite
                              : SvgImage.faqSearch,
                          emptyMessage:
                              'Try adjusting your search or filter selection to find what you’re looking for.',
                          emptyTitle: isFavourite
                              ? 'No favourites yet'
                              : 'That didn’t match anything',
                          emptyMessageWidget:
                              isFavourite ? const _EmptyMessageWidget() : null,
                          header: const _TotalMaterialCount(),
                          isLoading: state.isFetching,
                          items: state.materialList,
                          onRefresh: () => _onRefresh(context),
                          onLoadingMore: () => _onLoadingMore(context),
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                            MaterialInfo item,
                          ) =>
                              item.type.typeMaterial
                                  ? MaterialGridItem(
                                      materialInfo: item,
                                      onTap: () => _productOnTap(context, item),
                                      onFavouriteTap: () =>
                                          onFavouriteTap(context, item),
                                    )
                                  : _BundleGridItem(
                                      materialInfo: item,
                                    ),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onRefresh(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.materialFilter,
          ),
        );
  }

  void _onLoadingMore(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();
    context.read<MaterialListBloc>().add(
          MaterialListEvent.loadMore(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
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
        MixpanelProps.section: 'All product',
      },
    );
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            locale: context.locale,
            type: materialInfo.type,
          ),
        );
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            salesConfigs: eligibilityBlocState.salesOrgConfigs,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [materialInfo],
          ),
        );
  }

  void onFavouriteTap(BuildContext context, MaterialInfo materialInfo) =>
      context.read<MaterialListBloc>().add(
            materialInfo.isFavourite
                ? MaterialListEvent.deleteFavourite(
                    item: materialInfo,
                  )
                : MaterialListEvent.addFavourite(
                    item: materialInfo,
                  ),
          );
}

class _EmptyMessageWidget extends StatelessWidget {
  const _EmptyMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ZPColors.neutralsDarkBlack,
              ),
          children: [
            TextSpan(
              text: context.tr(
                'Tap on',
              ),
            ),
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: ZPColors.darkYellow,
                ),
              ),
            ),
            TextSpan(
              text: context.tr(
                'to add an item to your favourites',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TotalMaterialCount extends StatelessWidget {
  const _TotalMaterialCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialListBloc, MaterialListState>(
      buildWhen: (previous, current) =>
          previous.materialList != current.materialList,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            key: WidgetKeys.totalMaterialItemCount,
            children: [
              Text(
                state.displaySearchResult
                    ? context.tr('Search results')
                    : context.tr('All products'),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 5,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: ZPColors.accentColor,
                ),
                child: Text(
                  '${state.materialCount}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
