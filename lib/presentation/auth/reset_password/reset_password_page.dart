import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/core/password_text_field.dart';
import 'package:ezrxmobile/presentation/core/password_validation.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/auth/reset_password/widgets/reset_password_button.dart';
part 'package:ezrxmobile/presentation/auth/reset_password/widgets/reset_password_form.dart';

class ResetPasswordPage extends StatelessWidget {
  final bool isFirstLogin;
  const ResetPasswordPage({super.key, this.isFirstLogin = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isFirstLogin
          ? _ResetPasswordPageBody.firstLogin(context: context)
          : _ResetPasswordPageBody.resetPassword(),
    );
  }
}

class _ResetPasswordPageBody extends StatelessWidget {
  final Widget logo;
  final Widget headingWidget;
  final Widget formWidget;
  final Widget resetPasswordButton;
  const _ResetPasswordPageBody({
    required this.logo,
    required this.headingWidget,
    required this.formWidget,
    required this.resetPasswordButton,
  });

  factory _ResetPasswordPageBody.firstLogin({required BuildContext context}) =>
      _ResetPasswordPageBody(
        logo: Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            SvgImage.ezrxPlusLogo,
            height: 40,
            width: 120,
            fit: BoxFit.scaleDown,
          ),
        ),
        headingWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Text(
            context.tr('Set a new password'),
            key: WidgetKeys.resetPasswordPageHeadingForFirstTimeLogin,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        formWidget: const _ResetPasswordForm(
          isFirstLogin: true,
        ),
        resetPasswordButton: const _ResetPasswordButton(
          isFirstLogin: true,
        ),
      );

  factory _ResetPasswordPageBody.resetPassword() =>
      const _ResetPasswordPageBody(
        logo: Logo(
          title: 'Reset password',
        ),
        headingWidget: SizedBox.shrink(),
        formWidget: _ResetPasswordForm(),
        resetPasswordButton: _ResetPasswordButton(),
      );

  @override
  Widget build(BuildContext context) {
    return AnnouncementBanner(
      currentPath: context.router.currentPath,
      child: ListView(
        children: <Widget>[
          logo,
          headingWidget,
          const _InlineErrorMessageSection(),
          formWidget,
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
          resetPasswordButton,
        ],
      ),
    );
  }
}

class _InlineErrorMessageSection extends StatelessWidget {
  const _InlineErrorMessageSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.showNewPasswordPatternMismatchError !=
          current.showNewPasswordPatternMismatchError,
      builder: (context, state) {
        return state.showNewPasswordPatternMismatchError
            ? Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
                child: Text(
                  context.tr(
                    'Please make sure your password follow below rules',
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ZPColors.red),
                  key: WidgetKeys.errorRequirementsFillAllField,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
