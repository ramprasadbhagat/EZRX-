part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottomsheet.dart';

class _DiscountedPriceField extends StatelessWidget {
  const _DiscountedPriceField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.newDiscountPrice != current.newDiscountPrice,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Final counter offer price:'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: ZPColors.darkerGrey),
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: state.newDiscountPrice.toString(),
              ),
            ],
          ),
        );
      },
    );
  }
}
