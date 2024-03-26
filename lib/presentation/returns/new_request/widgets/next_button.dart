part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _NextButton extends StatelessWidget {
  final TabController tabController;
  final bool nextAllowed;
  const _NextButton({
    Key? key,
    required this.tabController,
    required this.nextAllowed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.nextButton,
      onPressed: !nextAllowed
          ? null
          : () {
              final step = tabController.index + 1;
              context.read<NewRequestBloc>().add(
                    NewRequestEvent.validateStep(step: step),
                  );
              if (nextAllowed) {
                trackMixpanelEvent(
                  MixpanelEvents.newReturnRequestStep,
                  props: <String, dynamic>{
                    MixpanelProps.step: step,
                    if (step == 1)
                      MixpanelProps.stepName: 'Select item(s) to return',
                    if (step == 2)
                      MixpanelProps.stepName: 'Fill in return details',
                  },
                );
                tabController.animateTo(
                  step,
                );
              }
            },
      child: Text(
        'Next'.tr(),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}
