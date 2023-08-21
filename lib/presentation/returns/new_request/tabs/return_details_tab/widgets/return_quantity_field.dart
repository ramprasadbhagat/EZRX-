import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnQuantityField extends StatelessWidget {
  const ReturnQuantityField({
    Key? key,
    required this.balanceQuantity,
    required this.uuid,
  }) : super(key: key);

  final IntegerValue balanceQuantity;
  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).returnQuantity !=
          current.getReturnItemDetails(uuid).returnQuantity,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.returnQuantityField(uuid),
          labelText: 'Return quantity'.tr(),
          decoration: InputDecoration(
            hintText: 'Enter Return quantity'.tr(),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Only digits
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            // Prevent leading zero
            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
          ],
          isEnabled: true,
          mandatory: true,
          initValue: context
              .read<NewRequestBloc>()
              .state
              .getReturnItemDetails(uuid)
              .returnQuantity
              .getOrDefaultValue(''),
          onChanged: (value) => context.read<NewRequestBloc>().add(
                NewRequestEvent.additionInfoChanged(
                  additionInfo: context
                      .read<NewRequestBloc>()
                      .state
                      .getReturnItemDetails(uuid)
                      .copyWith(
                        returnQuantity: ReturnQuantity(value),
                      ),
                ),
              ),
          validator: (text) {
            if ((text ?? '').isEmpty) {
              return 'Return quantity is required field.'.tr();
            } else if (ReturnQuantity(text ?? '').getIntValue >
                balanceQuantity.getOrDefaultValue(0)) {
              return 'Return quantity cannot exceed balance quantity.'.tr();
            }

            return null;
          },
        );
      },
    );
  }
}
