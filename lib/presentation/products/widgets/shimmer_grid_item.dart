import 'package:ezrxmobile/presentation/core/loading_shimmer/material_loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:flutter/material.dart';

class LoadingShimmerGridItem extends StatelessWidget {
  const LoadingShimmerGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.7,
      crossAxisCount:
          Responsive.isLargerThan(context, Breakpoint.desktop) ? 4 : 2,
      children: List.generate(
        Responsive.isLargerThan(context, Breakpoint.desktop) ? 16 : 8,
        (index) {
          return const MaterialLoading();
        },
      ),
    );
  }
}
