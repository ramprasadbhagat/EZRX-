import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:flutter/material.dart';

class LoadingShimmerGridItem extends StatelessWidget {
  const LoadingShimmerGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: List.generate(
        8,
        (index) => const MaterialLoading(),
      ),
    );
  }
}


