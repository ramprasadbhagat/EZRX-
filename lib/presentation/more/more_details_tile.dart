import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/application/account/notification_settings/notification_settings_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreDetailsTile {
  final Key? key;
  final Widget icon;
  final String label;
  final void Function() onTap;

  const MoreDetailsTile({
    this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  factory MoreDetailsTile.faq(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.contact_support_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'FAQ',
        onTap: () => context.navigateTo(
          const FAQPageRoute(),
        ),
      );

  factory MoreDetailsTile.aboutUs(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.info_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'About us',
        onTap: () => context.navigateTo(const AboutUsPageRoute()),
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
            htmlPath: context.read<EligibilityBloc>().state.user.tncStaticFile,
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
            htmlPath: context
                .read<EligibilityBloc>()
                .state
                .user
                .privacyPolicyStaticFile,
            styleCss: locator<Config>().staticStyleCss,
          ),
        ),
      );
  factory MoreDetailsTile.contactUs(BuildContext context) => MoreDetailsTile(
        icon: const Icon(
          Icons.mail_outline,
          color: ZPColors.greenIconColor,
          key: WidgetKeys.contactUsTile,
        ),
        onTap: () {
          context.read<ContactUsBloc>().add(const ContactUsEvent.initialized());
          context.navigateTo(
            const ContactUsPageRoute(),
          );
        },
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
        key: WidgetKeys.returnsTile,
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
        key: WidgetKeys.paymentsTile,
        icon: const Icon(
          Icons.account_balance_wallet_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Payments',
        onTap: () => context.navigateTo(const PaymentPageRoute()),
      );

  factory MoreDetailsTile.eZPointTab(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.eZPointTile,
        icon: const Icon(
          Icons.emoji_events_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'eZPoint',
        onTap: () {
          context.read<EZPointBloc>().add(
                EZPointEvent.fetch(
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                ),
              );
          context.router.push(
            const EZPointWebviewPageRoute(),
          );
        },
      );

  factory MoreDetailsTile.announcementAndArticleTab(BuildContext context) =>
      MoreDetailsTile(
        key: WidgetKeys.announcementArticleTile,
        icon: const Icon(
          Icons.campaign_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Announcements & articles',
        onTap: () => context.navigateTo(const AnnouncementsPageRoute()),
      );

  factory MoreDetailsTile.profile(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.profileTile,
        icon: const Icon(
          Icons.perm_identity_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Profile',
        onTap: () {
          context.read<CustomerLicenseBloc>().add(
                CustomerLicenseEvent.fetch(
                  customerInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                  salesOrganisation:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  user: context.read<EligibilityBloc>().state.user,
                ),
              );
          context.read<UserBloc>().add(
                UserEvent.selectLanguage(
                  context.read<UserBloc>().state.user.preferredLanguage,
                ),
              );
          context.navigateTo(
            const ProfilePageRoute(),
          );
        },
      );

  factory MoreDetailsTile.security(BuildContext context) => MoreDetailsTile(
        key: WidgetKeys.securityTile,
        icon: const Icon(
          Icons.https_outlined,
          color: ZPColors.greenIconColor,
        ),
        label: 'Security',
        onTap: () => context.navigateTo(const ChangePasswordPageRoute()),
      );

  factory MoreDetailsTile.notifications(BuildContext context) =>
      MoreDetailsTile(
        icon: const Icon(
          Icons.notifications_none_outlined,
          color: ZPColors.greenIconColor,
        ),
        key: WidgetKeys.notificationTile,
        label: 'Notifications',
        onTap: () {
          context.read<NotificationSettingsBloc>().add(
                const NotificationSettingsEvent.fetch(),
              );
          context.navigateTo(const NotificationSettingsPageRoute());
        },
      );
}
