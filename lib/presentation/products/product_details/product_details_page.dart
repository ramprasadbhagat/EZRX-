import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/favorite_icon.dart';
import 'package:ezrxmobile/presentation/core/product_price_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_quantity_input.dart';
import 'package:ezrxmobile/presentation/products/available_offers/available_offer.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_description.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/material_info.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/product_image.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/similar_product.dart';
import 'package:ezrxmobile/presentation/products/product_details/widget/stock_info.dart';
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
      appBar: !_isScrollAtInitialPosition
          ? AppBar(
              elevation: 16,
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    key: WidgetKeys.materialDetailsPageBack,
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isScrollAtInitialPosition
                            ? ZPColors.darkGray
                            : ZPColors.white,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 12,
                        color: ZPColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  key: WidgetKeys.materialDetailsPageCartIcon,
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                    color: ZPColors.black,
                  ),
                ),
              ],
            )
          : null,
      floatingActionButton: !_isScrollAtInitialPosition
          ? SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
              width: MediaQuery.of(context).size.width * 0.05,
              child: FloatingActionButton(
                key: WidgetKeys.materialDetailsFloatingButton,
                onPressed: () => _scrollToTop(),
                mini: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: ZPColors.secondaryMustard,
                child: Icon(
                  Icons.expand_less,
                  size: MediaQuery.of(context).size.width * 0.04,
                  color: ZPColors.black,
                ),
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
        child: SafeArea(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            controller: _scrollController,
            children: [
              ProductDetailImage(
                isScrollAtInitialPosition: _isScrollAtInitialPosition,
              ),
              const _BodyContent(),
              const SimilarProduct(),
            ],
          ),
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
          previous.productDetailAggregate.productDetail !=
          current.productDetailAggregate.productDetail,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.productDetailAggregate.materialNumber.displayMatNo,
                    key: WidgetKeys.materialDetailsMaterialNumber,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: ZPColors.darkGray),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          state.productDetailAggregate.productDetail
                              .defaultMaterialDescription,
                          key: WidgetKeys.materialDetailsMaterialDescription,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                        ),
                      ),
                      FavouriteIcon(
                            key: WidgetKeys.materialDetailsFavouriteIcon,
                        materialInfo: state.productDetailAggregate.materialInfo,
                      ),
                    ],
                  ),
                  ProductStockInfo(
                    materialNumber: state.productDetailAggregate.materialNumber,
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
            AvailableOffer(
              materialNumber: context
                  .read<ProductDetailBloc>()
                  .state
                  .productDetailAggregate
                  .materialNumber,
            ),
            const MaterialInformation(),
            const MaterialDescription(),
            const Divider(
              endIndent: 0,
              indent: 0,
              thickness: 4,
              color: ZPColors.extraLightGrey3,
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: CartItemQuantityInput(
              key: WidgetKeys.materialDetailsQuantityInput,
              addPressed: (value) {},
              controller: TextEditingController(),
              isEnabled: true,
              onFieldChange: (value) {},
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
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add To Cart').tr(),
            ),
          ),
        ],
      ),
    );
  }
}
