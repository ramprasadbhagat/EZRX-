import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class ProductDetailImage extends StatelessWidget {
  final bool isScrollAtInitialPosition;
  const ProductDetailImage({
    Key? key,
    required this.isScrollAtInitialPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BlocBuilder<ProductDetailBloc, ProductDetailState>(
              buildWhen: (previous, current) =>
                  previous.selectedImage != current.selectedImage,
              builder: (context, state) {
                return ProductImage(
                  imageUrl: state.selectedImage.getOrDefaultValue(''),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                );
              },
            ),
            isScrollAtInitialPosition
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        key: WidgetKeys.materialDetailsPageBack,
                        onPressed: () => Navigator.pop(context),
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ZPColors.darkGray,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_sharp,
                            size: 12,
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(16.0),
                        padding: const EdgeInsets.all(4),
                        key: WidgetKeys.materialDetailsPageCartIcon,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ZPColors.darkGray,
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: ZPColors.white,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            const Positioned(
              bottom: 10,
              right: 10,
              child: _ImageCounter(),
            ),
          ],
        ),
        const _ProductImages(),
      ],
    );
  }
}

class _ProductImages extends StatelessWidget {
  const _ProductImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.productImages !=
              current.productDetailAggregate.productImages ||
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .productImages
            .image;
        if (images.isEmpty) return const SizedBox.shrink();

        return Container(
          key: WidgetKeys.materialDetailsCarousel,
          margin: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.changeImage(index),
                    ),
                child: Container(
                  decoration: context
                              .read<ProductDetailBloc>()
                              .state
                              .selectedImageIndex ==
                          index
                      ? BoxDecoration(
                          border: Border.all(
                            color: ZPColors.secondaryMustard,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        )
                      : null,
                  child: ProductImage(
                    imageUrl: images.elementAt(index),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _ImageCounter extends StatelessWidget {
  const _ImageCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.productImages !=
              current.productDetailAggregate.productImages ||
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .productImages
            .image;

        if (images.isEmpty) return const SizedBox.shrink();

        return Container(
          key: WidgetKeys.materialDetailsImageCounter,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: ZPColors.lightGray2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: ZPColors.white),
              children: <TextSpan>[
                TextSpan(
                  text: '${state.selectedImageIndex + 1}',
                ),
                const TextSpan(
                  text: '/',
                ),
                TextSpan(
                  text: '${images.length}',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
