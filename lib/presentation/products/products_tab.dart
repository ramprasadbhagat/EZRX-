import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/search_and_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'widgets/bundle_label.dart';
part 'widgets/bundle_grid_item.dart';

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
            padding: EdgeInsets.only(right: 16.0),
            child: CartButton(),
          ),
        ],
      ),
      body: BlocBuilder<MaterialListBloc, MaterialListState>(
        buildWhen: (previous, current) =>
            previous.materialList != current.materialList ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
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
                          emptyMessage: 'No material found'.tr(),
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

class _TotalMaterialCount extends StatelessWidget {
  const _TotalMaterialCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        key: WidgetKeys.totalMaterialItemCount,
        children: [
          Text(
            'All products',
            style: Theme.of(context).textTheme.labelMedium,
          ).tr(),
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
            child: BlocBuilder<MaterialListBloc, MaterialListState>(
              buildWhen: (previous, current) =>
                  previous.materialList != current.materialList,
              builder: (context, state) {
                return Text(
                  state.selectedMaterialFilter.isFavourite
                      //if favourite filter is true show the material list length
                      ? '${state.materialList.length}'
                      //if favourite filter is false show the material count
                      : '${state.materialCount}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
