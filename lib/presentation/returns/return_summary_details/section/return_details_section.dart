import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryDetailsSection extends StatelessWidget {
  const ReturnSummaryDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configs = context.read<SalesOrgBloc>().state.configs;

    return BlocBuilder<ReturnSummaryDetailsBloc, ReturnSummaryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          title: Text(
            'Return Details'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Submitted Date'.tr(),
              valueText: state.requestInformation.submittedDate,
            ),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Return ID'.tr(),
              valueText: state.requestInformation.returnId,
            ),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Created By'.tr(),
              valueText: state.requestInformation.createdBy,
            ),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Refund Total (w/o tax)'.tr(),
              valueText: StringUtils.displayPrice(
                configs,
                state.requestInformation.refundTotal,
              ),
            ),
            BalanceTextRow(
              keyFlex: 3,
              valueFlex: 5,
              keyText: 'Return Status'.tr(),
              valueText: state
                  .requestInformation.requestHeader.status.displayStatusInList,
            ),
          ],
        );
      },
    );
  }
}
