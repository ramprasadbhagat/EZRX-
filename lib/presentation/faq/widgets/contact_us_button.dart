import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/contact_us/contact_us_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(30, 45),
      ),
      onPressed: () {
        context.read<ContactUsBloc>().add(const ContactUsEvent.initialized());
        context.navigateTo(
          const ContactUsPageRoute(),
        );
      },
      child: Text(
        context.tr('Contact us'),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}
