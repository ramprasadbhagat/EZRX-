import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/curved_rectangle_widget.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_add_to_cart_sheet.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/widget/bundle_material_descriptions_sheet.dart';
import 'package:ezrxmobile/presentation/products/widgets/product_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
        children: const [
          ProductDetailImage(),
          Align(
            alignment: Alignment.topLeft,
            child: _BundleOfferTag(),
          ),
          _BundleDetails(),
          SizedBox(height: 10),
          Divider(
            indent: 0,
            endIndent: 0,
            height: 15,
            color: ZPColors.lightGray2,
          ),
          _BundleOfferDetails(),
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
          current.productDetailAggregate.materialInfo,
      builder: (context, state) {
        final material = state.productDetailAggregate.materialInfo;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                material.materialNumber.displayMatNo,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.isFetching
                      ? SizedBox(width: 100, child: LoadingShimmer.tile())
                      : Expanded(
                          child: Text(
                            material.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                  FavouriteIcon(
                    isFavourite: material.isFavourite,
                    onTap: () => context.read<ProductDetailBloc>().add(
                          material.isFavourite
                              ? ProductDetailEvent.deleteFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: material.materialNumber,
                                )
                              : ProductDetailEvent.addFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: material.materialNumber,
                                ),
                        ),
                  ),
                ],
              ),
              state.isFetching
                  ? SizedBox(width: 100, child: LoadingShimmer.tile())
                  : Text(
                      'MYR ${material.bundle.minimumQuantityBundleMaterial.rate} per item',
                      style: Theme.of(context).textTheme.labelLarge,
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
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5,
                isThreeLine: true,
                leading: const Icon(
                  Icons.discount_outlined,
                ),
                title: Text(
                  'Bundle offer'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                subtitle: Text(
                  'Mix and match bundled products and buy more for better deals.'
                      .tr(),
                ),
              ),
              bundleInformation.isNotEmpty
                  ? CurvedRectangleWidget(
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
                            .bundle.bundleInformation
                            .map(
                              (e) => BalanceTextRow(
                                keyFlex: 3,
                                keyText: 'MYR ${e.rate} per item',
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
                onTap: () => _showMaterialDescriptionSheet(context: context),
                contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                title: Text(
                  'Material information'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: const Text(
                  'Bundle code, Manufacturer',
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
      builder: (_) {
        return const BundleMaterialDescription();
      },
    );
  }
}

class _BundleOfferTag extends StatelessWidget {
  const _BundleOfferTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.discount_outlined,
            color: ZPColors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Bundle offer'.tr(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ZPColors.white),
          ),
        ],
      ),
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
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return SafeArea(
          minimum: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: state.isFetching
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
