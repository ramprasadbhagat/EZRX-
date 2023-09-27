import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnValueField extends StatelessWidget {
  const ReturnValueField({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) {
        final previousReturn = previous.getReturnItemDetails(data.uuid);
        final currentReturn = current.getReturnItemDetails(data.uuid);

        return previousReturn.returnQuantity != currentReturn.returnQuantity ||
            previousReturn.priceOverride != currentReturn.priceOverride;
      },
      builder: (context, state) {
        final detail = state.getReturnItemDetails(data.uuid);
        final returnValue = detail.returnValueString(
          data.unitPrice.getOrDefaultValue(0),
        );

        return TextFieldWithLabel(
          fieldKey: WidgetKeys.returnValueField(
            '${data.uuid}$returnValue',
          ),
          labelText:
              '${'Return value'.tr()} (${context.read<EligibilityBloc>().state.salesOrgConfigs.currency.code})',
          onChanged: (value) {},
          initValue: returnValue,
          isEnabled: false,
        );
      },
    );
  }
}
