import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/color_container.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

part 'package:ezrxmobile/presentation/core/customer_blocked_banner.dart';
part 'package:ezrxmobile/presentation/core/home_product_search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool isSearchBarVisible;
  final bool customerBlockedOrSuspended;
  final Color backGroundColor;
  final Widget? leadingWidget;
  final double? leadingWidth;
  final bool centreTitle;
  final double appBarHeight;
  final double titleSpacing;
  final double? toolBarHeight;
  final Color? boxShadowColor;

  final List<Widget> actionWidget;
  final Widget? title;
  const CustomAppBar._({
    super.key,
    required this.automaticallyImplyLeading,
    required this.isSearchBarVisible,
    required this.actionWidget,
    required this.backGroundColor,
    required this.centreTitle,
    required this.title,
    required this.customerBlockedOrSuspended,
    required this.appBarHeight,
    required this.titleSpacing,
    this.leadingWidget,
    this.leadingWidth,
    this.toolBarHeight,
    this.boxShadowColor,
  });

  factory CustomAppBar.homeTabAppBar({
    required Widget title,
    required bool customerBlockedOrSuspended,
    required bool isSearchBarVisible,
    required List<Widget> actionWidget,
    required Color boxShadowColor,
  }) =>
      CustomAppBar._(
        title: title,
        automaticallyImplyLeading: false,
        customerBlockedOrSuspended: customerBlockedOrSuspended,
        isSearchBarVisible: isSearchBarVisible,
        actionWidget: actionWidget,
        backGroundColor: ZPColors.primary,
        centreTitle: false,
        titleSpacing: 0,
        appBarHeight: customerBlockedOrSuspended ? 195.0 : 121.0,
        boxShadowColor: boxShadowColor,
      );

  factory CustomAppBar.commonAppBar({
    Widget? title,
    required bool customerBlockedOrSuspended,
    bool automaticallyImplyLeading = true,
    bool centreTitle = false,
    List<Widget> actionWidget = const [],
    Color backGroundColor = ZPColors.white,
    Widget? leadingWidget,
    double? leadingWidth,
    double titleSpacing = 10,
    Key? key,
  }) =>
      CustomAppBar._(
        title: title,
        automaticallyImplyLeading: automaticallyImplyLeading,
        customerBlockedOrSuspended: customerBlockedOrSuspended,
        isSearchBarVisible: false,
        actionWidget: actionWidget,
        backGroundColor: backGroundColor,
        centreTitle: centreTitle,
        leadingWidget: leadingWidget,
        leadingWidth: leadingWidth,
        appBarHeight: customerBlockedOrSuspended ? 140.0 : 56.0,
        key: key,
        titleSpacing: titleSpacing,
      );

  factory CustomAppBar.ordersTabAppBar({
    required Widget title,
    required bool customerBlockedOrSuspended,
    Key? key,
  }) =>
      CustomAppBar._(
        title: title,
        automaticallyImplyLeading: false,
        customerBlockedOrSuspended: customerBlockedOrSuspended,
        isSearchBarVisible: false,
        actionWidget: const [],
        backGroundColor: ZPColors.primary,
        centreTitle: false,
        appBarHeight: (customerBlockedOrSuspended ? 140.0 : 56.0) + 50.0,
        toolBarHeight: (customerBlockedOrSuspended ? 140.0 : 56.0) + 50.0,
        key: key,
        titleSpacing: 0,
      );

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: centreTitle,
      titleSpacing: titleSpacing,
      toolbarHeight: toolBarHeight,
      leadingWidth: leadingWidth,
      backgroundColor: backGroundColor,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actionWidget,
      leading: leadingWidget,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Column(
          children: [
            if (isSearchBarVisible)
              _HomeProductSearchBar(
                isCustomerBlocked: customerBlockedOrSuspended,
                boxShadowColor: boxShadowColor,
              ),
            _CustomerBlockedBanner(
              isCustomerBlocked: customerBlockedOrSuspended,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
