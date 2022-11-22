import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:flutter/material.dart';

class TextButtonShimmer extends StatelessWidget {
  const TextButtonShimmer({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return LoadingShimmer.withChild(
      child: TextButton(
        onPressed: () {},
        child: Text(
          title.tr(),
        ),
      ),
    );
  }
}
