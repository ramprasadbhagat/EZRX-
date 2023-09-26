import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';

part 'package:ezrxmobile/presentation/auth/forgot_password/widgets/email_send_to_you.dart';

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
      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.resetPasswordFailureOrSuccessOption !=
            current.resetPasswordFailureOrSuccessOption,
        listener: (context, state) {
          state.resetPasswordFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => CustomSnackBar(
                icon: const Icon(
                  Icons.cancel,
                  color: ZPColors.error,
                ),
                backgroundColor: ZPColors.errorSnackBarColor,
                messageText: failure.failureMessage,
              ).show(context),
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        builder: (context, state) {
          return state.isSubmitting
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : Column(
                  children: <Widget>[
                    const Logo(
                      title: 'Forgot password',
                    ),
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
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: context.tr('Didn’t receive an email?'),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: ZPColors.shadesBlack,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: context.tr(' '),
                                  ),
                                  TextSpan(
                                    text: context.tr('Resend Email'),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: ZPColors.extraDarkGreen,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context
                                          .read<ForgotPasswordBloc>()
                                          .add(
                                            ForgotPasswordEvent
                                                .requestPasswordReset(
                                              context.locale,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const BackToLogin(),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
