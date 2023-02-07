import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverReturnRequestTile extends StatelessWidget {
  final ApproverReturnRequest approverReturnRequest;
  const ApproverReturnRequestTile({
    Key? key,
    required this.approverReturnRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          approverReturnRequest.returnId,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: ZPColors.kPrimaryColor,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Submitted Date'.tr(),
              valueText: approverReturnRequest.submittedDate,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Name'.tr(),
              valueText: approverReturnRequest.customerName,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Refund Total (w/o tax)'.tr(),
              valueText: StringUtils.displayPrice(
                context.read<SalesOrgBloc>().state.configs,
                approverReturnRequest.refundTotal,
              ),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Created By'.tr(),
              valueText: approverReturnRequest.createdBy,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Sold To'.tr(),
              valueText: approverReturnRequest.soldTo,
              keyFlex: 1,
              valueFlex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
