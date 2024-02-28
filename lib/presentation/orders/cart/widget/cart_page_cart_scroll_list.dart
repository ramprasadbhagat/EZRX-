part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageCartScrollList extends StatelessWidget {
  const _CartPageCartScrollList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isFetching != current.isFetching ||
          previous.isUpserting != current.isUpserting ||
          previous.isBuyAgain != current.isBuyAgain,
      builder: (context, state) {
        if (state.isFetching && state.cartProducts.isEmpty ||
            state.isBuyAgain) {
          return LoadingShimmer.logo();
        }

        final zpMaterials = state.cartProducts.zpMaterialOnly.sortToDisplay;
        final mpMaterials = state.cartProducts.mpMaterialOnly.sortToDisplay;

        return RefreshIndicator(
          onRefresh: () async => context.read<CartBloc>().add(
                const CartEvent.fetchProductsAddedToCart(),
              ),
          child: CustomScrollView(
            key: WidgetKeys.scrollList,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: state.cartProducts.isEmpty
                ? [SliverToBoxAdapter(child: NoRecordFound.cart(context))]
                : [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final item = zpMaterials[index];

                          return _CartPageScrollListItem(
                            item: item,
                            showManufacturerName:
                                zpMaterials.showManufacturerName(index),
                          );
                        },
                        childCount: zpMaterials.length,
                      ),
                    ),
                    if ([...mpMaterials, ...zpMaterials].isNotEmpty)
                      SliverToBoxAdapter(
                        child: Container(
                          height: 10,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final item = mpMaterials[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (index == 0) const _MarketPlaceLabel(),
                              _CartPageScrollListItem(
                                item: item,
                                showManufacturerName:
                                    mpMaterials.showManufacturerName(index),
                              ),
                            ],
                          );
                        },
                        childCount: mpMaterials.length,
                      ),
                    ),
                  ],
          ),
        );
      },
    );
  }
}

class _MarketPlaceLabel extends StatelessWidget {
  const _MarketPlaceLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      color: Colors.white,
      child: Row(
        children: [
          SvgPicture.asset(
            SvgImage.marketplaceIcon,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 2),
          Text(
            context.tr('Marketplace'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
