import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/order/entities/recent_order_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/recent_order/recent_order_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_card.dart';

import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/home/widgets/section_title.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentOrderBloc, RecentOrderState>(
      listenWhen: (previous, current) =>
          previous.recentlyOrderedProducts != current.recentlyOrderedProducts ||
          previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
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
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      salesConfigs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      comboDealEligible: context
                          .read<EligibilityBloc>()
                          .state
                          .comboDealEligible,
                      materials: state.toMaterialInfo,
                    ),
                  );
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return state.isFetching
            ? const _RecentOrderLoadingShimmer()
            : const _BodyContent();
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentOrderBloc, RecentOrderState>(
      buildWhen: (previous, current) =>
          previous.recentlyOrderedProducts != current.recentlyOrderedProducts,
      builder: (context, state) {
        return state.recentlyOrderedProducts.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: SectionTitle(
                      title: 'Recently ordered',
                      onTapIconButton: () => context.navigateTo(const OrdersTabRoute()),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.16,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.recentlyOrderedProducts
                          .map((e) => _ProductTile(product: e))
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

class _ProductTile extends StatelessWidget {
  final RecentOrderItem product;
  const _ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: CustomCard(
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCard(
                showBorder: true,
                showShadow: false,
                padding: const EdgeInsets.all(
                  10,
                ),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.height * 0.06,
                  height: MediaQuery.of(context).size.height * 0.06,
                  imageUrl: product.productImages.thumbNail,
                  placeholder: (context, url) => const _DefaultProductImage(),
                  errorWidget: (context, url, error) =>
                      const _DefaultProductImage(),
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
                      '${product.materialNumber.displayMatNo} | ${product.ezrxNumber.displayLabel}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ZPColors.extraLightGrey4),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        product.materialDescription,
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      product.manufactureName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.extraLightGrey4,
                            fontSize: 10,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _PriceLabel(product: product),
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          onPressed: () {
                            product.isFavourite
                                ? context.read<RecentOrderBloc>().add(
                                      RecentOrderEvent.deleteFavourite(
                                        materialCode: product.materialNumber,
                                      ),
                                    )
                                : context.read<RecentOrderBloc>().add(
                                      RecentOrderEvent.addFavourite(
                                        materialCode: product.materialNumber,
                                      ),
                                    );
                          },
                          icon: Icon(
                            product.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: ZPColors.darkYellow,
                          ),
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
    );
  }
}

class _PriceLabel extends StatelessWidget {
  final RecentOrderItem product;
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
class _DefaultProductImage extends StatelessWidget {
  const _DefaultProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/product_default.svg',
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.height * 0.05,
    );
  }
}

class _RecentOrderLoadingShimmer extends StatelessWidget {
  const _RecentOrderLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingShimmer.withChild(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: const CustomCard(
            child: ListTile(),
          ),
        ),
      ),
    );
  }
}
