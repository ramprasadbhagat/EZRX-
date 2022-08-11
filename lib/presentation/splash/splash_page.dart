import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.map(
          initial: (_) => _showLoadingDialog(context),
          loading: (_) => _showLoadingDialog(context),
          authenticated: (_) {
            // showSnackBar(context: context, message: 'Welcome back');
            context.router.replaceAll([
              const SplashPageRoute(),
              const HomeNavigationTabbarRoute(),
            ]);
          },
          unauthenticated: (_) {
            // final message = unauthenticated.failure?.map(
            //   other: (other) => other.message,
            //   serverError: (_) => 'Server Error',
            //   invalidEmailAndPasswordCombination: (_) =>
            //       'Wrong Username and/or Password!',
            //   accountLocked: (_) => 'Account is Locked',
            //   accountExpired: (_) => 'Account is Expired',
            //   tokenExpired: (_) => 'Session token is Expired',
            // );
            // if (message != null) {
            //   showSnackBar(context: context, message: message);
            // }
            context.router.replaceAll([
              const SplashPageRoute(),
              const HomeNavigationTabbarRoute(),
            ]);
          },
        );
      },
      child: const Scaffold(),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  key: Key('splashLoadingIndicator'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
