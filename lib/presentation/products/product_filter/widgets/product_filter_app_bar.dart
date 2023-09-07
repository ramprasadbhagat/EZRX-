part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterAppBar extends StatelessWidget {
  const _ProductFilterAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
      title: Text(
        'Filter & Sort'.tr(),
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: ZPColors.primary),
      ),
      trailing: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.close_outlined,
          color: ZPColors.primary,
          size: 24,
        ),
      ),
    );
  }
}
