import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';

import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPoAttachmentTile extends StatelessWidget {
  final AdminPoAttachment adminPoAttachment;
  const AdminPoAttachmentTile({
    Key? key,
    required this.adminPoAttachment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            height: 35.0,
            child: Checkbox(
              onChanged: (value) => context.read<AdminPoAttachmentBloc>().add(
                    AdminPoAttachmentEvent.selectDeselect(
                      adminPoAttachment: adminPoAttachment,
                    ),
                  ),
              value: adminPoAttachment.isSelected,
            ),
          ),
          Expanded(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    adminPoAttachment.documentName,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.kPrimaryColor,
                        ),
                    maxLines: 2,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('orderNo'),
                    keyText: 'Order No'.tr(),
                    valueText: adminPoAttachment.salesOrderNumber,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('eZRXNo'),
                    keyText: 'EZRX No'.tr(),
                    valueText: adminPoAttachment.ezrxReferenceNumber,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('createdBy'),
                    keyText: 'Created By'.tr(),
                    valueText: adminPoAttachment.createdBy,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('salesOrg'),
                    keyText: 'Sales Org'.tr(),
                    valueText: adminPoAttachment.salesOrg,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('customerCode'),
                    keyText: 'Customer Code'.tr(),
                    valueText: adminPoAttachment.soldToCode,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                  BalanceTextRow(
                    key: const ValueKey('shipTo'),
                    keyText: 'Ship To'.tr(),
                    valueText: adminPoAttachment.shipToCode,
                    keyFlex: 1,
                    valueFlex: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
