import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/attachments_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnItemsSection extends StatelessWidget {
  const ReturnItemsSection({
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
            'Return Item Details'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            ...state.requestInformation.requestInformation
                .map(
                  (e) => Card(
                    margin: const EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          BalanceTextRow(
                            keyText: 'Status'.tr(),
                            isStatus: true,
                            valueText: e.status.displayStatus,
                            valueTextLoading: state.isLoading,
                            keyFlex: 3,
                            valueFlex: 5,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Material Name'.tr(),
                            valueText: e.materialDescription,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Material Number'.tr(),
                            valueText: e.materialNumber.displayMatNo,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Approve/Reject Reason'.tr(),
                            valueText: e.statusReason,
                            valueTextLoading: state.isLoading,
                          ),
                          ReturnSummaryDetailsAttachmentSection(
                            poDocuments:
                                e.attachmentsUploadByApproverUrlToPoDocuments,
                            attachMentsUploadMode:
                                AttachMentsUploadMode.approver,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'SAP RO Creation'.tr(),
                            valueText: e.sAPROCreationValue,
                            valueTextLoading: state.isLoading,
                            valueColor: ZPColors.red,
                          ),
                          const Divider(
                            endIndent: 0,
                            indent: 0,
                            height: 20,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Invoice No'.tr(),
                            valueText: e.invoiceNo,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Invoice Date'.tr(),
                            valueText: e.priceDate.toValidDateString,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Expiry Date'.tr(),
                            valueText: e.expiryDate.toValidDateString,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Batch'.tr(),
                            valueText: e.batch,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Return Quantity'.tr(),
                            valueText: e.returnQuantity,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Unit Price (w/o tax) '.tr(),
                            valueText: StringUtils.displayPrice(
                              configs,
                              e.unitPrice,
                            ),
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Override Value (w/o tax)'.tr(),
                            valueText: e.overrideValue.displayStringValue,
                            valueTextLoading: state.isLoading,
                          ),
                          BalanceTextRow(
                            keyFlex: 3,
                            valueFlex: 5,
                            keyText: 'Comments'.tr(),
                            valueText: e.comment.displayStringValue,
                            valueTextLoading: state.isLoading,
                          ),
                          ReturnSummaryDetailsAttachmentSection(
                            poDocuments:
                                e.attachmentsUploadByUserUrlToPoDocuments,
                            attachMentsUploadMode: AttachMentsUploadMode.user,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}
