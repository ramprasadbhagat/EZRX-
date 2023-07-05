import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditDetailsSection extends StatelessWidget {
  final CreditAndInvoiceItem creditItem;
  const CreditDetailsSection({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: ZPColors.primary,
          minVerticalPadding: 20.0,
          title: Row(
            children: [
              Expanded(
                child: Text(
                  '${creditItem.accountingDocumentType} #${creditItem.accountingDocument}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
              StatusLabel(
                status: StatusType(
                  creditItem.invoiceProcessingStatus.getOrDefaultValue(''),
                ),
              ),
            ],
          ),
          subtitle: Column(children: [
            BalanceTextRow(
              keyText: 'Document date',
              keyColor: ZPColors.white,
              valueText: creditItem.documentDate.toValidDateString,
              valueColor: ZPColors.white,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Document type',
              keyColor: ZPColors.white,
              valueText: creditItem.accountingDocumentType,
              valueColor: ZPColors.white,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Return number',
              keyColor: ZPColors.white,
              valueText:
                  '#${creditItem.invoiceReference.getOrDefaultValue('')}',
              valueColor: ZPColors.white,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Details',
              keyColor: ZPColors.white,
              valueText: creditItem.postingKeyName,
              valueColor: ZPColors.white,
              keyFlex: 1,
              valueFlex: 1,
            ),
          ]),
        ),
        const ItemAddressSection(),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        ListTile(
          minVerticalPadding: 20.0,
          title: Text(
            'Credit summary',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Credit total:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                PriceComponent(
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  price:
                      '${creditItem.convertIfAmountInTransactionCurrencyIsNegative}',
                ),
              ],
            ),
          ),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}
