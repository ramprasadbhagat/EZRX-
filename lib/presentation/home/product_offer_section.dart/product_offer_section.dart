import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/presentation/home/widgets/section_title.dart';

import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';

import 'package:ezrxmobile/locator.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/material_filter.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import 'package:ezrxmobile/presentation/core/icon_label.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/core/responsive.dart';

class ProductsOnOffer extends StatelessWidget {
  const ProductsOnOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctx = context;

    return BlocProvider(
      create: (context) => locator<MaterialListBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<EligibilityBloc, EligibilityState>(
            listenWhen: (previous, current) =>
                previous.shipToInfo != current.shipToInfo,
            listener: (context, state) {
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.fetch(
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      configs:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<EligibilityBloc>().state.shipToInfo,
                      selectedMaterialFilter: MaterialFilter.empty().copyWith(
                        isProductOffer: true,
                      ),
                    ),
                  );
            },
          ),
          BlocListener<MaterialListBloc, MaterialListState>(
            listenWhen: (previous, current) =>
                previous.nextPageIndex != current.nextPageIndex,
            listener: (context, state) {
              state.apiFailureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {
                    context.read<MaterialPriceBloc>().add(
                          MaterialPriceEvent.fetch(
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            salesConfigs:
                                context.read<SalesOrgBloc>().state.configs,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                            comboDealEligible: context
                                .read<EligibilityBloc>()
                                .state
                                .comboDealEligible,
                            materials: state.materialList,
                          ),
                        );
                    if (state.selectedMaterialFilter.isProductOffer) {
                      context
                          .read<ProductImageBloc>()
                          .add(ProductImageEvent.fetch(
                            list: state.materialList,
                          ));
                    }
                  },
                ),
              );
            },
          ),
        ],
        child: BlocBuilder<MaterialListBloc, MaterialListState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            return state.isFetching
                ? const _ProductOnOfferLoadingShimmer()
                : _BodyContent(ctx: ctx);
          },
        ),
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final BuildContext ctx;
  const _BodyContent({Key? key, required this.ctx}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialListBloc, MaterialListState>(
      buildWhen: (previous, current) =>
          previous.materialList != current.materialList,
      builder: (context, state) {
        return state.materialList.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: SectionTitle(
                      title: 'Products on offer',
                      onTapIconButton: () =>
                          _navigateForMoreProductWithOffers(ctx),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.materialList
                          .map((e) => _ProductTile(materialInfo: e))
                          .toList(),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  void _navigateForMoreProductWithOffers(BuildContext context) {
    context.read<MaterialListBloc>().add(MaterialListEvent.fetch(
          salesOrganisation:
              context.read<EligibilityBloc>().state.salesOrganisation,
          configs: context.read<EligibilityBloc>().state.salesOrgConfigs,
          customerCodeInfo:
              context.read<EligibilityBloc>().state.customerCodeInfo,
          shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
          selectedMaterialFilter: MaterialFilter.empty().copyWith(
            isProductOffer: true,
          ),
        ));
    context.navigateTo(const ProductsTabRoute());
  }
}

class _ProductTile extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _ProductTile({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width * 0.9
          : MediaQuery.of(context).size.width * 0.45,
      child: Stack(children: [
        CustomCard(
          margin: const EdgeInsets.all(10.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            title: Row(
              children: [
                CustomCard(
                  showBorder: true,
                  showShadow: false,
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: ProductImage(
                    width: MediaQuery.of(context).size.height * 0.06,
                    height: 50,
                    materialNumber: materialInfo.materialNumber,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        materialInfo.materialNumber.displayMatNo,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ZPColors.extraLightGrey4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          materialInfo.name,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        materialInfo.getManufactured,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                              fontSize: 10,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _PriceLabel(product: materialInfo),
                          FavouriteIcon(
                            isFavourite: materialInfo.isFavourite,
                            visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            onTap: () {
                              materialInfo.isFavourite
                                  ? context.read<MaterialListBloc>().add(
                                        MaterialListEvent.deleteFavourite(
                                          item: materialInfo,
                                        ),
                                      )
                                  : context.read<MaterialListBloc>().add(
                                        MaterialListEvent.addFavourite(
                                          item: materialInfo,
                                        ),
                                      );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const IconLabel(
          icon: Icons.local_offer_outlined,
          backgroundColor: ZPColors.darkYellow,
          iconSize: 23,
          labelText: '',
          margin: EdgeInsets.only(left: 10, top: 10),
        ),
      ]),
    );
  }
}

class _PriceLabel extends StatelessWidget {
  final MaterialInfo product;
  const _PriceLabel({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final itemPrice = state.materialPrice[product.materialNumber];
        if (itemPrice != null) {
          return PriceComponent(
            price: itemPrice.lastPrice.getOrDefaultValue(0).toString(),
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            priceTextStyle: Theme.of(context).textTheme.labelSmall,
            currencyCodeTextStyle: Theme.of(context).textTheme.labelSmall,
          );
        }

        if (state.isFetching) {
          return SizedBox(
            key: WidgetKeys.priceLoading,
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Text(
          'Price Not Available'.tr(),
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

class _ProductOnOfferLoadingShimmer extends StatelessWidget {
  const _ProductOnOfferLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingShimmer.withChild(
        child: const SizedBox(
          height: 150,
          child: CustomCard(
            child: ListTile(),
          ),
        ),
      ),
    );
  }
}
