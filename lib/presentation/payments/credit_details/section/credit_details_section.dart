import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
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
                  '${creditItem.postingKeyName} #${creditItem.searchKey}',
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
          subtitle: Column(
            children: [
              BalanceTextRow(
                keyText: 'Document date'.tr(),
                valueText: creditItem.postingDate.dateString,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'Document type'.tr(),
                valueText: creditItem.postingKeyName,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'Return number'.tr(),
                valueText: creditItem.invoiceReference.getOrDefaultValue('NA'),
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
              BalanceTextRow(
                keyText: 'Details'.tr(),
                valueText: creditItem.postingKeyName,
                valueFlex: 1,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.white,
                        ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddressInfoSection.order(),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        ListTile(
          minVerticalPadding: 20.0,
          title: Text(
            'Credit summary'.tr(),
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
                  'Credit total:'.tr(),
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
