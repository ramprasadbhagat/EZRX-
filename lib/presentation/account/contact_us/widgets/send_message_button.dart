part of '../contact_us_page.dart';

class _SendMessageButton extends StatelessWidget {
  const _SendMessageButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, ContactUsState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) {
        return ElevatedButton(
          key: WidgetKeys.sendMessageButtonKey,
          onPressed: state.isSubmitting
              ? null
              : () {
                  FocusScope.of(context).unfocus();
                  context.read<ContactUsBloc>().add(
                        ContactUsEvent.submit(
                          clinicName: context
                              .read<CustomerCodeBloc>()
                              .state
                              .shipToInfo
                              .shipToName
                              .name1,
                          custCode: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          language: context
                              .read<UserBloc>()
                              .state
                              .user
                              .preferredLanguage
                              .languageCode,
                        ),
                      );
                },
          child: LoadingShimmer.withChild(
            enabled: state.isSubmitting,
            child: Text('Send Message'.tr()),
          ),
        );
      },
    );
  }
}
