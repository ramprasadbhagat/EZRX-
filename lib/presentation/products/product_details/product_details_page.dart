import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/error_text_with_icon.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_error_section_for_covid.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_details.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/similar_product.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/stock_info.dart';
import 'package:ezrxmobile/presentation/products/widgets/combo_offer_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/image_counter.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/products/product_details/widget/combo_offers_product.dart';

part 'widget/product_image_section.dart';
part 'widget/stock_quantity.dart';

class ProductDetailsPage extends StatefulWidget {
  final MaterialInfo materialInfo;
  const ProductDetailsPage({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
    if (context.read<EligibilityBloc>().state.isZDP5eligible) {
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceForZDP5Materials(
              materialInfo: widget.materialInfo,
            ),
          );
    }
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            comboDealEligible:
                context.read<EligibilityBloc>().state.comboDealEligible,
            materials: [widget.materialInfo],
          ),
        );
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
    return BlocProvider<ProductDetailBloc>(
      create: (context) => locator<ProductDetailBloc>()
        ..add(
          ProductDetailEvent.fetch(
            salesOrganisation:
                context.read<EligibilityBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<EligibilityBloc>().state.customerCodeInfo,
            shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
            user: context.read<EligibilityBloc>().state.user,
            materialInfo: widget.materialInfo,
          ),
        ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar.commonAppBar(
          automaticallyImplyLeading: false,
          backGroundColor:
              _isScrollAtInitialPosition ? Colors.transparent : ZPColors.white,
          leadingWidget: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: CircleAvatar(
              maxRadius: 16,
              backgroundColor: _isScrollAtInitialPosition
                  ? ZPColors.darkGray
                  : ZPColors.transparent,
              child: Icon(
                Icons.chevron_left,
                color: _isScrollAtInitialPosition
                    ? ZPColors.white
                    : ZPColors.black,
                key: WidgetKeys.materialDetailsPageBack,
              ),
            ),
          ),
          actionWidget: [
            Padding(
              key: WidgetKeys.materialDetailsPageCartIcon,
              padding: const EdgeInsets.all(10),
              child: CartButton(
                backgroundCartColor: _isScrollAtInitialPosition
                    ? ZPColors.darkGray
                    : ZPColors.transparent,
                cartColor: _isScrollAtInitialPosition
                    ? ZPColors.white
                    : ZPColors.black,
                iconSize: 20,
                positionTop: -8,
                isPriceResetApplicable: true,
              ),
            ),
          ],
          customerBlockedOrSuspended:
              context.read<EligibilityBloc>().state.customerBlockOrSuspended,
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
          key: WidgetKeys.scrollList,
          controller: _scrollController,
          children: [
            const _ProductImageSection(),
            const _BodyContent(),
            _SimilarProducts(),
          ],
        ),
        bottomNavigationBar: const _Footer(),
      ),
    );
  }
}

