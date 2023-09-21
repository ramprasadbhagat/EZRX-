import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
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
import 'package:ezrxmobile/presentation/products/widgets/covid_label.dart';
import 'package:ezrxmobile/presentation/products/widgets/image_counter.dart';
import 'package:ezrxmobile/presentation/products/widgets/offer_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

part 'widget/product_image_section.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 16,
        automaticallyImplyLeading: false,
        backgroundColor:
            _isScrollAtInitialPosition ? Colors.transparent : ZPColors.white,
        leading: IconButton(
          key: WidgetKeys.materialDetailsPageBack,
          onPressed: () => Navigator.pop(context),
          icon: CircleAvatar(
            maxRadius: 16,
            backgroundColor: _isScrollAtInitialPosition
                ? ZPColors.darkGray
                : ZPColors.transparent,
            child: Icon(
              Icons.chevron_left,
              color:
                  _isScrollAtInitialPosition ? ZPColors.white : ZPColors.black,
            ),
          ),
        ),
        actions: [
          Padding(
            key: WidgetKeys.materialDetailsPageCartIcon,
            padding: const EdgeInsets.all(10),
            child: CartButton(
              backgroundCartColor: _isScrollAtInitialPosition
                  ? ZPColors.darkGray
                  : ZPColors.transparent,
              cartColor:
                  _isScrollAtInitialPosition ? ZPColors.white : ZPColors.black,
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
          const _ProductImageSection(),
          const _BodyContent(),
          _SimilarProducts(),
        ],
      ),
      bottomNavigationBar: const _Footer(),
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
        return state.showRelatedItems
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
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final materialInfo = state.productDetailAggregate.materialInfo;
        final config = context.read<SalesOrgBloc>().state.configs;
        final validateOutOfStockValue =
            context.read<EligibilityBloc>().state.validateOutOfStockValue;
        final level = !state.isFetching
            ? !state.productDetailAggregate.stockInfo.inStock.isMaterialInStock
                ? config.addOosMaterials.productTag(validateOutOfStockValue)
                : ''
            : '';

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferLabel(
              materialInfo: state.productDetailAggregate.materialInfo,
              textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.white,
                  ),
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
                      Text(
                        materialInfo.materialNumber.displayMatNo,
                        key: WidgetKeys.materialDetailsMaterialNumber,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: ZPColors.darkGray),
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
                    materialInfo: state.productDetailAggregate.materialInfo,
                  ),
                  ProductStockInfo(
                    materialNumber: materialInfo.materialNumber,
                  ),
                  ProductPriceLabel(
                    materialInfo: state.productDetailAggregate.materialInfo,
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 0.5,
            ),
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
    return Row(
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
              !current.isFetching,
          buildWhen: (previous, current) =>
              previous.productDetailAggregate.materialInfo.isFavourite !=
                  current.productDetailAggregate.materialInfo.isFavourite ||
              previous.isFetching != current.isFetching,
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
              enable: state.isFetching,
              key: WidgetKeys.materialDetailsFavouriteIcon,
              isFavourite:
                  state.productDetailAggregate.materialInfo.isFavourite,
              constraints: const BoxConstraints(),
              onTap: () => context.read<ProductDetailBloc>().add(
                    state.productDetailAggregate.materialInfo.isFavourite
                        ? ProductDetailEvent.deleteFavourite(
                            isForSimilarProduct: false,
                            materialNumber: materialInfo.materialNumber,
                          )
                        : ProductDetailEvent.addFavourite(
                            isForSimilarProduct: false,
                            materialNumber: materialInfo.materialNumber,
                          ),
                  ),
            );
          },
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
    _quantityEditingController = TextEditingController(text: '1');
    super.initState();
  }

  @override
  void dispose() {
    _quantityEditingController.dispose();
    super.dispose();
  }

  bool _isEligibleForAddToCart({
    required BuildContext context,
    required Price price,
    required MaterialInfo materialInfo,
  }) {
    final disableCreateOrder =
        !context.read<UserBloc>().state.user.userCanCreateOrder;
    if (disableCreateOrder) return false;
    final materialWithoutPrice =
        context.read<SalesOrgBloc>().state.configs.materialWithoutPrice;
    final materialInStock = (!context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .stockInfo
            .inStock
            .isMaterialInStock
        ? !context.read<EligibilityBloc>().state.doNotAllowOutOfStockMaterials
        : true);

    return !materialInfo.isSuspended &&
        (materialInfo.isFOCMaterial
            ? (materialWithoutPrice && materialInStock)
            : !(price.finalPrice.isEmpty && !materialWithoutPrice) &&
                materialInStock);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            final materialInfo = state.productDetailAggregate.materialInfo;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (materialInfo.isSuspended)
                  InfoLabel(
                    textValue:
                        context.tr('This material is currently suspended'),
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
                        addPressed: (value) {},
                        controller: _quantityEditingController,
                        isEnabled: !materialInfo.isSuspended,
                        onFieldChange: (value) {},
                        onSubmit: (value) {},
                        quantityAddKey: WidgetKeys.productDetailQuantityAddKey,
                        quantityDeleteKey:
                            WidgetKeys.productDetailQuantityDeleteKey,
                        quantityTextKey:
                            WidgetKeys.productDetailQuantityTextKey,
                        minusPressed: (value) {},
                        height: MediaQuery.of(context).size.height * 0.055,
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
                          state.apiFailureOrSuccessOption.fold(
                            () {
                              if (!state.isUpserting &&
                                  context.router.current.path ==
                                      'orders/material_details') {
                                CustomSnackBar(
                                  key: WidgetKeys
                                      .materialDetailsAddToCartSnackBar,
                                  messageText:
                                      context.tr('Item has been added to cart'),
                                ).show(context);
                              }
                            },
                            (either) => {},
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
                            enabled: stateCart.isUpserting || state.isFetching,
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: stateCart.isUpserting ||
                                        !_isEligibleForAddToCart(
                                          context: context,
                                          price: price,
                                          materialInfo: materialInfo,
                                        )
                                    ? null
                                    : () {
                                        if (stateCart.cartProducts.isNotEmpty) {
                                          if (state.productDetailAggregate
                                                  .materialInfo.isFOCMaterial &&
                                              !stateCart
                                                  .containFocMaterialInCartProduct) {
                                            _showDEtailsPagePage(
                                              context: context,
                                            );
                                          } else if (!state
                                                  .productDetailAggregate
                                                  .materialInfo
                                                  .isFOCMaterial &&
                                              stateCart
                                                  .containFocMaterialInCartProduct) {
                                            _showDEtailsPagePage(
                                              context: context,
                                            );
                                          } else {
                                            context.read<CartBloc>().add(
                                                  CartEvent.upsertCart(
                                                    priceAggregate:
                                                        PriceAggregate.empty()
                                                            .copyWith(
                                                      materialInfo: state
                                                          .productDetailAggregate
                                                          .materialInfo,
                                                      price: price,
                                                      salesOrgConfig: context
                                                          .read<SalesOrgBloc>()
                                                          .state
                                                          .configs,
                                                    ),
                                                    quantity: stateCart
                                                            .getQuantityOfProduct(
                                                          productNumber: state
                                                              .productDetailAggregate
                                                              .materialInfo
                                                              .materialNumber,
                                                        ) +
                                                        int.parse(
                                                          _quantityEditingController
                                                              .text,
                                                        ),
                                                  ),
                                                );
                                          }
                                        } else {
                                          context.read<CartBloc>().add(
                                                CartEvent.upsertCart(
                                                  priceAggregate:
                                                      PriceAggregate.empty()
                                                          .copyWith(
                                                    materialInfo: state
                                                        .productDetailAggregate
                                                        .materialInfo,
                                                    price: price,
                                                    salesOrgConfig: context
                                                        .read<SalesOrgBloc>()
                                                        .state
                                                        .configs,
                                                  ),
                                                  quantity: stateCart
                                                          .getQuantityOfProduct(
                                                        productNumber: state
                                                            .productDetailAggregate
                                                            .materialInfo
                                                            .materialNumber,
                                                      ) +
                                                      int.parse(
                                                        _quantityEditingController
                                                            .text,
                                                      ),
                                                ),
                                              );
                                        }
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
              ],
            );
          },
        ),
      ),
    );
  }
}

void _showDEtailsPagePage({
  required BuildContext context,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    builder: (_) {
      return const AddToCartErrorSection();
    },
  );
}
