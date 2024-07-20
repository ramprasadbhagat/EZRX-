part of 'package:ezrxmobile/presentation/more/more_tab.dart';

class LoginOnBehalf extends StatelessWidget {
  const LoginOnBehalf({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) =>
          previous.userFailureOrSuccessOption !=
          current.userFailureOrSuccessOption,
      listener: (context, state) => {
        state.userFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
              if (context.mounted) {
                context.read<AuthBloc>().add(
                      const AuthEvent.logout(),
                    );
              }
            },
            (_) {},
          ),
        ),
      },
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return state.userCanLoginOnBehalf
            ? ListTile(
                key: WidgetKeys.loginOnBehalfButtonKey,
                visualDensity: VisualDensity.compact,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: padding12),
                minVerticalPadding: 0,
                dense: true,
                leading: const Icon(
                  Icons.login_outlined,
                  color: ZPColors.gradient,
                ),
                onTap: () {
                  context
                      .read<ProxyLoginFormBloc>()
                      .add(const ProxyLoginFormEvent.initialized());
                  showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    context: context,
                    builder: (_) {
                      return const LoginOnBehalfSheet();
                    },
                  );
                },
                title: Text(
                  context.tr(
                    'Log in on behalf',
                  ),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ZPColors.gradient,
                      ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
