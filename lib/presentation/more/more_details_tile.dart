import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoreDetailsTile {
  final Icon icon;
  final String label;
  //TODO: remove nullable once all methods implemented
  final void Function()? onTap;

  const MoreDetailsTile({
    required this.icon,
    required this.label,
    this.onTap,
  });

  factory MoreDetailsTile.faq() => const MoreDetailsTile(
        icon: Icon(
          Icons.contact_support_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'FAQ',
      );

  factory MoreDetailsTile.userGuide() => const MoreDetailsTile(
        icon: Icon(
          Icons
              .menu_book_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'User guide',
      );

  factory MoreDetailsTile.aboutUs() => const MoreDetailsTile(
        icon: Icon(
          Icons.error_outline_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'About us',
      );

  factory MoreDetailsTile.chatSupport(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.support_agent_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Chat support',
        onTap: () => context.read<ChatBotBloc>().add(
              const ChatBotEvent.startChatbot(),
            ),
      );

  factory MoreDetailsTile.termsOfUse(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons
              .feed_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'Terms of use',
        onTap: () => context.navigateTo(
          StaticHtmlViewerRoute(
            title: 'Terms of Use',
            htmlPath: locator<Config>().staticTermsOfUseFile,
            styleCss: locator<Config>().staticStyleCss,
          ),
        ),
      );

  factory MoreDetailsTile.privacyPolicy(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons
              .policy_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'Privacy policy',
        onTap: () => context.navigateTo(
          StaticHtmlViewerRoute(
            title: 'Privacy policy',
            htmlPath: locator<Config>().staticPrivacyPolicyFile,
            styleCss: locator<Config>().staticStyleCss,
          ),
        ),
      );

  factory MoreDetailsTile.orderTab(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.receipt_long_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Orders',
        onTap: () => context.navigateTo(
          OrdersTabRoute(),
        ),
      );

  factory MoreDetailsTile.returnsTab(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons
              .assignment_return_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'Returns',
        onTap: () => context.navigateTo(
          const ReturnRootRoute(),
        ),
      );

  factory MoreDetailsTile.paymentsTab(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.volunteer_activism_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Payments',
        onTap: () => context.navigateTo(const PaymentsTabRoute()),
      );

  factory MoreDetailsTile.loyaltyTab() => const MoreDetailsTile(
        icon: Icon(
          Icons
              .discount_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'Loyalty',
      );

  factory MoreDetailsTile.webLoginTab() => const MoreDetailsTile(
        icon: Icon(
          Icons
              .center_focus_weak_outlined, //TODO : will update it after Design Them update the Figma
          color: ZPColors.greenIconColor,
        ),
        label: 'Web Login',
      );

  factory MoreDetailsTile.account() => const MoreDetailsTile(
        icon: Icon(
          Icons.perm_identity_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Account',
      );

  factory MoreDetailsTile.security() => const MoreDetailsTile(
        icon: Icon(
          Icons.https_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Security',
      );

  factory MoreDetailsTile.notifications(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.notifications_none_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Notifications',
        onTap: () => context.navigateTo(
          const NotificationSettingsPageRoute(),
        ),
      );

  factory MoreDetailsTile.privacy() => const MoreDetailsTile(
        icon: Icon(
          Icons.security_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Privacy',
      );
}
