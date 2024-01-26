import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/contact_us/contact_us_details_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/contact_number_text_field.dart';
part 'widgets/email_text_field.dart';
part 'widgets/message_text_field.dart';
part 'widgets/username_text_field.dart';
part 'widgets/send_message_button.dart';
part 'widgets/contact_us_form.dart';
part 'widgets/contact_details.dart';

class ContactUsPage extends StatelessWidget {
  final AppMarket appMarket;

  const ContactUsPage({
    Key? key,
    required this.appMarket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactUsBloc>(
          create: (context) => locator<ContactUsBloc>()
            ..add(ContactUsEvent.initialized(market: appMarket)),
        ),
        BlocProvider<ContactUsDetailsBloc>(
          create: (context) => locator<ContactUsDetailsBloc>()
            ..add(ContactUsDetailsEvent.fetch(market: appMarket)),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          title: Text(context.tr('Contact us')),
          customerBlocked:
              context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: ListView(
            key: WidgetKeys.scrollList,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            children: [
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                SvgImage.contactUs,
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              const _ContactDetails(
                key: WidgetKeys.contactDetailsKey,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const _ContactUsForm(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
