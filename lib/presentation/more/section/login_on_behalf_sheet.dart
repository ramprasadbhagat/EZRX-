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
import 'package:flutter/services.dart';
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
            context.read<UserBloc>().add(
                  const UserEvent.fetch(
                    isLoginOnBehalf: true,
                  ),
                );
            context.router.popForced();
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
                  'Log in on behalf'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: ZPColors.primary),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.proxyLoginUserNameField,
                  mandatory: true,
                  labelText: 'Username'.tr(),
                  controller: _controller,
                  isEnabled: !state.isSubmitting,
                  inputFormatters: [
                    TextInputFormatter.withFunction(
                      (oldValue, newValue) => TextEditingValue(
                        text: newValue.text.toLowerCase(),
                        selection: newValue.selection,
                      ),
                    ),
                  ],
                  onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
                        ProxyLoginFormEvent.usernameChanged(value),
                      ),
                  validator: (value) => Username(value ?? '').value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Username cannot be empty.'.tr(),
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                  decoration: InputDecoration(
                    hintText: 'Enter username'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    _CancelButton(),
                    SizedBox(
                      width: 10,
                    ),
                    _LoginButton(),
                  ],
                ),
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

class _CancelButton extends StatelessWidget {
  const _CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          context.router.pop();
        },
        child: Text('Cancel'.tr()),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return Expanded(
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
        );
      },
    );
  }
}
