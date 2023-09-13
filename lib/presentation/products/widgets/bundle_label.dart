part of 'package:ezrxmobile/presentation/products/products_tab.dart';

class _BundleLabel extends StatelessWidget {
  const _BundleLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: const BoxDecoration(
        color: ZPColors.skyBlueColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svg/bonus_offer_tag.svg',
            height: 18,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Bundle offer'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ZPColors.white),
          ),
        ],
      ),
    );
  }
}
