part of 'package:ezrxmobile/presentation/more/section/login_on_behalf_sheet.dart';

class _CancelButton extends StatelessWidget {
  const _CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => context.router.pop(),
        child: Text('Cancel'.tr()),
      ),
    );
  }
}
