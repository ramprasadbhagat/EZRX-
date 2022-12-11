import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorUtils {
  static void handleApiFailure(BuildContext context, ApiFailure failure) {
    final isTokenExpiredFailure =
        failure == const ApiFailure.authenticationFailed();
    final failureMessage = failure.failureMessage;

    showSnackBar(
      context: context,
      message: failureMessage.tr(),
    );
    if (isTokenExpiredFailure) {
      context.read<AuthBloc>().add(const AuthEvent.logout());
    }
  }
}
