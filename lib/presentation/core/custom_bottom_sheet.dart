import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Key sheetKey;
  final String headerText;
  final Widget child;
  const CustomBottomSheet({
    Key? key,
    required this.sheetKey,
    required this.headerText,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        key: sheetKey,
        children: <Widget>[
          AppBar(
            title: Text(
              context.tr(headerText),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.primary,
                  ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                key: WidgetKeys.closeButton,
                onPressed: () => context.router.pop(),
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.primary,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
