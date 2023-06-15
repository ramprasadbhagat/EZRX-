import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.materialListPage,
      appBar: AppBar(
        key: WidgetKeys.materialListPageAppBar,
        title: const Text('Products').tr(),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<MaterialListBloc, MaterialListState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return state.isFetching && state.materialList.isEmpty
              ? const _Loading()
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ScrollableGridView<MaterialInfo>(
                    emptyMessage: 'No material found'.tr(),
                    header: const _TotalMaterialCount(),
                    isLoading: state.isFetching,
                    items: state.materialList,
                    onRefresh: () => _onRefresh(context),
                    onLoadingMore: () => _onLoadingMore(context),
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    itemBuilder:
                        (BuildContext context, int index, MaterialInfo item) =>
                            item.type.typeMaterial
                                ? _Material(
                                    materialInfo: item,
                                  )
                                : _Bundle(
                                    materialInfo: item,
                                  ),
                  ),
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
                context.read<SalesOrgBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
          ),
        );
  }

  void _onLoadingMore(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();
    context.read<MaterialListBloc>().add(
          MaterialListEvent.loadMore(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
          ),
        );
  }
}

class _Material extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _Material({
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.materialListMaterialCard,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/product_default.svg',
                    fit: BoxFit.fill,
                  ),
                ),
                _Label(
                  materialInfo: materialInfo,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: _FavouriteIcon(),
                ),
              ],
            ),
          ),
          const Divider(
            indent: 0,
            endIndent: 0,
            height: 15,
            color: ZPColors.accentColor,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materialInfo.code.displayMatNo,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                        ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        materialInfo.displayDescription,
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    materialInfo.manufactured,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                          fontSize: 10,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'MYR 00.00',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
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
                  previous.materialCount != current.materialCount,
              builder: (context, state) {
                return Text(
                  '${state.materialCount}',
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

class _Label extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _Label({required this.materialInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return materialInfo.inStock
        ? const SizedBox.shrink()
        : _StockLabel(
            materialInfo: materialInfo,
          );
  }
}

class _StockLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _StockLabel({required this.materialInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.materialListStockLabel,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: const BoxDecoration(
        color: ZPColors.warning,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Text(
        materialInfo.stockInfos.isEmpty ? 'Preorder' : 'Out of Stock',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: ZPColors.darkerGrey,
            ),
      ).tr(),
    );
  }
}

class _FavouriteIcon extends StatelessWidget {
  const _FavouriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.favorite_border,
          color: ZPColors.darkYellow,
        ),
      ),
    );
  }
}

class _Bundle extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _Bundle({
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: WidgetKeys.materialListBundleCard,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: ZPColors.aliceBlue,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materialInfo.code.displayMatNo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ZPColors.darkGray),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  materialInfo.displayDescription,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  materialInfo.manufactured,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ZPColors.darkGray),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Column(
            children: materialInfo.listingVisibleMaterial
                .map((e) => _BundleMaterial(materialData: e))
                .toList(),
          ),
          materialInfo.isMaterialHiddenOnListing
              ? Text(
                  '+ ${materialInfo.listingHiddenMaterialCount} Materials',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _BundleMaterial extends StatelessWidget {
  final MaterialData materialData;
  const _BundleMaterial({
    required this.materialData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.materialListBundleMaterial(
        materialData.code.getOrDefaultValue(''),
      ),
      children: [
        Card(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.008,
            horizontal: 8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.004),
            child: SvgPicture.asset(
              'assets/svg/product_default.svg',
              height: MediaQuery.of(context).size.height * 0.02,
              width: MediaQuery.of(context).size.height * 0.02,
            ),
          ),
        ),
        Expanded(
          child: Text(
            materialData.displayDescription,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: MediaQuery.of(context).size.height * 0.04,
      children: const [
        SizedBox(
          width: double.infinity,
        ),
        _MaterialLoading(),
        _MaterialLoading(),
        _MaterialLoading(),
        _MaterialLoading(),
      ],
    );
  }
}

class _MaterialLoading extends StatelessWidget {
  const _MaterialLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: WidgetKeys.materialListMaterialCard,
      elevation: 0.4,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingShimmer.withChild(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                  ),
                  color: ZPColors.white,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.01,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