class _SimilarProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.similarProduct !=
          current.productDetailAggregate.similarProduct,
      builder: (context, state) {
        return state.showRelatedItemsSection
            ? const SimilarProduct()
            : const SizedBox.shrink();
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              context.read<ProductImageBloc>().add(
                    ProductImageEvent.fetch(
                      list: state.productDetailAggregate.allMaterial,
                    ),
                  );
              if (state.productDetailAggregate.similarProduct.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetch(
                        comboDealEligible: context
                            .read<EligibilityBloc>()
                            .state
                            .comboDealEligible,
                        materials: state.productDetailAggregate.similarProduct,
                      ),
                    );
              }
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isDetailAndStockFetching !=
              current.isDetailAndStockFetching ||
          previous.productDetailAggregate != current.productDetailAggregate,
      builder: (context, state) {
        final materialInfo = state.productDetailAggregate.materialInfo;
        final config = context.read<EligibilityBloc>().state.salesOrgConfigs;
        final validateOutOfStockValue =
            context.read<EligibilityBloc>().state.validateOutOfStockValue;
        final level = !config.hideStockDisplay &&
                !state.isDetailAndStockFetching
            ? !state.productDetailAggregate.stockInfo.inStock.isMaterialInStock
                ? config.addOosMaterials.productTag(validateOutOfStockValue)
                : ''
            : '';

        return Column(
          key: WidgetKeys.bodyContentProductDetail,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferLabel(
              materialInfo: materialInfo,
            ),
            ComboOfferLabel(
              materialInfo: materialInfo,
              iconSize: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 5,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          materialInfo.combinationCode(
                            showGMCPart: config.enableGMC,
                          ),
                          key: WidgetKeys.materialDetailsMaterialNumber,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: ZPColors.darkGray),
                        ),
                      ),
                      if (level.isNotEmpty)
                        StatusLabel(
                          status: StatusType(
                            level,
                          ),
                        ),
                    ],
                  ),
                  _Description(
                    materialInfo: materialInfo,
                  ),
                  ProductStockInfo(
                    materialNumber: materialInfo.materialNumber,
                  ),
                  ProductPriceLabel(
                    materialInfo: materialInfo,
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 0.5,
            ),
            ComboOffersProduct(materialNumber: materialInfo.materialNumber),
            AvailableOffer(materialNumber: materialInfo.materialNumber),
            const MaterialInformation(),
            const MaterialDetailsToggle(),
            const SizedBox(height: 20),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 8,
              color: ZPColors.extraLightGray,
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _Description({
    Key? key,
    required this.materialInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (context.read<EligibilityBloc>().state.showMaterialDescInMandarin)
          Text(
            materialInfo.materialDescription,
            key: WidgetKeys.materialDetailsMaterialDescription,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        Row(
          children: [
            Expanded(
              child: Text(
                materialInfo.defaultMaterialDescription,
                key: WidgetKeys.materialDetailsMaterialDescription,
                style: Theme.of(context).textTheme.labelSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            BlocConsumer<ProductDetailBloc, ProductDetailState>(
              listenWhen: (previous, current) =>
                  previous.productDetailAggregate.materialInfo.isFavourite !=
                      current.productDetailAggregate.materialInfo.isFavourite &&
                  !current.isDetailAndStockFetching,
              buildWhen: (previous, current) =>
                  previous.productDetailAggregate.materialInfo.isFavourite !=
                      current.productDetailAggregate.materialInfo.isFavourite ||
                  previous.isDetailAndStockFetching !=
                      current.isDetailAndStockFetching,
              listener: (context, state) {
                final toastMessage =
                    state.productDetailAggregate.materialInfo.isFavourite
                        ? 'Product added as favourite'
                        : 'Product removed as favourite';

                CustomSnackBar(
                  messageText: context.tr(toastMessage),
                ).show(context);
              },
              builder: (context, state) {
                return FavouriteIcon(
                  enable: !state.isDetailAndStockFetching,
                  key: WidgetKeys.materialDetailsFavoriteIcon,
                  isFavourite:
                      state.productDetailAggregate.materialInfo.isFavourite,
                  constraints: const BoxConstraints(),
                  onTap: () {
                    if (materialInfo.isFavourite) {
                      trackMixpanelEvent(
                        MixpanelEvents.addProductToFavorite,
                        props: {
                          MixpanelProps.productName:
                              materialInfo.displayDescription,
                          MixpanelProps.productCode:
                              materialInfo.materialNumber.displayMatNo,
                          MixpanelProps.productManufacturer:
                              materialInfo.getManufactured,
                          MixpanelProps.clickAt:
                              RouterUtils.buildRouteTrackingName(
                            context.router.currentPath,
                          ),
                        },
                      );
                    }
                    context.read<ProductDetailBloc>().add(
                          state.productDetailAggregate.materialInfo.isFavourite
                              ? ProductDetailEvent.deleteFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: materialInfo.materialNumber,
                                )
                              : ProductDetailEvent.addFavourite(
                                  isForSimilarProduct: false,
                                  materialNumber: materialInfo.materialNumber,
                                ),
                        );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _Footer extends StatefulWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  State<_Footer> createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
  late TextEditingController _quantityEditingController;
  @override
  void initState() {
    const defaultQty = 1;
    _quantityEditingController =
        TextEditingController(text: defaultQty.toString());
    context
        .read<ProductDetailBloc>()
        .add(ProductDetailEvent.updateQty(qty: defaultQty));
    _quantityEditingController.addListener(() {
      context
          .read<ProductDetailBloc>()
          .add(ProductDetailEvent.updateQty(qty: qty));
    });
    super.initState();
  }

  @override
  void dispose() {
    _quantityEditingController.dispose();
    super.dispose();
  }

  int get qty => int.tryParse(_quantityEditingController.text) ?? 0;

  bool isEligibleForAddToCart({
    required BuildContext context,
    required ProductDetailState productDetailState,
  }) {
    final stockInfo = productDetailState.productDetailAggregate.stockInfo;
    final materialInfo = productDetailState.productDetailAggregate.materialInfo;
    final price = context
            .read<MaterialPriceBloc>()
            .state
            .materialPrice[materialInfo.materialNumber] ??
        Price.empty();
    final eligibilityState = context.read<EligibilityBloc>().state;
    if (eligibilityState.disableCreateOrder) return false;
    final materialWithoutPrice =
        eligibilityState.salesOrgConfigs.materialWithoutPrice;
    final materialInStock = (!stockInfo.inStock.isMaterialInStock
        ? !eligibilityState.doNotAllowOutOfStockMaterials
        : true);
    final validQty = !eligibilityState.salesOrg.isID ||
        !productDetailState.eligibleForStockError;

    return !materialInfo.isSuspended &&
        (materialInfo.isFOCMaterial
            ? (materialWithoutPrice && materialInStock)
            : !(price.finalPrice.isEmpty && !materialWithoutPrice) &&
                materialInStock) &&
        validQty;
  }

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final isZdp5enable = eligibilityState.salesOrgConfigs.enableZDP5 &&
        eligibilityState.salesOrganisation.salesOrg.isVN;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.productDetailAggregate != current.productDetailAggregate,
          listener: (context, state) {
            final price =
                context.read<MaterialPriceBloc>().state.getPriceForMaterial(
                      state.productDetailAggregate.materialInfo.materialNumber,
                    );
            if (isZdp5enable &&
                state.productDetailAggregate.hasRemainingQuotaReached(
                  price.zdp5RemainingQuota.intValue,
                )) {
              context.read<MaterialPriceBloc>().add(
                    MaterialPriceEvent.fetchPriceForZDP5Materials(
                      materialInfo: state.productDetailAggregate.materialInfo,
                    ),
                  );
              context.read<ProductDetailBloc>().add(
                    ProductDetailEvent.setExceedQty(
                      exceedQty: state.productDetailAggregate.materialInfo
                          .materialQtyConfirmZDP5Rule(
                        price.zdp5MaxQuota.intValue,
                        price.zdp5RemainingQuota.intValue,
                      ),
                    ),
                  );
            }
          },
          buildWhen: (previous, current) =>
              previous.isDetailAndStockFetching !=
                  current.isDetailAndStockFetching ||
              previous.inputQty != current.inputQty,
          builder: (context, state) {
            final materialInfo = state.productDetailAggregate.materialInfo;
            final isZdp5enable = eligibilityState.salesOrgConfigs.enableZDP5 &&
                eligibilityState.salesOrganisation.salesOrg.isVN;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (materialInfo.isSuspended)
                  InfoLabel(
                    textValue:
                        context.tr('This material is currently suspended'),
                    key: WidgetKeys.productDetailSuspended,
                    margin: const EdgeInsets.only(
                      top: 16,
                      bottom: 8,
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: CartItemQuantityInput(
                        key: WidgetKeys.materialDetailsQuantityInput,
                        addPressed: (value) {
                          if (isZdp5enable) {
                            context.read<ProductDetailBloc>().add(
                                  ProductDetailEvent
                                      .fetchItemQuantityForZdp5Discount(
                                    quantity: int.parse(
                                      _quantityEditingController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        controller: _quantityEditingController,
                        isEnabled: !materialInfo.isSuspended,
                        onFieldChange: (value) {},
                        onSubmit: (value) {
                          if (isZdp5enable) {
                            context.read<ProductDetailBloc>().add(
                                  ProductDetailEvent
                                      .fetchItemQuantityForZdp5Discount(
                                    quantity: int.parse(
                                      _quantityEditingController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        quantityAddKey: WidgetKeys.productDetailQuantityAddKey,
                        quantityDeleteKey:
                            WidgetKeys.productDetailQuantityDeleteKey,
                        quantityTextKey:
                            WidgetKeys.productDetailQuantityTextKey,
                        minusPressed: (value) {
                          if (isZdp5enable) {
                            context.read<ProductDetailBloc>().add(
                                  ProductDetailEvent
                                      .fetchItemQuantityForZdp5Discount(
                                    quantity: int.parse(
                                      _quantityEditingController.text,
                                    ),
                                  ),
                                );
                          }
                        },
                        height: MediaQuery.of(context).size.height * 0.056,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 4,
                      key: WidgetKeys.materialDetailsAddToCartButton,
                      child: BlocConsumer<CartBloc, CartState>(
                        listenWhen: (previous, current) =>
                            previous.isUpserting != current.isUpserting,
                        listener: (context, state) {
                          if (context.routeData != context.router.current) {
                            return;
                          }

                          state.apiFailureOrSuccessOption.fold(
                            () {
                              if (!state.isUpserting &&
                                  context.router.current.path ==
                                      'orders/material_details') {
                                _trackAddToCartSuccess(
                                  context,
                                  state,
                                  materialInfo,
                                  qty,
                                );

                                CustomSnackBar(
                                  key: WidgetKeys
                                      .materialDetailsAddToCartSnackBar,
                                  messageText:
                                      context.tr('Item has been added to cart'),
                                ).show(context);
                              }
                            },
                            (either) => either.fold(
                              (failure) =>
                                  _trackAddToCartFailure(context, failure),
                              (_) {},
                            ),
                          );
                        },
                        buildWhen: (previous, current) =>
                            previous.isUpserting != current.isUpserting ||
                            previous.isFetching != current.isFetching ||
                            previous.isClearing != current.isClearing,
                        builder: (context, stateCart) {
                          final price = context
                                  .read<MaterialPriceBloc>()
                                  .state
                                  .materialPrice[materialInfo.materialNumber] ??
                              Price.empty();

                          return LoadingShimmer.withChild(
                            enabled: stateCart.isUpserting ||
                                state.isDetailAndStockFetching,
                            child: SizedBox(
                              width: double.infinity,
                              height:
                                  MediaQuery.of(context).size.height * 0.056,
                              child: ElevatedButton(
                                onPressed: stateCart.isUpserting ||
                                        state.isDetailAndStockFetching ||
                                        !isEligibleForAddToCart(
                                          context: context,
                                          productDetailState: state,
                                        )
                                    ? null
                                    : () {
                                        _addToCart(
                                          context: context,
                                          state: state,
                                          stateCart: stateCart,
                                          price: price,
                                          quantityText:
                                              _quantityEditingController.text,
                                        );
                                      },
                                child: Text(
                                  context.tr('Add to cart'),
                                  style: const TextStyle(
                                    color: ZPColors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (context.read<EligibilityBloc>().state.salesOrg.isID) ...[
                  if (state.eligibleForStockError)
                    ErrorTextWithIcon(
                      valueText: context.tr(
                        'You have exceed the available qty for this item',
                      ),
                    ),
                  _StockQuantity(
                    state: state,
                  ),
                ],
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom * 1.2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void _trackAddToCartSuccess(
  BuildContext context,
  CartState state,
  MaterialInfo material,
  int qty,
) {
  final price = context
          .read<MaterialPriceBloc>()
          .state
          .materialPrice[material.materialNumber] ??
      Price.empty();
  final cartItem = state.cartProducts
      .firstWhere(
        (e) => e.getMaterialNumber == material.materialNumber,
        orElse: () => PriceAggregate.empty(),
      )
      .copyWith(quantity: qty, price: price);

  final props = <String, dynamic>{
    MixpanelProps.productName: cartItem.materialInfo.displayDescription,
    MixpanelProps.productCode:
        cartItem.materialInfo.materialNumber.getOrDefaultValue(''),
    MixpanelProps.productManufacturer: cartItem.materialInfo.getManufactured,
    MixpanelProps.productTotalPrice: cartItem.finalPriceTotal,
    MixpanelProps.productQty: qty,
    MixpanelProps.clickAt:
        RouterUtils.buildRouteTrackingName(context.router.currentPath),
  };

  //TODO: Revisit later to implement is_offer and tag for MixpanelProps when have a proper solution because current logic code for checking offer and tag of material is long and complicated, moving it here may cause the code become messy

  trackMixpanelEvent(MixpanelEvents.addToCartSuccess, props: props);
}

void _trackAddToCartFailure(BuildContext context, ApiFailure failure) =>
    trackMixpanelEvent(
      MixpanelEvents.addToCartFailed,
      props: {
        MixpanelProps.errorMessage: failure.failureMessage,
        MixpanelProps.viewFrom:
            RouterUtils.buildRouteTrackingName(context.router.currentPath),
      },
    );

void _addToCart({
  required BuildContext context,
  required ProductDetailState state,
  required CartState stateCart,
  required Price price,
  required String quantityText,
}) {
  if (stateCart.cartProducts.isNotEmpty) {
    if (state.productDetailAggregate.materialInfo.isFOCMaterial &&
        !stateCart.containFocMaterialInCartProduct) {
      _showDetailsPagePage(
        context: context,
      );
    } else if (!state.productDetailAggregate.materialInfo.isFOCMaterial &&
        stateCart.containFocMaterialInCartProduct) {
      _showDetailsPagePage(
        context: context,
      );
    } else {
      final materialNumber = context
          .read<ProductDetailBloc>()
          .state
          .productDetailAggregate
          .materialInfo
          .materialNumber;
      if (stateCart.getCurrentComboItemByComboDealId(price.comboDeal.id) !=
          PriceAggregate.empty()) {
        _initComboDealAndNavigate(
          context: context,
          cartState: stateCart,
          materialNumber: materialNumber,
          price: price,
        );
      } else {
        upsertCart(
          context: context,
          price: price,
          state: state,
          stateCart: stateCart,
          quantityText: quantityText,
        );
      }
    }
  } else {
    upsertCart(
      context: context,
      price: price,
      state: state,
      stateCart: stateCart,
      quantityText: quantityText,
    );
  }
}

void upsertCart({
  required BuildContext context,
  required Price price,
  required ProductDetailState state,
  required CartState stateCart,
  required String quantityText,
}) {
  final materialNumber =
      state.productDetailAggregate.materialInfo.materialNumber;
  context.read<CartBloc>().add(
        CartEvent.upsertCart(
          priceAggregate: PriceAggregate.empty().copyWith(
            materialInfo: state.productDetailAggregate.materialInfo.copyWith(
              counterOfferDetails:
                  stateCart.productCounterOfferDetails(materialNumber),
            ),
            price: price,
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            quantity: stateCart.getQuantityOfProduct(
                  productNumber: materialNumber,
                ) +
                int.parse(
                  quantityText,
                ),
            bonusSampleItems: context.read<CartBloc>().state.productBonusList(
                  materialNumber,
                ),
          ),
        ),
      );
}

void _initComboDealAndNavigate({
  required BuildContext context,
  required CartState cartState,
  required MaterialNumber materialNumber,
  required Price price,
}) {
  final comboDeal = context
      .read<ComboDealListBloc>()
      .state
      .getComboDeal(comboDealId: price.comboDeal.id);
  final overrideQuantity = cartState
      .getCurrentComboItemByComboDealId(price.comboDeal.id)
      .comboMaterialsCurrentQuantity;
  context.read<ComboDealMaterialDetailBloc>().add(
        ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
          contain: overrideQuantity.isNotEmpty,
        ),
      );

  if (price.comboDeal.category.type.isMaterialNumber) {
    context.read<ComboDealMaterialDetailBloc>().add(
          ComboDealMaterialDetailEvent.fetchComboDealDetail(
            comboDeal: comboDeal,
            parentMaterialNumber: materialNumber,
            comboMaterialsCurrentQuantity: overrideQuantity,
          ),
        );
  } else {
    final productDetailAggregate =
        context.read<ProductDetailBloc>().state.productDetailAggregate;

    final principalCode = productDetailAggregate
        .materialInfo.principalData.principalCode
        .getOrDefaultValue('');

    context.read<ComboDealMaterialDetailBloc>().add(
          ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
            comboDeal: comboDeal,
            principles: [principalCode],
            comboMaterialsCurrentQuantity: overrideQuantity,
          ),
        );
  }
  context.navigateTo(const ComboDetailPageRoute());
}

void _showDetailsPagePage({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) {
      final productDetailsState = context.read<ProductDetailBloc>().state;
      final cartState = context.read<CartBloc>().state;
      final materialNumber = productDetailsState
          .productDetailAggregate.materialInfo.materialNumber;
      final price = context
              .read<MaterialPriceBloc>()
              .state
              .materialPrice[materialNumber] ??
          Price.empty();

      return AddToCartErrorSection(
        priceAggregate: PriceAggregate.empty().copyWith(
          materialInfo:
              productDetailsState.productDetailAggregate.materialInfo.copyWith(
            counterOfferDetails:
                cartState.productCounterOfferDetails(materialNumber),
          ),
          price: price,
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          quantity: cartState.getQuantityOfProduct(
                productNumber: materialNumber,
              ) +
              productDetailsState.inputQty,
          bonusSampleItems: cartState.productBonusList(
            materialNumber,
          ),
        ),
      );
    },
  );
}
