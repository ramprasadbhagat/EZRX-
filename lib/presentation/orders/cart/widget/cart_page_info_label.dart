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
                    if (state.displayMovWarning) _MOVText(state: state),
                    if (state.displayInvalidItemsWarning)
                      _ErrorText(
                        text: context.tr(
                          'Please remove invalid items.',
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.isNotAvailableToCheckoutForID)
                      _ErrorText(
                        text: context.tr(
                          'You have exceeded the available quantity for this item.',
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.askUserToAddCommercialMaterial)
                      _ErrorText(
                        text: context.tr(
                          'Your cart must contain other commercial material to proceed checkout.',
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.isGimmickMaterialNotAllowed)
                      _ErrorText(
                        text: context.tr(
                          'Gimmick material {gimmikMaterialCode} is not allowed',
                          namedArgs: {
                            'gimmikMaterialCode': state.gimmickMaterialCode,
                          },
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.hasInvalidTenderMaterial)
                      _ErrorText(
                        text: context.tr(
                          'Tender Contract is no longer available for one or few item(s). Please remove to continue.',
                        ),
                        showLeadingIcon: state.hasMultipleErrors,
                      ),
                    if (state.isMaxQtyExceedsForAnyTender)
                      _ErrorText(
                        text: context.tr(
                          'One or few item(s) order qty exceed the maximum available tender quantity.',
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

class _MOVText extends StatelessWidget {
  final OrderEligibilityState state;
  const _MOVText({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayZPMinOrderAmount = StringUtils.displayPrice(
      state.configs,
      state.configs.minOrderAmount,
    );
    var errorMessage =
        '${context.tr('Please ensure that the order value satisfies the minimum order value of')} $displayZPMinOrderAmount';

    if (state.cartItems.containMPMaterial) {
      final displayMPMinOrderAmount = StringUtils.displayPrice(
        state.configs,
        state.configs.mpMinOrderAmount,
      );

      if (!state.zpSubtotalMOVEligible && !state.mpSubtotalMOVEligible) {
        errorMessage = context.tr(
          'Please ensure that minimum order value is at least {zpMOV} for ZP subtotal & {mpMOV} for MP subtotal.',
          namedArgs: {
            'zpMOV': displayZPMinOrderAmount,
            'mpMOV': displayMPMinOrderAmount,
          },
        );
      } else if (!state.zpSubtotalMOVEligible) {
        errorMessage = context.tr(
          'Please ensure that minimum order value is at least {mov} for ZP subtotal.',
          namedArgs: {
            'mov': displayZPMinOrderAmount,
          },
        );
      } else {
        errorMessage = context.tr(
          'Please ensure that minimum order value is at least {mov} for MP subtotal.',
          namedArgs: {
            'mov': displayMPMinOrderAmount,
          },
        );
      }
    }

    return _ErrorText(
      text: errorMessage,
      showLeadingIcon: state.hasMultipleErrors,
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
