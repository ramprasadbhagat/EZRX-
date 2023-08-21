import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:flutter/material.dart';

class MaterialDetailsSection extends StatelessWidget {
  const MaterialDetailsSection({
    Key? key,
    required this.data,
    this.expandable = false,
  }) : super(key: key);
  final ReturnMaterial data;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: 'Material details'.tr(),
      expandable: expandable,
      child: Column(
        children: [
          BalanceTextRow(
            keyText: 'Principal code'.tr(),
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.principalCode.getOrDefaultValue(''),
          ),
          BalanceTextRow(
            keyText: 'Principal name'.tr(),
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.principalName.name,
          ),
          BalanceTextRow(
            keyText: 'Invoice number'.tr(),
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.assignmentNumber,
          ),
          BalanceTextRow(
            keyText: 'Invoice date'.tr(),
            keyFlex: 2,
            valueFlex: 3,
            valueText: data.priceDate.dateString,
          ),
        ],
      ),
    );
  }
}
