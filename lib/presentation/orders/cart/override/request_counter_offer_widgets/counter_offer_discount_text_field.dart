part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';

class _CounterOfferDiscountTextField extends StatefulWidget {
  final PriceAggregate cartItem;
  final bool isPriceOverrideEnable;
  const _CounterOfferDiscountTextField({
    Key? key,
    required this.cartItem,
    required this.isPriceOverrideEnable,
  }) : super(key: key);

  @override
  State<_CounterOfferDiscountTextField> createState() =>
      _CounterOfferDiscountTextFieldState();
}

class _CounterOfferDiscountTextFieldState
    extends State<_CounterOfferDiscountTextField> {
  late TextEditingController _discountController;
  @override
  void initState() {
    _discountController = TextEditingController.fromValue(
      TextEditingValue(
        text: _counterOfferDiscountText,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages ||
          previous.isPriceOverride != current.isPriceOverride,
      builder: (context, state) {
        return Form(
          autovalidateMode: widget.isPriceOverrideEnable
              ? AutovalidateMode.onUserInteraction
              : state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomNumericTextField.wholeNumber(
              fieldKey: WidgetKeys.counterOfferDiscountField,
              labelText: 'Discount counter offer (%)'.tr(),
              decoration: InputDecoration(
                hintText: 'Enter counter offer percentage discount'.tr(),
                errorMaxLines: 2,
              ),
              controller: _discountController,
              onChanged: (value) {
                context.read<PriceOverrideBloc>().add(
                      PriceOverrideEvent.onDiscountValueChanged(
                        newValue: value,
                      ),
                    );
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.deny(ZPRegexes.specialCharacters),
              ],
              validator: (value) =>
                  state.isPriceOverride && _discountController.text.isEmpty
                      ? null
                      : CounterOfferDiscountValue(value ?? '').value.fold(
                            (f) => f.mapOrNull(
                              empty: (_) =>
                                  'Please enter discount counter offer'.tr(),
                              numberMustBiggerThanZero: (_) =>
                                  'Discount offer price cannot be zero'.tr(),
                              exceedingMaxValue: (_) =>
                                  'Please input counter offer percentage discount of less than 100%'
                                      .tr(),
                            ),
                            (_) => null,
                          ),
            ),
          ),
        );
      },
    );
  }

  String get _counterOfferDiscountText => widget
      .cartItem.materialInfo.counterOfferDetails.discountOverridePercentage
      .getOrDefaultValue('');
}
