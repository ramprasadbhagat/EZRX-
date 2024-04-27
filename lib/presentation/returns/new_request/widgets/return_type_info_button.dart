import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/info_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_icon.dart';
import 'package:flutter/material.dart';

class ReturnTypeInfoIcon extends StatelessWidget {
  final ReturnType returnType;
  const ReturnTypeInfoIcon({
    Key? key,
    required this.returnType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoIcon(
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_) => InfoBottomSheet(
          title: '${context.tr('Type')}: ${returnType.returnTypeValue}',
          description: context.tr(returnType.returnTypeBottomASheetBodyText),
          buttonTitle: context.tr('Got it'),
        ),
      ),
    );
  }
}
