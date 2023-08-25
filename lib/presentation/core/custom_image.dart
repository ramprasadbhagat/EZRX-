import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final Widget? errorWidget;
  final Widget? placeholder;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  const CustomImage({
    Key? key,
    required this.imageUrl,
    this.height = 200,
    this.width = 100,
    this.fit = BoxFit.cover,
    this.errorWidget,
    this.imageBuilder,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _ErrorWidget(
        height: height,
        width: width,
      );
    }
    
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      imageBuilder: imageBuilder,
      placeholder: (context, url) =>
          placeholder ??
          LoadingShimmer.withChild(
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
      errorWidget: (context, url, error) =>
          errorWidget ??
          _ErrorWidget(
            height: height,
            width: width,
          ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final double height;
  final double width;
  const _ErrorWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: ZPColors.extraLightGrey3,
      ),
      width: width,
      height: height,
      child: SvgPicture.asset(
        SvgImage.defaultProductImage,
        fit: BoxFit.contain,
      ),
    );
  }
}
