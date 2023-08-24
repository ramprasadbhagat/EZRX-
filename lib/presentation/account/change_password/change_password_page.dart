import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';

part './widgets/change_password_form.dart';
part './widgets/save_clear_changes_section.dart';
part './widgets/password_text_field.dart';
part './widgets/change_password_validation.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security').tr(),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            context
                .read<ResetPasswordBloc>()
                .add(const ResetPasswordEvent.clear());
            context.router.pop();
          },
        ),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            Text(
              'Change Password'.tr(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'We recommend you to change your password every 3 months'.tr(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.changePasswordRecommendationColor,
                    ),
              ),
            ),
            const _ChangePasswordForm(),
            const _ResetPasswordValidation(),
          ],
        ),
      ),
      bottomNavigationBar: const _SaveClearChangesSection(),
    );
  }
}
