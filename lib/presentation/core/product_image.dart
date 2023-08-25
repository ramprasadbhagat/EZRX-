import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return CustomImage(
          key: WidgetKeys.productImage,
          imageUrl: state.getMaterialImageUrl(materialNumber),
          fit: fit,
          height: height,
          width: width,
        );
      },
    );
  }
}
