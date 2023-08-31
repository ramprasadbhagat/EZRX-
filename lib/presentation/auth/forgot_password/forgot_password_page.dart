import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/forgot_password_error.dart';
part 'widgets/user_name_field.dart';
part 'widgets/forgot_password_button.dart';
part 'widgets/forgot_password_title.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

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
        children: [
          const Logo(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const _ForgetPasswordTitle(),
                const SizedBox(height: 25),
                const _ForgotPasswordError(),
                _UsernameField(
                  controller: TextEditingController(),
                ),
                const SizedBox(height: 25),
                const _ForgotPasswordButton(),
                const SizedBox(height: 15),
                const BackToLogin(),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
