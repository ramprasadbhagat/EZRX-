import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final List<Widget> actionWidget;
  final Widget child;
  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.actionWidget = const [],
    required this.child,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      // backgroundColor: ZPColors.primary,
      titleSpacing: actionWidget.isNotEmpty ? 0 : 10,
      automaticallyImplyLeading: automaticallyImplyLeading,
      // iconTheme: const IconThemeData(
      //   color: ZPColors.white,
      // ),
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: ZPColors.extraLightGray,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: child),
      ),
      actions: actionWidget,
    );
  }
}
