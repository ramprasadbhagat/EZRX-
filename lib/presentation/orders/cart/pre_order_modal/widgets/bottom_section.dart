part of '../pre_order_modal.dart';

class _BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ZPColors.lightGray2,
          indent: 0,
          endIndent: 0,
          height: 15,
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  key: WidgetKeys.preOrderModalCancelButton,
                  onPressed: () => context.router.pop(),
                  child: Text(
                    'Cancel'.tr(),
                    style: const TextStyle(color: ZPColors.primary),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  key: WidgetKeys.preOrderModalContinueButton,
                  onPressed: () => context.router.pop(true),
                  child: Text(
                    'Continue'.tr(),
                    style: const TextStyle(color: ZPColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
