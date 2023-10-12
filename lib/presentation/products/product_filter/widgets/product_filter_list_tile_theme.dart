part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ListTileThemeWidget extends StatelessWidget {
  final bool value;
  final String title;
  final void Function(bool?) onChanged;
  const _ListTileThemeWidget({
    Key? key,
    required this.value,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          context.tr(title),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: ZPColors.neutralsBlack),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: const EdgeInsets.only(left: 32.0),
        dense: true,
        side: const BorderSide(color: ZPColors.lightGray2, width: 2),
      ),
    );
  }
}
