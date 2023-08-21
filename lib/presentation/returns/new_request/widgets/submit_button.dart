part of 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.submitButton,
      onPressed: null,
      child: Text(
        'Submit'.tr(),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}
