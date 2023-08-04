import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: After Dipankar's PR [https://zuelligpharma.atlassian.net/browse/EZRX-8464]
//is merged need to convert this class to stateless widget and remove the
// controller from TextField used

class LoginOnBehalfSheet extends StatefulWidget {
  const LoginOnBehalfSheet({Key? key}) : super(key: key);

  @override
  State<LoginOnBehalfSheet> createState() => _LoginOnBehalfSheetState();
}

class _LoginOnBehalfSheetState extends State<LoginOnBehalfSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProxyLoginFormBloc, ProxyLoginFormState>(
      listenWhen: (previous, current) =>
          previous.authFailureOrSuccessOption !=
          current.authFailureOrSuccessOption,
      listener: (context, state) => state.authFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            CustomSnackBar(
              icon: const Icon(
                Icons.info,
                color: ZPColors.error,
              ),
              backgroundColor: ZPColors.errorSnackBarColor,
              messageText: failure.failureMessage,
            ).show(context);
          },
          (_) {
            context.read<SalesOrgBloc>().add(const SalesOrgEvent.initialized());
            context
                .read<EligibilityBloc>()
                .add(const EligibilityEvent.initialized());
            context
                .read<MaterialListBloc>()
                .add(const MaterialListEvent.initialized());
            context.read<UserBloc>().add(const UserEvent.fetch());
            context.router.popForced();
            CustomSnackBar(
              messageText:
                  '${'Logged in on behalf of'.tr()} ${state.username.getOrDefaultValue('')}.',
            ).show(context);
          },
        ),
      ),
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Form(
          key: WidgetKeys.proxyLoginSheet,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login On Behalf'.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.proxyLoginUserNameField,
                  labelText: 'Username'.tr(),
                  controller: _controller,
                  validator: (value) => Username(value ?? '').value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Username cannot be empty.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                  onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
                        ProxyLoginFormEvent.usernameChanged(value),
                      ),
                  decoration: const InputDecoration(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const _LoginOnBehalfButtons(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _LoginOnBehalfButtons extends StatelessWidget {
  const _LoginOnBehalfButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Row(
          key: WidgetKeys.proxyLoginButton,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text('Cancel'.tr()),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (state.isSubmitting) return;
                  FocusScope.of(context).unfocus();
                  context.read<ProxyLoginFormBloc>().add(
                        ProxyLoginFormEvent.loginWithADButtonPressed(
                          user: context.read<UserBloc>().state.user,
                          salesOrg: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation
                              .salesOrg,
                        ),
                      );
                },
                child: Text('Login'.tr()),
              ),
            ),
          ],
        );
      },
    );
  }
}
