import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImage extends StatelessWidget {
  final MaterialNumber materialNumber;
  final double height;
  final double width;
  final BoxFit fit;
  final EdgeInsetsGeometry? errorWidgetPadding;
  final Color errorWidgetColor;

  const ProductImage({
    Key? key,
    required this.materialNumber,
    this.height = 200,
    this.width = 100,
    this.fit = BoxFit.cover,
    this.errorWidgetPadding,
    this.errorWidgetColor = ZPColors.extraLightGrey3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductImageBloc, ProductImageState>(
      buildWhen: (previous, current) =>
          previous.materialUrlMap != current.materialUrlMap,
      builder: (context, state) {
        return CachedNetworkImage(
          key: WidgetKeys.productImage,
          imageUrl: state.getMaterialImageUrl(materialNumber),
          fit: fit,
          height: height,
          width: width,
          placeholder: (context, url) => LoadingShimmer.withChild(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                ),
                color: ZPColors.white,
              ),
              width: width,
              height: height,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: errorWidgetColor,
            ),
            width: width,
            height: height,
            padding: errorWidgetPadding,
            child: SvgPicture.asset(
              'assets/svg/product_default.svg',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
