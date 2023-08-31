part of 'package:ezrxmobile/presentation/more/more_tab.dart';

class LoginOnBehalf extends StatelessWidget {
  const LoginOnBehalf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return state.userCanLoginOnBehalf
            ? TextButton.icon(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.login_outlined,
                    color: ZPColors.gradient,
                  ),
                ),
                label: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // to align the icon to left
                  children: [
                    Text(
                      'Log in on behalf',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: ZPColors.gradient,
                          ),
                    ).tr(),
                  ],
                ),
                onPressed: () {
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
              )
            : const SizedBox.shrink();
      },
    );
  }
}
