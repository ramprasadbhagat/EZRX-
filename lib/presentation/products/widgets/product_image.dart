import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
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
                  materialNumber:
                      state.productDetailAggregate.materialInfo.materialNumber,
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
            BlocBuilder<ProductDetailBloc, ProductDetailState>(
              buildWhen: (previous, current) =>
                  previous.productDetailAggregate !=
                      current.productDetailAggregate &&
                  current.productDetailAggregate !=
                      ProductDetailAggregate.empty(),
              builder: (context, state) {
                final productDetailAggregate = state.productDetailAggregate;

                return productDetailAggregate
                        .materialInfo.bundle.materials.isNotEmpty
                    ? Positioned(
                        bottom: 10,
                        left: 10,
                        right: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productDetailAggregate
                                  .materialInfo.materialNumber.displayMatNo,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: ZPColors.darkGray),
                            ),
                            Text(
                              productDetailAggregate.materialInfo.manufactured,
                              style: Theme.of(context).textTheme.labelSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink();
              },
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
          previous.productDetailAggregate.materialInfo.images !=
              current.productDetailAggregate.materialInfo.images ||
          previous.selectedImage != current.selectedImage,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .materialInfo
            .images;

        if (images.isEmpty) return const SizedBox.shrink();

        return Container(
          key: WidgetKeys.materialDetailsCarousel,
          margin: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              final isSelected =
                  context.read<ProductDetailBloc>().state.selectedImageIndex ==
                      index;

              return GestureDetector(
                onTap: () => context.read<ProductDetailBloc>().add(
                      ProductDetailEvent.changeImage(index),
                    ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? ZPColors.secondaryMustard
                          : ZPColors.extraLightGrey3,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: ProductImage(
                    materialNumber: state
                        .productDetailAggregate.materialInfo.materialNumber,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: Responsive.isLargerThan(context, Breakpoint.desktop)
                        ? MediaQuery.of(context).size.width * 0.08
                        : MediaQuery.of(context).size.width * 0.1,
                    fit: BoxFit.fill,
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
          previous.productDetailAggregate.materialInfo.images !=
              current.productDetailAggregate.materialInfo.images ||
          previous.selectedImageIndex != current.selectedImageIndex,
      builder: (context, state) {
        final images = context
            .read<ProductDetailBloc>()
            .state
            .productDetailAggregate
            .materialInfo
            .images;

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
