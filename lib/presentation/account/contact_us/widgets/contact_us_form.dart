part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

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
            if (state.responseFlag) {
              await context.router.pop().then(
                    (value) => CustomSnackBar(
                      messageText: 'Message has been received.',
                    ).show(context),
                  );
            } else {
              await CustomSnackBar(
                messageText: 'Message has not been received.',
                backgroundColor: ZPColors.error,
                icon: const Icon(
                  Icons.error_outline,
                  color: ZPColors.black,
                ),
              ).show(context);
            }
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
