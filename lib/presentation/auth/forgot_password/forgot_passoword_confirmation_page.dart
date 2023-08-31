import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
part 'widgets/email_send_to_you.dart';

class ForgetPasswordConfirmationPage extends StatelessWidget {
  const ForgetPasswordConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: Column(
        children: <Widget>[
          const Logo(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const _EmailSendToYou(),
                SvgPicture.asset(
                  'assets/svg/reset_password_success_banner.svg',
                  height: Responsive.isMobile(context) ? 250 : 400,
                ),
                const SizedBox(height: 15),
                const BackToLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
