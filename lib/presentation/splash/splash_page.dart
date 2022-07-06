import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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
            initial: (_) {},
            authenticated: (_) {
              // showSnackBar(context: context, message: 'Welcome back');
              context.router.replaceAll([
                const SplashPageRoute(),
                const HomeNavigationTabbarRoute(),
              ]);
            },
            unauthenticated: (_) {
              // showSnackBar(context: context, message: 'Please login');
              context.router.replaceAll([
                const SplashPageRoute(),
                const LoginPageRoute(),
              ]);
            });
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
