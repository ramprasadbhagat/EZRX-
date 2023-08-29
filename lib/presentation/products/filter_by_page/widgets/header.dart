
part of 'package:ezrxmobile/presentation/products/filter_by_page/filter_by_page.dart';

class _Header extends StatelessWidget {
  final MaterialFilterType materialFilterType;
  const _Header({required this.materialFilterType, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10.0, right: 10.0),
      title: Text(
        materialFilterType == MaterialFilterType.countryList
            ? 'Country of origin'.tr()
            : materialFilterType == MaterialFilterType.manufactured
                ? 'Manufacturer'.tr()
                : '',
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.primary,
              fontSize: 20.0,
            ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ZPColors.primary,
          size: 15,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.close_outlined,
          color: ZPColors.primary,
          size: 24,
        ),
      ),
    );
  }
}
