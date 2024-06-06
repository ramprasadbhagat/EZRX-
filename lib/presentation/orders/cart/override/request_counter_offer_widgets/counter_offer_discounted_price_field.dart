part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferDiscountedPriceField extends StatelessWidget {
  const _CounterOfferDiscountedPriceField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.finalCounterOfferPrice != current.finalCounterOfferPrice,
      builder: (context, state) {
        return Padding(
          key: WidgetKeys.counterOfferDiscountedPriceWidget,
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
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: state.finalCounterOfferPrice,
              ),
            ],
          ),
        );
      },
    );
  }
}
