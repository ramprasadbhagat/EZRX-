import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestDeliveryDate extends StatefulWidget {
  final DeliveryInfoData deliveryInfoData;
  final String futureDeliveryDay;

  const RequestDeliveryDate({
    required this.futureDeliveryDay,
    required this.deliveryInfoData,
    Key? key,
  }) : super(key: key);

  @override
  State<RequestDeliveryDate> createState() => _RequestDeliveryDateState();
}

class _RequestDeliveryDateState extends State<RequestDeliveryDate> {
  late TextEditingController _deliveryDateText;

  @override
  void initState() {
    _deliveryDateText = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.deliveryInfoData.deliveryDate.getValue(),
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
            labelText: 'Request delivery date'.tr(),
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
              hintText: 'Select date'.tr(),
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
                        final dateTime = await getDateFromDatePicker(
                          context,
                        );
                        _deliveryDateText.text =
                            DateFormat('yyyy-MM-dd').format(dateTime);
                        if (!mounted) return;
                        context.read<AdditionalDetailsBloc>().add(
                              AdditionalDetailsEvent.onTextChange(
                                label: DeliveryInfoLabel.deliveryDate,
                                newValue:
                                    DateFormat('yyyy-MM-dd').format(dateTime),
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

  Future<DateTime> getDateFromDatePicker(
    BuildContext context,
  ) async {
    // final futureDeliveryDay = widget.futureDeliveryDay;
    final orderDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.utc(275760, 09, 13),
      initialDate: DateTime.now().add(const Duration(days: 1)),
    );

    return orderDate ?? widget.deliveryInfoData.deliveryDate.toDateTime;
  }
}
