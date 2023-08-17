part of '../profile_page.dart';

class _Footer extends StatelessWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: ZPColors.boxShadowGray,
            ),
          ],
          color: ZPColors.white,
        ),
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user.preferredLanguage != current.user.preferredLanguage,
          listener: (context, state) => CustomSnackBar(
            messageText: 'Language changed successfully',
          ).show(context),
          buildWhen: (previous, current) =>
              previous.user.preferredLanguage != current.user.preferredLanguage,
          builder: (context, userState) {
            return BlocBuilder<LanguageBloc, LanguageState>(
              buildWhen: (previous, current) =>
                  previous.activeLanguage != current.activeLanguage,
              builder: (context, state) {
                final defaultLanguage = userState.user.defaultLanguage;

                return Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: defaultLanguage != state.activeLanguage
                            ? () => context.read<LanguageBloc>().add(
                                  LanguageEvent.changeLanguage(defaultLanguage),
                                )
                            : null,
                        child: Text('Clear changes'.tr()),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: defaultLanguage != state.activeLanguage
                            ? () => context.read<UserBloc>().add(
                                  UserEvent.updateLanguage(
                                    state.activeLanguage,
                                  ),
                                )
                            : null,
                        child: Text('Save'.tr()),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
