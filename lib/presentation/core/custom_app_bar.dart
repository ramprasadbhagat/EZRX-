import 'package:ezrxmobile/presentation/home/selector/home_product_search_bar.dart';
import 'package:ezrxmobile/presentation/home/widgets/customer_blocked_banner.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool automaticallyImplyLeading;
  final bool isSearchBarVisible;
  final bool isCustomerBlocked;

  final List<Widget> actionWidget;
  final Widget title;
  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.isSearchBarVisible = false,
    this.isCustomerBlocked = false,
    this.actionWidget = const [],
    required this.title,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleSpacing: actionWidget.isNotEmpty ? 0 : 10,
      elevation: 0,
      backgroundColor: ZPColors.primary,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actionWidget,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Column(
          children: [
            if (isSearchBarVisible)
              HomeProductSearchBar(
                isCustomerBlocked: isCustomerBlocked,
              ),
            const CustomerBlockedBanner(),
          ],
        ),
      ),
    );
  }
}
