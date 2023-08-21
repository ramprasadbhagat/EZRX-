import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
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
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(data.uuid).returnQuantity !=
          current.getReturnItemDetails(data.uuid).returnQuantity,
      builder: (context, state) {
        final detail = state.getReturnItemDetails(data.uuid);

        return TextFieldWithLabel(
          fieldKey: WidgetKeys.returnValueField(
            '${data.uuid}${detail.returnQuantity.getIntValue}',
          ),
          labelText:
              '${'Return value'.tr()} (${context.read<SalesOrgBloc>().state.configs.currency.code})',
          onChanged: (value) {},
          initValue: detail.returnValueString(
            data.unitPrice.getOrDefaultValue(0),
          ),
          isEnabled: false,
        );
      },
    );
  }
}
