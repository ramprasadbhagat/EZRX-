import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final quickAccessItems = [
      _QuickAccessMenuData(
        key: 'webLogin',
        icon: 'web_login_menu.svg',
        label: 'Web login',
        onTap: () {},
      ),
      _QuickAccessMenuData(
        key: 'orders',
        icon: 'order_menu.svg',
        label: 'Orders',
        onTap: () => context.navigateTo(OrdersTabRoute()),
      ),
      _QuickAccessMenuData(
        key: 'returns',
        icon: 'return_menu.svg',
        label: 'Returns',
        onTap: () => context.navigateTo(const ReturnRootRoute()),
      ),
      _QuickAccessMenuData(
        key: 'payments',
        icon: 'payments_menu.svg',
        label: 'Payments',
        onTap: () => context.navigateTo(const PaymentsTabRoute()),
      ),
      _QuickAccessMenuData(
        key: 'loyalty',
        icon: 'loyalty_menu.svg',
        label: 'Loyalty',
        onTap: () => {},
      ),
      _QuickAccessMenuData(
        key: 'chatSupport',
        icon: 'chat_support_menu.svg',
        label: 'Chat Support',
        onTap: () =>
            context.read<ChatBotBloc>().add(const ChatBotEvent.startChatbot()),
      ),
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: kToolbarHeight * 1.4,
      margin: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
        top: 10.0,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: quickAccessItems.length,
        itemBuilder: (BuildContext context, int index) {
          return _QuickAccessMenu(
            quickAccessMenuData: quickAccessItems.elementAt(index),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: 10),
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
      key: WidgetKeys.homeQuickAccessMenu(
        quickAccessMenuData.key,
      ),
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
  final String key;
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
