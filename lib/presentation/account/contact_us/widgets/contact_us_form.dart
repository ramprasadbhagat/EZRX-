part of '../contact_us_page.dart';

class _ContactUsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () async {
            state.responseFlag
                ? await CustomSnackBar(
                    messageText: 'Message has been received.',
                  ).show(context)
                : await CustomSnackBar(
                    messageText: 'Message has not been received.',
                    backgroundColor: ZPColors.error,
                    icon: const Icon(
                      Icons.error_outline,
                      color: ZPColors.black,
                    ),
                  ).show(context);
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessage
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: const [
              _UsernameTextField(),
              SizedBox(
                height: 16,
              ),
              _ContactNumberTextField(),
              SizedBox(
                height: 16,
              ),
              _EmailTextField(),
              SizedBox(
                height: 16,
              ),
              _MessageTextField(),
              SizedBox(
                height: 25,
              ),
              _SendMessageButton(),
            ],
          ),
        );
      },
    );
  }
}
