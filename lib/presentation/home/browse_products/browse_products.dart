import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/home/widgets/section_title.dart';
import 'package:ezrxmobile/presentation/products/widgets/material_grid_item.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseProduct extends StatelessWidget {
  const BrowseProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MaterialListBloc>(
      create: (context) => locator<MaterialListBloc>()
        ..add(
          MaterialListEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            configs: context.read<EligibilityBloc>().state.salesOrgConfigs,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            selectedMaterialFilter: MaterialFilter.empty(),
          ),
        ),
      child: BlocListener<MaterialListBloc, MaterialListState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) => state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        ),
        child: const _BodyContent(),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialListBloc, MaterialListState>(
      buildWhen: (previous, current) =>
          previous.materialList != current.materialList,
      builder: (context, state) {
        return state.isFetching || state.materialList.isNotEmpty 
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: SectionTitle(
                      title: 'Browse products',
                      onTapIconButton: () =>
                          context.navigateTo(const ProductsTabRoute()),
                    ),
                  ),
                  state.isFetching
                      ? const _BrowseProductLoadingShimmer()
                      :
                  SizedBox(
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
    );
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
        materialInfo: product,
        onTap: () => _productOnTap(context, product), 
        onFavouriteTap: () {},
      ),
    );
  }

  void _productOnTap(BuildContext context, MaterialInfo materialInfo) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            locale: context.locale,
          ),
        );
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

