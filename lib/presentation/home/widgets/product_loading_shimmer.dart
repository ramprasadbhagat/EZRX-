import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:flutter/material.dart';

class ProductLoadingShimmer extends StatelessWidget {
  const ProductLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        4,
        (index) => const MaterialLoading(),
      ),
    );
  }
}
