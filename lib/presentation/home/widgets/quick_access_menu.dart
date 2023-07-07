import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickAccessMenuPanel extends StatelessWidget {
  const QuickAccessMenuPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quickAccessItems = _getQuickAccessItems(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 1.58,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 5,
        ),
        scrollDirection: Axis.horizontal,
        children: quickAccessItems.map((quickAccessItem) {
          return _QuickAccessMenu(
            quickAccessMenuData: quickAccessItem,
          );
        }).toList(),
      ),
    );
  }
}

class _QuickAccessMenu extends StatelessWidget {
  final _QuickAccessMenuData quickAccessMenuData;
  const _QuickAccessMenu({
    Key? key,
    required this.quickAccessMenuData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: quickAccessMenuData.key,
      onTap: quickAccessMenuData.onTap,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomCard(
              margin: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 5.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: kToolbarHeight * 0.5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  quickAccessMenuData.label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                ).tr(),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/svg/${quickAccessMenuData.icon}',
            height: kToolbarHeight * 0.75,
          ),
        ],
      ),
    );
  }
}

class _QuickAccessMenuData {
  final Key key;
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _QuickAccessMenuData({
    required this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

List<_QuickAccessMenuData> _getQuickAccessItems(BuildContext context) {
  // final homeQuickAccessWebLoginMenu = _QuickAccessMenuData(
  //   key: WidgetKeys.homeQuickAccessWebLoginMenu,
  //   icon: 'web_login_menu.svg',
  //   label: 'Web login',
  //   onTap: () {},
  // );
  final homeQuickAccessOrdersMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessOrdersMenu,
    icon: 'order_menu.svg',
    label: 'Orders',
    onTap: () => context.navigateTo(OrdersTabRoute()),
  );

  final homeQuickAccessReturnsMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessReturnsMenu,
    icon: 'return_menu.svg',
    label: 'Returns',
    onTap: () => context.navigateTo(const ReturnRootRoute()),
  );

  final homeQuickAccessPaymentsMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessPaymentsMenu,
    icon: 'payments_menu.svg',
    label: 'Payments',
    onTap: () => context.navigateTo(const PaymentsTabRoute()),
  );

  // final homeQuickAccessLoyaltyMenu = _QuickAccessMenuData(
  //   key: WidgetKeys.homeQuickAccessLoyaltyMenu,
  //   icon: 'loyalty_menu.svg',
  //   label: 'Loyalty',
  //   onTap: () => {},
  // );

  final homeQuickAccessChatSupportMenu = _QuickAccessMenuData(
    key: WidgetKeys.homeQuickAccessChatSupportMenu,
    icon: 'chat_support_menu.svg',
    label: 'Chat Support',
    onTap: () =>
        context.read<ChatBotBloc>().add(const ChatBotEvent.startChatbot()),
  );

  return context.read<UserBloc>().state.user.userCanAccessOrderHistory
      ? [
          // homeQuickAccessWebLoginMenu,
          homeQuickAccessOrdersMenu,
          homeQuickAccessReturnsMenu,
          homeQuickAccessPaymentsMenu,
          // homeQuickAccessLoyaltyMenu,
          homeQuickAccessChatSupportMenu,
        ]
      : [
          // homeQuickAccessWebLoginMenu,
          homeQuickAccessReturnsMenu,
          homeQuickAccessPaymentsMenu,
          // homeQuickAccessLoyaltyMenu,
          homeQuickAccessChatSupportMenu,
        ];
}
