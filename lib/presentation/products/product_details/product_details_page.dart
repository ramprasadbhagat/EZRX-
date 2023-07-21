import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_details.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/similar_product.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/stock_info.dart';
import 'package:ezrxmobile/presentation/products/widgets/product_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<ProductDetailBloc, ProductDetailState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        child: ListView(
          controller: _scrollController,
          children: const [
            ProductDetailImage(),
            _BodyContent(),
            SimilarProduct(),
          ],
        ),
      ),
      bottomNavigationBar: const _Footer(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.materialInfo !=
          current.productDetailAggregate.materialInfo,
      builder: (context, state) {
        final materialNumber =
            state.productDetailAggregate.materialInfo.materialNumber;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materialNumber.displayMatNo,
                    key: WidgetKeys.materialDetailsMaterialNumber,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: ZPColors.darkGray),
                  ),
                  _Description(
                    materialInfo: state.productDetailAggregate.materialInfo,
                  ),
                  ProductStockInfo(
                    materialNumber: materialNumber,
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
            AvailableOffer(materialNumber: materialNumber),
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
        FavouriteIcon(
          key: WidgetKeys.materialDetailsFavouriteIcon,
          isFavourite: materialInfo.isFavourite,
          constraints: const BoxConstraints(),
          onTap: () => context.read<ProductDetailBloc>().add(
                materialInfo.isFavourite
                    ? ProductDetailEvent.deleteFavourite(
                        isForSimilarProduct: false,
                        materialNumber: materialInfo.materialNumber,
                      )
                    : ProductDetailEvent.addFavourite(
                        isForSimilarProduct: false,
                        materialNumber: materialInfo.materialNumber,
                      ),
              ),
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context)
            .viewInsets
            .copyWith(top: MediaQuery.of(context).size.height * 0.01),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CartItemQuantityInput(
                    key: WidgetKeys.materialDetailsQuantityInput,
                    addPressed: (value) {},
                    controller: _quantityEditingController,
                    isEnabled: true,
                    onFieldChange: (value) {},
                    onSubmit: (value) {},
                    quantityAddKey: const ValueKey('quantityAddKey'),
                    quantityDeleteKey: const ValueKey('quantityDeleteKey'),
                    quantityTextKey: const ValueKey('quantityTextKey'),
                    minusPressed: (value) {},
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                SizedBox(
                  key: WidgetKeys.materialDetailsAddToCartButton,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
                    builder: (context, stateDetail) {
                      return BlocConsumer<CartBloc, CartState>(
                        listenWhen: (previous, current) =>
                            previous.isUpserting != current.isUpserting,
                        listener: (context, state) {
                          state.apiFailureOrSuccessOption.fold(
                            () {
                              if (!state.isUpserting &&
                                  state.cartProducts.isNotEmpty &&
                                  context.router.current.path ==
                                      'orders/material_details') {
                                showTopSnackBar(
                                  context: context,
                                  message: 'Item has been added to cart'.tr(),
                                );
                              }
                            },
                            (either) => {},
                          );
                        },
                        builder: (context, stateCart) {
                          return ElevatedButton(
                            onPressed: stateCart.isUpserting
                                ? null
                                : () {
                                    context.read<CartBloc>().add(
                                          CartEvent.upsertCart(
                                            salesOrganisation: context
                                                .read<SalesOrgBloc>()
                                                .state
                                                .salesOrganisation,
                                            salesOrganisationConfigs: context
                                                .read<SalesOrgBloc>()
                                                .state
                                                .configs,
                                            customerCodeInfo: context
                                                .read<CustomerCodeBloc>()
                                                .state
                                                .customerCodeInfo,
                                            shipToInfo: context
                                                .read<CustomerCodeBloc>()
                                                .state
                                                .shipToInfo,
                                            priceAggregate:
                                                PriceAggregate.empty().copyWith(
                                              materialInfo: stateDetail
                                                  .productDetailAggregate
                                                  .materialInfo,
                                              price: context
                                                          .read<MaterialPriceBloc>()
                                                          .state
                                                          .materialPrice[
                                                      stateDetail
                                                          .productDetailAggregate
                                                          .materialInfo
                                                          .materialNumber] ??
                                                  Price.empty(),
                                            ),
                                            quantity:
                                                stateCart.getQuantityOfProduct(
                                                      productNumber: stateDetail
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
                                  },
                            child: LoadingShimmer.withChild(
                              enabled: stateCart.isUpserting,
                              child: const Text('Add To Cart').tr(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
