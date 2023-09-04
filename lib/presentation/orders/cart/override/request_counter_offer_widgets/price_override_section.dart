part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottomsheet.dart';

class _CounterOfferPriceTextField extends StatefulWidget {
  final bool isDiscountOverrideEnable;
  final PriceAggregate cartItem;

  const _CounterOfferPriceTextField({
    Key? key,
    required this.isDiscountOverrideEnable,
    required this.cartItem,
  }) : super(key: key);

  @override
  State<_CounterOfferPriceTextField> createState() =>
      _CounterOfferPriceTextFieldState();
}

class _CounterOfferPriceTextFieldState
    extends State<_CounterOfferPriceTextField> {
  late TextEditingController _priceController;

  @override
  void initState() {
    _priceController = TextEditingController.fromValue(
      TextEditingValue(
        text: _counterOfferPriceText,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          final currency = context.read<SalesOrgBloc>().state.configs.currency;

          return Form(
            autovalidateMode: widget.isDiscountOverrideEnable
                ? AutovalidateMode.onUserInteraction
                : state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
            child: TextFieldWithLabel(
              fieldKey: WidgetKeys.counterOfferPriceField,
              labelText: '${'Counter offer price'.tr()} (${currency.code})',
              mandatory: !widget.isDiscountOverrideEnable,
              decoration: InputDecoration(
                hintText: 'Enter counter offer price'.tr(),
              ),
              keyboardType: TextInputType.number,
              controller: _priceController,
              inputFormatters: <TextInputFormatter>[
                // Only digits
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                //
                FilteringTextInputFormatter.deny(
                  RegExp(r'[~!@#$%^&*()_+`{}|<>?;:./,=\-[]]'),
                ),
              ],
              onChanged: (value) {
                context.read<PriceOverrideBloc>().add(
                      PriceOverrideEvent.onPriceValueChange(
                        newPrice: value,
                      ),
                    );
              },
              validator: (value) => context
                          .read<PriceOverrideBloc>()
                          .state
                          .isDiscountOverride &&
                      _priceController.text.isEmpty
                  ? null
                  : CounterOfferValue(value ?? '').value.fold(
                        (f) => f.mapOrNull(
                          empty: (_) => 'Please enter counter offer price'.tr(),
                          numberMustBiggerThanZero: (_) =>
                              'Counter offer price cannot be zero'.tr(),
                        ),
                        (_) => null,
                      ),
            ),
          );
        },
      ),
    );
  }

  String get _counterOfferPriceText =>
      widget.cartItem.materialInfo.counterOfferDetails.counterOfferPrice
          .getOrDefaultValue('');
}
