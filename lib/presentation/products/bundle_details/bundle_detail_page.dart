import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_add_to_cart_sheet.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_material_descriptions_sheet.dart';
import 'package:ezrxmobile/presentation/products/widgets/image_counter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/utils/string_utils.dart';

import 'package:ezrxmobile/presentation/core/price_component.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

part 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_image_section.dart';
part 'package:ezrxmobile/presentation/products/bundle_details/widget/outline_text.dart';

class BundleDetailPage extends StatefulWidget {
  const BundleDetailPage({Key? key}) : super(key: key);

  @override
  State<BundleDetailPage> createState() => _BundleDetailPageState();
}

class _BundleDetailPageState extends State<BundleDetailPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.bundleDetailPage,
      appBar: AppBar(
        actions: const [
          Padding(
            key: WidgetKeys.materialDetailsPageCartIcon,
            padding: EdgeInsets.all(10),
            child: CartButton(
              backgroundCartColor: ZPColors.transparent,
              cartColor: ZPColors.black,
              iconSize: 20,
              positionTop: -8,
            ),
          ),
        ],
      ),
      floatingActionButton: !_isScrollAtInitialPosition
          ? FloatingActionButton(
              key: WidgetKeys.materialDetailsFloatingButton,
              onPressed: () => _scrollToTop(),
              mini: true,
              backgroundColor: ZPColors.secondaryMustard,
              child: const Icon(
                Icons.expand_less,
                color: ZPColors.black,
              ),
            )
          : const SizedBox.shrink(),
      body: ListView(
        controller: _scrollController,
        children: [
          const _BundleImageSection(),
          Align(
            alignment: Alignment.topLeft,
            child: ProductTag.bundleOffer(),
          ),
          const _BundleDetails(),
          const SizedBox(height: 10),
          const Divider(
            indent: 0,
            endIndent: 0,
            height: 15,
            color: ZPColors.lightGray2,
          ),
          const _BundleOfferDetails(),
        ],
      ),
      bottomNavigationBar: const _AddToCartButton(),
    );
  }
}

class _BundleDetails extends StatelessWidget {
  const _BundleDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.materialInfo !=
              current.productDetailAggregate.materialInfo ||
          previous.isDetailAndStockFetching != current.isDetailAndStockFetching,
      builder: (context, state) {
        final material = state.productDetailAggregate.materialInfo;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                material.bundle.bundleCode,
                style: Theme.of(context).textTheme.bodySmall,
                key: WidgetKeys.bundleOfferCode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.isDetailAndStockFetching
                      ? SizedBox(width: 100, child: LoadingShimmer.tile())
                      : Expanded(
                          child: Text(
                            material.name,
                            style: Theme.of(context).textTheme.labelLarge,
                            key: WidgetKeys.bundleOfferName,
                          ),
                        ),
                  FavouriteIcon(
                    isFavourite: material.isFavourite,
                    onTap: () {
                      if (material.isFavourite) {
                        trackMixpanelEvent(
                          MixpanelEvents.addProductToFavorite,
                          props: {
                            MixpanelProps.productName: material.name,
                            MixpanelProps.productCode:
                                material.materialNumber.displayMatNo,
                            MixpanelProps.productManufacturer:
                                material.getManufactured,
                            MixpanelProps.clickAt:
                                RouterUtils.buildRouteTrackingName(
                              context.router.currentPath,
                            ),
                          },
                        );
                      }
                      context.read<ProductDetailBloc>().add(
                            material.isFavourite
                                ? ProductDetailEvent.deleteFavourite(
                                    isForSimilarProduct: false,
                                    materialNumber: material.materialNumber,
                                  )
                                : ProductDetailEvent.addFavourite(
                                    isForSimilarProduct: false,
                                    materialNumber: material.materialNumber,
                                  ),
                          );
                    },
                  ),
                ],
              ),
              state.isDetailAndStockFetching
                  ? SizedBox(width: 100, child: LoadingShimmer.tile())
                  : PriceComponent(
                      salesOrgConfig:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      price: material.bundle.minimumQuantityBundleMaterial.rate
                          .toString(),
                      type: PriceStyle.bundlePrice,
                      trailingText: context.tr('per item'),
                      key: WidgetKeys.bundleOfferPrice,
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _BundleOfferDetails extends StatelessWidget {
  const _BundleOfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.materialInfo !=
          current.productDetailAggregate.materialInfo,
      builder: (context, state) {
        final bundleInformation =
            state.productDetailAggregate.materialInfo.bundle.bundleInformation;

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                key: WidgetKeys.bundleOfferSummary,
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5,
                isThreeLine: true,
                leading: const Icon(
                  Icons.discount_outlined,
                ),
                title: Text(
                  context.tr('Bundle offer'),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  context.tr(
                    'Mix and match bundled products and buy more for better deals.',
                  ),
                ),
              ),
              bundleInformation.isNotEmpty
                  ? CurvedRectangleWidget(
                      key: WidgetKeys.bundleInformation,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      semiCircleCount: 8,
                      semiCircleRadius: 16,
                      width: double.infinity,
                      backgroundColor: ZPColors.lightBlueColor,
                      borderColor: ZPColors.lightBlueBorderColor,
                      child: Column(
                        children: state.productDetailAggregate.materialInfo
                            .bundle.sortedBundleInformation
                            .map(
                              (e) => BalanceTextRow(
                                keyFlex: 3,
                                keyText: '${StringUtils.displayPrice(
                                  context
                                      .read<EligibilityBloc>()
                                      .state
                                      .salesOrgConfigs,
                                  e.rate,
                                )} ${context.tr('per item')}',
                                keyTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                valueFlex: 4,
                                valueText:
                                    'Total purchase quantity:${e.quantity} or more',
                                valueTextStyle: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: ZPColors.darkGray),
                              ),
                            )
                            .toList(),
                      ),
                    )
                  : const SizedBox.shrink(),
              ListTile(
                key: WidgetKeys.bundleOfferMaterialInfo,
                onTap: () {
                  _trackShowProductInfo(context);
                  _showMaterialDescriptionSheet(context: context);
                },
                contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                title: Text(
                  'Material information'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: Text(
                  '${'Bundle code'.tr()}, ${'Manufacturer'.tr()}',
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMaterialDescriptionSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const BundleMaterialDescription(),
    );
  }

  void _trackShowProductInfo(BuildContext context) {
    final materialInfo = context
        .read<ProductDetailBloc>()
        .state
        .productDetailAggregate
        .materialInfo;

    trackMixpanelEvent(
      MixpanelEvents.productInfoViewed,
      props: {
        MixpanelProps.productName: materialInfo.name,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
      },
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.isDetailAndStockFetching != current.isDetailAndStockFetching,
      builder: (context, state) {
        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              LoadingShimmer.withChild(
                enabled: state.isDetailAndStockFetching,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: WidgetKeys.materialDetailsAddToCartButton,
                    onPressed: state.isDetailAndStockFetching
                        ? null
                        : () {
                            final bundle = context
                                .read<ProductDetailBloc>()
                                .state
                                .productDetailAggregate
                                .materialInfo;
                            context.read<BundleAddToCartBloc>().add(
                                  BundleAddToCartEvent.set(
                                    bundle: bundle,
                                    bundleMaterials: bundle.bundle.materials,
                                  ),
                                );
                            _showBundleAddToCartBottomSheet(
                              context: context,
                            );
                          },
                    child: Text('Add to cart'.tr()),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBundleAddToCartBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (_) {
        return const BundlesAddToCartSheet();
      },
    );
  }
}
