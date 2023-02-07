import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSelector extends StatelessWidget {
  final String title;
  final Widget child;
  final Function()? onTap;
  final Locale? locale;

  const CustomSelector({
    Key? key,
    required this.title,
    required this.child,
    required this.onTap,
    this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: key,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: ZPColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.apply(color: ZPColors.lightGray),
                  locale: locale,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
