part of 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';

class _ProductFilterResetButton extends StatelessWidget {
  const _ProductFilterResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<MaterialFilterBloc>().add(
              const MaterialFilterEvent.resetFilter(),
            );
        Navigator.of(context).pop(
          context.read<MaterialFilterBloc>().state.emptyMaterialFilter,
        );
      },
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: const MaterialStatePropertyAll(
              ZPColors.white,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: ZPColors.primary),
              ),
            ),
          ),
      child: Text(
        'Reset'.tr(),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: ZPColors.primary,
            ),
      ),
    );
  }
}
