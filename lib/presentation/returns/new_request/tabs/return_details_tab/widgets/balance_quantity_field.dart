import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class BalanceQuantityField extends StatelessWidget {
  const BalanceQuantityField({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      fieldKey: WidgetKeys.returnBalanceQuantityField(data.uuid),
      labelText: 'Balance quantity'.tr(),
      onChanged: (value) {},
      initValue: data.balanceQuantity.apiParameterValue,
      isEnabled: false,
    );
  }
}
