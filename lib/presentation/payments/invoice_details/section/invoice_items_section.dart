import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceItemsSection extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const InvoiceItemsSection({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditAndInvoiceDetailsBloc, CreditAndInvoiceDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final salesOrgConfigs =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          title: Text(
            'Invoice Item Details'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: state.isLoading
              ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: LoadingShimmer.tile(),
                  ),
                ]
              : state.details.isEmpty
                  ? [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No files found'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ]
                  : state.details
                      .map(
                        (e) => Card(
                          margin: const EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Type'.tr(),
                                  valueText: e
                                      .salesDocumentItemType.displayStringValue,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Number'.tr(),
                                  valueText: e.billingDocumentItem,
                                ),
                                BalanceTextRow(
                                  keyText: 'Description'.tr(),
                                  valueText: e.billingDocumentItemText,
                                  keyFlex: 3,
                                  valueFlex: 5,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Unit of Measure'.tr(),
                                  valueText: e.billingQuantityUnit,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Quantity'.tr(),
                                  valueText:
                                      e.billingQuantity.apiParameterValue,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Unit Price'.tr(),
                                  valueText: StringUtils.displayPrice(
                                    salesOrgConfigs,
                                    e.netAmount,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Total Price'.tr(),
                                  valueText: StringUtils.displayPrice(
                                    salesOrgConfigs,
                                    e.grossAmount,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Material'.tr(),
                                  valueText: e.materialNumber.displayMatNo,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Reference SDS Document'.tr(),
                                  valueText: e.referenceSDDocument,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText:
                                      'Reference SDS Document Category'.tr(),
                                  valueText: e.referenceSDDocumentCategory,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Reference SDS Document Item'.tr(),
                                  valueText: e.referenceSDDocumentItem,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Sales Measure ISO Unit'.tr(),
                                  valueText: e.salesMeasureISOUnit,
                                ),
                                const SizedBox(height: 8),
                                BalanceTextRow(
                                  keyFlex: 3,
                                  valueFlex: 5,
                                  keyText: 'Tax Amount'.tr(),
                                  valueText: StringUtils.displayPrice(
                                    salesOrgConfigs,
                                    e.taxAmount,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
        );
      },
    );
  }
}
