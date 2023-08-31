part of 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';

class _ProductImageSection extends StatelessWidget {
  const _ProductImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate != current.productDetailAggregate ||
          previous.selectedImage != current.selectedImage,
      builder: (context, productDetailState) {
        return BlocBuilder<ProductImageBloc, ProductImageState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, productImageState) {
            final productImage = productImageState.getMaterialImage(
              productDetailState
                  .productDetailAggregate.materialInfo.materialNumber,
            );

            return Column(
              children: [
                Stack(
                  children: [
                    CustomImage(
                      key: WidgetKeys.productImage,
                      imageUrl: productImage.image.isNotEmpty
                          ? productImage.image
                              .elementAt(productDetailState.selectedImageIndex)
                          : '',
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: double.infinity,
                    ),
                    productImage.image.isNotEmpty
                        ? Positioned(
                            bottom: 10,
                            right: 10,
                            child: ImageCounter(
                              total: productImage.image.length,
                              selected:
                                  productDetailState.selectedImageIndex + 1,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                _ProductImages(
                  productImage: productImage,
                  selected: productDetailState.selectedImageIndex,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _ProductImages extends StatelessWidget {
  final ProductImages productImage;
  final int selected;
  const _ProductImages({
    Key? key,
    required this.productImage,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (productImage.image.isEmpty) return const SizedBox.shrink();

    return Container(
      key: WidgetKeys.materialDetailsCarousel,
      margin: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productImage.image.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.read<ProductDetailBloc>().add(
                  ProductDetailEvent.changeImage(index),
                ),
            child: Container(
              key: WidgetKeys.genericKey(
                key: 'selected$index${selected == index}',
              ),
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selected == index
                      ? ZPColors.secondaryMustard
                      : ZPColors.extraLightGrey3,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: CustomImage(
                key: WidgetKeys.materialDetailsCarouselImage,
                imageUrl: productImage.image.elementAt(index),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height * 0.05,
                width: Responsive.isLargerThan(context, Breakpoint.desktop)
                    ? MediaQuery.of(context).size.width * 0.08
                    : MediaQuery.of(context).size.width * 0.1,
              ),
            ),
          );
        },
      ),
    );
  }
}
