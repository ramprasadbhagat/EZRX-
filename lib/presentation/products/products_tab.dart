import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/scrollable_grid_view.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/widgets/bundle_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/filter_value_list.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/products/widgets/shimmer_grid_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _ProductSearch(),
              FilterValueList(
                isFetching: state.isFetching,
              ),
              Expanded(
                child: state.isFetching && state.materialList.isEmpty
                    ? const LoadingShimmerGridItem()
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
                                    )
                                  : BundleGridItem(
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
                context.read<SalesOrgBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.selectedMaterialFilter,
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
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.selectedMaterialFilter,
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

class _ProductSearch extends StatelessWidget {
  const _ProductSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: TextFormField(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          context.router.pushNamed('product_suggestion_page');
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            key: WidgetKeys.productScanCameraKey,
            icon: const Icon(
              Icons.camera_alt_outlined,
            ),
            onPressed: () => {},
          ),
          hintText: 'Search'.tr(),
        ),
      ),
    );
  }
}
