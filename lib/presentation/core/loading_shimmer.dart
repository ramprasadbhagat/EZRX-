import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer {
  static Widget withChild({
    required Widget child,
    bool enabled = true,
  }) {
    if (!enabled) return Center(child: child);

    return Center(
      child: Shimmer.fromColors(
        baseColor: ZPColors.lightGray,
        highlightColor: ZPColors.white,
        enabled: true,
        child: child,
      ),
    );
  }

  static Widget tile({
    bool enabled = true,
    int line = 1,
  }) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: ZPColors.lightGray,
        highlightColor: ZPColors.white,
        enabled: enabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.filled(
            line,
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
