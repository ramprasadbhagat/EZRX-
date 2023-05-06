import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ezrxmobile/domain/auth/value/value_objects.dart';

class LoginOnBehalfPage extends StatelessWidget {
  const LoginOnBehalfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return Scaffold(
      key: const Key('loginOnBehalfPage'),
      appBar: AppBar(title: const Text('Login on behalf').tr()),
      body: BlocConsumer<ProxyLoginFormBloc, ProxyLoginFormState>(
        listenWhen: (previous, current) =>
            previous.authFailureOrSuccessOption !=
            current.authFailureOrSuccessOption,
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final failureMessage = failure.failureMessage;
                showSnackBar(context: context, message: failureMessage.tr());
              },
              (_) {
                context.read<AnnouncementBloc>().add(
                      const AnnouncementEvent.getAnnouncement(),
                    );
                context
                    .read<SalesOrgBloc>()
                    .add(const SalesOrgEvent.initialized());
                context
                    .read<EligibilityBloc>()
                    .add(const EligibilityEvent.initialized());
                context
                    .read<MaterialListBloc>()
                    .add(const MaterialListEvent.initialized());
                context.read<UserBloc>().add(const UserEvent.fetch());
                context.router.pop();
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    Logo(),
                    Spacer(),
                    UsernameField(),
                    SizedBox(height: 15),
                    LoginButton(),
                    Spacer(flex: 3),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/ezrxlogo.svg',
      height: 80,
      fit: BoxFit.scaleDown,
    );
  }
}

class UsernameField extends StatefulWidget {
  const UsernameField({Key? key}) : super(key: key);

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    context.read<ProxyLoginFormBloc>().add(
          const ProxyLoginFormEvent.initialized(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return TextFormField(
          key: const Key('proxyLoginUsernameField'),
          controller: _usernameController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Username'.tr()),
          onChanged: (value) => context.read<ProxyLoginFormBloc>().add(
                ProxyLoginFormEvent.usernameChanged(value),
              ),
          validator: (text) => Username(text!).value.fold(
                (f) => f.maybeMap(
                  empty: (_) => 'Username cannot be empty.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
          onFieldSubmitted: (value) {
            if (!state.isSubmitting) {
              FocusScope.of(context).unfocus();
              context.read<ProxyLoginFormBloc>().add(
                    ProxyLoginFormEvent.loginWithADButtonPressed(
                      context.read<UserBloc>().state.user,
                    ),
                  );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProxyLoginFormBloc, ProxyLoginFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: const Key('proxyLoginSubmitButton'),
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ProxyLoginFormBloc>().add(
                        ProxyLoginFormEvent.loginWithADButtonPressed(
                          context.read<UserBloc>().state.user,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: const Text('Login').tr(),
          ),
        );
      },
    );
  }
}
