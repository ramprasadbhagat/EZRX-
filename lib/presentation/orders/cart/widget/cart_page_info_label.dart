part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageInfoLabel extends StatelessWidget {
  const _CartPageInfoLabel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.activeErrorsList != current.activeErrorsList,
      builder: (context, state) {
        return state.activeErrorsList.isNotEmpty
            ? Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                decoration: const BoxDecoration(
                  color: ZPColors.lightRedStatusColor,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    if (state.displayMovWarning)
                      _ErrorText(
                        text:
                            '${context.tr('Please ensure that the order value satisfies the minimum order value of')} ${StringUtils.displayPrice(
                          state.configs,
                          double.parse(
                            state.configs.minOrderAmount,
                          ),
                        )}',
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.displayInvalidItemsWarning)
                      _ErrorText(
                        text: context.tr('Please remove invalid items.'),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.isNotAvailableToCheckoutForID)
                      _ErrorText(
                        text: context.tr(
                          'You have exceeded the available quantity for this item',
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _ErrorText extends StatelessWidget {
  final bool showLeadingIcon;
  final String text;
  const _ErrorText({
    Key? key,
    required this.text,
    required this.showLeadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLeadingIcon)
            const Padding(
              padding: EdgeInsets.only(top: 6.0, right: 5),
              child: Icon(
                Icons.circle,
                color: ZPColors.passwordValidationsColor,
                size: 5,
              ),
            ),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
