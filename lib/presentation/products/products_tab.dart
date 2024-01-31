import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/search_and_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.shipToInfo.customerBlock != current.shipToInfo.customerBlock,
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.materialListPage,
          appBar: CustomAppBar.commonAppBar(
            title: const CustomerCodeSelector(
              key: WidgetKeys.customerCodeSelector,
            ),
            backGroundColor: ZPColors.primary,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            actionWidget: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 8),
                child: CartButton(),
              ),
            ],
            customerBlocked: state.shipToInfo.customerBlock,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ScrollableGridView<MaterialInfo>(
                              noRecordFoundWidget: NoRecordFound.productTab(
                                context,
                                isFavourite: isFavourite,
                              ),
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
                                          onTap: () =>
                                              _productOnTap(context, item),
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
      },
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
            user: context.read<UserBloc>().state.user,
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
            user: context.read<UserBloc>().state.user,
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

    context.router.push(ProductDetailsPageRoute(materialInfo: materialInfo));
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
