import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/auth/login/login_mobile.dart';
import 'package:ezrxmobile/presentation/auth/login/login_web.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    context.read<LoginFormBloc>().add(
          const LoginFormEvent.loadLastSavedCred(),
        );
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: ZPColors.accentColor,
        toolbarHeight: 1,
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listenWhen: (previous, current) =>
              previous.authFailureOrSuccessOption !=
              current.authFailureOrSuccessOption,
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {
                  context.read<AuthBloc>().add(const AuthEvent.authCheck());
                },
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.showErrorMessages != current.showErrorMessages,
          builder: (context, state) {
            return Responsive(
              tablet: LoginWeb(
                key: WidgetKeys.loginWebScreen,
                usernameController: _usernameController,
                passwordController: _passwordController,
                state: state,
              ),
              mobile: LoginMobile(
                key: WidgetKeys.loginMobileScreen,
                usernameController: _usernameController,
                passwordController: _passwordController,
                state: state,
              ),
              web: LoginWeb(
                key: WidgetKeys.loginWebScreen,
                usernameController: _usernameController,
                passwordController: _passwordController,
                state: state,
              ),
            );
          },
        ),
      ),
    );
  }
}
