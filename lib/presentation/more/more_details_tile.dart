import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreDetailsTile {
  final Widget icon;
  final String label;
  final TextStyle? labelStyle;
  //TODO: remove nullable once all methods implemented
  final void Function()? onTap;

  const MoreDetailsTile({
    required this.icon,
    required this.label,
    this.labelStyle,
    this.onTap,
  });

  factory MoreDetailsTile.faq() => const MoreDetailsTile(
        icon: Icon(
          Icons.contact_support_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'FAQ',
      );

  factory MoreDetailsTile.userGuide() => const MoreDetailsTile(
        icon: Icon(
          Icons.chrome_reader_mode_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'User guide',
      );

  factory MoreDetailsTile.aboutUs() => const MoreDetailsTile(
        icon: Icon(
          Icons.info_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'About us',
      );

  factory MoreDetailsTile.chatSupport(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.forum_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Chat support',
        onTap: () => context.read<ChatBotBloc>().add(
              const ChatBotEvent.startChatbot(),
            ),
      );

  factory MoreDetailsTile.termsOfUse(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.description_outlined,
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
          Icons.privacy_tip_outlined,
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
  factory MoreDetailsTile.contactUs() => const MoreDetailsTile(
        icon: Icon(
          Icons.mail_outline,
          color: ZPColors.lightGray,
        ),
        label: 'Contact us',
      );

  factory MoreDetailsTile.orderTab(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.receipt_long_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Orders',
        onTap: () => context.navigateTo(
          const OrdersTabRoute(),
        ),
      );

  factory MoreDetailsTile.returnsTab(BuildContext context) => MoreDetailsTile(
        icon: SvgPicture.asset(
          'assets/svg/more_return.svg',
          height: 24,
          fit: BoxFit.fill,
        ),
        label: 'Returns',
        onTap: () => context.navigateTo(
          const ReturnRootRoute(),
        ),
      );

  factory MoreDetailsTile.paymentsTab(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.account_balance_wallet_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Payments',
        onTap: () => context.navigateTo(const PaymentPageRoute()),
      );

  factory MoreDetailsTile.loyaltyTab() => const MoreDetailsTile(
        icon: Icon(
          Icons.loyalty_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Loyalty',
      );

  factory MoreDetailsTile.webLoginTab() => const MoreDetailsTile(
        icon: Icon(
          Icons.qr_code_scanner,
          color: ZPColors.lightGray,
        ),
        label: 'Web Login',
      );

  factory MoreDetailsTile.announcementAndArticleTab(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.campaign_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Announcements & articles',
        labelStyle:
            Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontSize: 10, color: ZPColors.lightGray),
      );

  factory MoreDetailsTile.profile() => const MoreDetailsTile(
        icon: Icon(
          Icons.perm_identity_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Profile',
      );

  factory MoreDetailsTile.security() => const MoreDetailsTile(
        icon: Icon(
          Icons.https_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Security',
      );

  factory MoreDetailsTile.notifications() => const MoreDetailsTile(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Notifications',
        // onTap: () => context.navigateTo(
        //   const NotificationSettingsPageRoute(),
        // ),
      );

  factory MoreDetailsTile.privacy() => const MoreDetailsTile(
        icon: Icon(
          Icons.security_outlined,
          color: ZPColors.lightGray,
        ),
        label: 'Privacy',
      );
}
