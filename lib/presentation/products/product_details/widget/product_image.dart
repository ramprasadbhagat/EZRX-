import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage({
    Key? key,
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
                  fit: BoxFit.contain,
                  imageUrl: state.selectedImage.getOrDefaultValue(''),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                );
              },
            ),
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
          previous.productDetailAggregate.materialInfo.productImages !=
              current.productDetailAggregate.materialInfo.productImages ||
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .materialInfo
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
          previous.productDetailAggregate.materialInfo.productImages !=
              current.productDetailAggregate.materialInfo.productImages ||
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .materialInfo
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
