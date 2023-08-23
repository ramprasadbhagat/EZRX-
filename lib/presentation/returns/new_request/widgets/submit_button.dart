part of '../new_request_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewRequestBloc, NewRequestState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) => context.router
                .popAndPush(const NewRequestSuccessfulPageRoute()),
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) => ElevatedButton(
        key: WidgetKeys.submitButton,
        onPressed: state.isSubmitting
            ? null
            : () => context.read<NewRequestBloc>().add(
                  NewRequestEvent.submit(
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                    user: context.read<UserBloc>().state.user,
                  ),
                ),
        child: LoadingShimmer.withChild(
          enabled: state.isSubmitting,
          child: Text(
            'Submit'.tr(),
            style: const TextStyle(
              color: ZPColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
