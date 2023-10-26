part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _RequestDeliveryDate extends StatefulWidget {
  final DeliveryInfoData deliveryInfoData;
  final int nextDayNumber;

  const _RequestDeliveryDate({
    required this.nextDayNumber,
    required this.deliveryInfoData,
    Key? key,
  }) : super(key: key);

  @override
  State<_RequestDeliveryDate> createState() => _RequestDeliveryDateState();
}

class _RequestDeliveryDateState extends State<_RequestDeliveryDate> {
  late TextEditingController _deliveryDateText;
  late DateTime _currentDate;

  @override
  void initState() {
    _currentDate = DateTime.now();
    _deliveryDateText = TextEditingController.fromValue(
      TextEditingValue(
        text: DateTimeUtils.getNearestDeliveryDateString(_currentDate),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _deliveryDateText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
      buildWhen: (previous, current) =>
          previous.deliveryInfoData.greenDeliveryEnabled !=
              current.deliveryInfoData.greenDeliveryEnabled ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: TextFieldWithLabel(
            readOnly: true,
            fieldKey: WidgetKeys.deliveryDate,
            labelText: context.tr('Request delivery date'),
            controller: _deliveryDateText,
            validator: (_) {
              return context
                  .read<AdditionalDetailsBloc>()
                  .state
                  .deliveryInfoData
                  .deliveryDate
                  .value
                  .fold(
                    (f) => f.maybeMap(
                      empty: (_) =>
                          'Request delivery date is a required field.'.tr(),
                      orElse: () => null,
                    ),
                    (_) => null,
                  );
            },
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: context.tr('Select date'),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 22, minHeight: 22),
              suffixIcon: IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                key: WidgetKeys.selectDate,
                icon: const Icon(
                  Icons.date_range_outlined,
                  size: 22,
                ),
                onPressed: state.deliveryInfoData.greenDeliveryEnabled ||
                        state.isLoading
                    ? null
                    : ([bool mounted = true]) async {
                        final dateTime = await pickDate(context);
                        if (!mounted) return;
                        _deliveryDateText.text =
                            DateTimeUtils.getDeliveryDateString(dateTime);
                        context.read<AdditionalDetailsBloc>().add(
                              AdditionalDetailsEvent.onTextChange(
                                label: DeliveryInfoLabel.deliveryDate,
                                newValue: _deliveryDateText.text,
                              ),
                            );
                      },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<DateTime> pickDate(
    BuildContext context,
  ) async {
    final nearestWorkingDate =
        DateTimeUtils.getNearestWorkingDate(_currentDate);
    final orderDate = await showDatePicker(
      context: context,
      firstDate: nearestWorkingDate,
      lastDate: nearestWorkingDate.add(
        Duration(days: widget.nextDayNumber),
      ),
      initialDate: nearestWorkingDate,
      selectableDayPredicate: (DateTime val) => !DateTimeUtils.isWeekend(val),
    );

    return orderDate ?? nearestWorkingDate;
  }
}
