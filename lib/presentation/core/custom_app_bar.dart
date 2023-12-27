import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/home/selector/home_product_search_bar.dart';
import 'package:ezrxmobile/presentation/home/widgets/customer_blocked_banner.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool automaticallyImplyLeading;
  final bool isSearchBarVisible;
  final CustomerBlock customerBlocked;
  final Color backGroundColor;
  final Widget? leadingWidget;
  final double? leadingWidth;
  final bool centreTitle;
  final double appBarHeight;
  final double titleSpacing;
  final double? toolBarHeight;

  final List<Widget> actionWidget;
  final Widget? title;
  const CustomAppBar._({
    Key? key,
    required this.automaticallyImplyLeading,
    required this.isSearchBarVisible,
    required this.actionWidget,
    required this.backGroundColor,
    required this.centreTitle,
    required this.title,
    required this.customerBlocked,
    required this.appBarHeight,
    required this.titleSpacing,
    this.leadingWidget,
    this.leadingWidth,
    this.toolBarHeight,
  }) : super(key: key);

  factory CustomAppBar.homeTabAppBar({
    required Widget title,
    required CustomerBlock customerBlocked,
    required bool isSearchBarVisible,
    required List<Widget> actionWidget,
  }) =>
      CustomAppBar._(
        title: title,
        automaticallyImplyLeading: false,
        customerBlocked: customerBlocked,
        isSearchBarVisible: isSearchBarVisible,
        actionWidget: actionWidget,
        backGroundColor: ZPColors.primary,
        centreTitle: false,
        titleSpacing: 0,
        appBarHeight: isSearchBarVisible
            ? customerBlocked.homeAppBarHeight
            : customerBlocked.appBarHeight,
      );

  factory CustomAppBar.commonAppBar({
    Widget? title,
    required CustomerBlock customerBlocked,
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
        customerBlocked: customerBlocked,
        isSearchBarVisible: false,
        actionWidget: actionWidget,
        backGroundColor: backGroundColor,
        centreTitle: centreTitle,
        leadingWidget: leadingWidget,
        leadingWidth: leadingWidth,
        appBarHeight: customerBlocked.appBarHeight,
        key: key,
        titleSpacing: titleSpacing,
      );

  factory CustomAppBar.ordersTabAppBar({
    required Widget title,
    required CustomerBlock customerBlocked,
    Key? key,
  }) =>
      CustomAppBar._(
        title: title,
        automaticallyImplyLeading: false,
        customerBlocked: customerBlocked,
        isSearchBarVisible: false,
        actionWidget: const [],
        backGroundColor: ZPColors.primary,
        centreTitle: false,
        appBarHeight: customerBlocked.appBarHeight + 50.0,
        toolBarHeight: customerBlocked.appBarHeight + 50.0,
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
              HomeProductSearchBar(
                isCustomerBlocked: customerBlocked.isCustomerBlocked,
              ),
            const CustomerBlockedBanner(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
