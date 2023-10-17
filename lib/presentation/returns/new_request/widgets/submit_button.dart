part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewRequestBloc, NewRequestState>(
      listenWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting &&
          !current.isSubmitting,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            final reasonList = context.read<UsageCodeBloc>().state.usages;

            trackMixpanelEvent(
              MixpanelEvents.returnRequestSuccess,
              props: state.mixpanelTrackingInfo(reasonList: reasonList),
            );
            context.router.popAndPush(const NewRequestSuccessfulPageRoute());
          },
          (either) => either.fold(
            (failure) {
              trackMixpanelEvent(
                MixpanelEvents.returnRequestFailure,
                props: {
                  MixpanelProps.errorMessage: failure.failureMessage,
                },
              );
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
      builder: (context, state) => ElevatedButton(
        key: WidgetKeys.submitButton,
        onPressed: state.isSubmitting
            ? null
            : () {
                trackMixpanelEvent(
                  MixpanelEvents.newReturnRequestStep,
                  props: <String, dynamic>{
                    MixpanelProps.step: 3,
                    MixpanelProps.stepName: 'Review return details',
                  },
                );
                context.read<NewRequestBloc>().add(
                      NewRequestEvent.submit(
                        customerCodeInfo: context
                            .read<EligibilityBloc>()
                            .state
                            .customerCodeInfo,
                        user: context.read<EligibilityBloc>().state.user,
                      ),
                    );
              },
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
