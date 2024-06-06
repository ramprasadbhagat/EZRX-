import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/password_text_field.dart';
import 'package:ezrxmobile/presentation/core/password_validation.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

part 'package:ezrxmobile/presentation/auth/reset_password/widgets/reset_password_button.dart';
part 'package:ezrxmobile/presentation/auth/reset_password/widgets/reset_password_form.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          children: <Widget>[
            const Logo(
              title: 'Reset password',
            ),
            const _ResetPasswordForm(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: PasswordValidation(
                user: context
                    .read<ResetPasswordBloc>()
                    .state
                    .resetPasswordCred
                    .toUser,
              ),
            ),
            const SizedBox(height: 20),
            const _ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}
