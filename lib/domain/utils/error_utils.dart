import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/reorder_confirmation_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

class ErrorUtils {
  static void handleApiFailure(BuildContext context, ApiFailure failure) {
    final isTokenExpiredFailure =
        failure == const ApiFailure.authenticationFailed();
    final message = context.tr(
      failure.failureMessage.message,
      namedArgs: failure.failureMessage.arguments,
    );
    CustomSnackBar(
      icon: const Icon(
        Icons.info,
        color: ZPColors.error,
      ),
      backgroundColor: ZPColors.errorSnackBarColor,
      messageText: message,
    ).show(context);
    if (isTokenExpiredFailure) {
      context.read<AuthBloc>().add(const AuthEvent.logout());
    }
  }

  static void handleReorderFailure(BuildContext context, ApiFailure failure) {
    const cartApiAddressFailure = ApiFailure.cartHasDifferentAddress();
    if (failure.failureMessage == cartApiAddressFailure.failureMessage) {
      showModalBottomSheet(
        context: context,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        builder: (_) {
          return ReOrderConfirmationBottomSheet(
            validOrderItems:
                context.read<ReOrderPermissionBloc>().state.validOrderItems,
          );
        },
      );
    } else {
      handleApiFailure(context, failure);
    }
  }
}
