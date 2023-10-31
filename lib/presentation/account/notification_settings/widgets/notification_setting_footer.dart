part of 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';

class _NotificationSettingFooter extends StatelessWidget {
  const _NotificationSettingFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<NotificationSettingsBloc, NotificationSettingsState>(
        buildWhen: (previous, current) =>
            previous.currentNotificationSettings !=
                current.currentNotificationSettings ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: LoadingShimmer.withChild(
                    enabled: state.isLoading,
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        key: WidgetKeys.notificationSettingsClearButton,
                        onPressed: () => state.isLoading
                            ? null
                            : context.read<NotificationSettingsBloc>().add(
                                  const NotificationSettingsEvent.clear(),
                                ),
                        child: Text(
                          context.tr('Clear changes'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: LoadingShimmer.withChild(
                    enabled: state.isLoading,
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        key: WidgetKeys.notificationSettingsSubmitButton,
                        onPressed: (state.enableSubmit && !state.isLoading)
                            ? () =>
                                context.read<NotificationSettingsBloc>().add(
                                      const NotificationSettingsEvent.submit(),
                                    )
                            : null,
                        child: Text(
                          context.tr('Save'),
                          style: const TextStyle(
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
