import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const ProductImage({
    Key? key,
    required this.imageUrl,
    this.height = 200,
    this.width = 100,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: WidgetKeys.productImage,
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) {
        return LoadingShimmer.withChild(
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
        );
      },
      errorWidget: (context, url, error) =>
          Container(
          color: ZPColors.extraLightGrey3,
          width: width,
          height: height,
            child: SvgPicture.asset(
            'assets/svg/product_default.svg',
            fit: BoxFit.contain,
          ),
          ),
    );
  }
}
