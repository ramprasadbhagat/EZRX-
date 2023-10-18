part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageCartScrollList extends StatelessWidget {
  const _CartPageCartScrollList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.cartProducts.length != current.cartProducts.length ||
          previous.isBuyAgain != current.isBuyAgain,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            if (!state.isFetching) {
              if (context.read<CartBloc>().state.cartProducts.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetchPriceCartProduct(
                        salesOrganisation: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrganisation,
                        salesConfigs: context
                            .read<EligibilityBloc>()
                            .state
                            .salesOrgConfigs,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipToInfo:
                            context.read<EligibilityBloc>().state.shipToInfo,
                        comboDealEligible: context
                            .read<EligibilityBloc>()
                            .state
                            .comboDealEligible,
                        products: context
                            .read<CartBloc>()
                            .state
                            .cartProducts
                            .where(
                              (element) =>
                                  element.materialInfo.type.typeMaterial,
                            )
                            .map((e) => e.materialInfo)
                            .toList(),
                      ),
                    );
              }
            }
          },
          (_) => {},
        );
      },
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isFetching != current.isFetching ||
          previous.isUpserting != current.isUpserting ||
          previous.isBuyAgain != current.isBuyAgain,
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: state.isFetching && state.cartProducts.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<PriceAggregate>(
                    noRecordFoundWidget: NoRecordFound(
                      title: 'Your cart is empty',
                      subTitle:
                          'Looks like you haven’t added anything to your cart yet.'
                              .tr(),
                      actionButton: ElevatedButton(
                        key: WidgetKeys.startBrowsingProducts,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                            double.maxFinite,
                            50,
                          ),
                        ),
                        onPressed: () {
                          context.router.navigateNamed('main/products');
                        },
                        child: const Text('Start browsing').tr(),
                      ),
                      svgImage: SvgImage.shoppingCart,
                    ),
                    controller: ScrollController(),
                    onRefresh: () => context.read<CartBloc>().add(
                          const CartEvent.fetchProductsAddedToCart(),
                        ),
                    isLoading: state.isFetching && state.cartProducts.isEmpty ||
                        state.isClearing ||
                        state.isBuyAgain,
                    itemBuilder: (context, index, item) {
                      return _CartPageScrollListItem(
                        item: item,
                        showManufacturerName: state.showManufacturerName(index),
                      );
                    },
                    items: state.cartProducts,
                  ),
          ),
        );
      },
    );
  }
}
