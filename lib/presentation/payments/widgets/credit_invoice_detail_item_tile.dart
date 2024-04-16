import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditInvoiceDetailItemTile extends StatelessWidget {
  final CustomerDocumentDetail customerDocumentDetail;

  const CreditInvoiceDetailItemTile({
    super.key,
    required this.customerDocumentDetail,
  });

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CommonTileItem(
      key: Key(customerDocumentDetail.batchNumber.getOrDefaultValue('')),
      headerText: _batchExpiryDateText(context),
      materialNumber: customerDocumentDetail.materialNumber,
      label: customerDocumentDetail.materialNumber.displayMatNo,
      subtitle: '',
      title: customerDocumentDetail.billingDocumentItemText,
      quantity:
          '${customerDocumentDetail.billingQuantity.getOrDefaultValue(0)}',
      isQuantityBelowImage: true,
      isQuantityRequired: false,
      footerWidget: QuantityAndPriceWithTax.invoice(
        taxValue: customerDocumentDetail.taxAmount,
        quantity: customerDocumentDetail.billingQuantity.getOrDefaultValue(0),
        taxPercentage: customerDocumentDetail.taxPercent,
        netPrice: customerDocumentDetail.netPriceText,
      ),
      priceComponent: customerDocumentDetail.isNotFree
          ? PriceComponent(
              key: WidgetKeys.invoiceDetailMaterialUnitPrice,
              salesOrgConfig: salesOrgConfigs,
              price: salesOrgConfigs.displaySubtotalTaxBreakdown
                  ? customerDocumentDetail.unitNetPrice.toString()
                  : customerDocumentDetail.unitGrossPrice.toString(),
            )
          : null,
    );
  }

  String _batchExpiryDateText(BuildContext context) {
    final salesConfig = context.read<EligibilityBloc>().state.salesOrgConfigs;
    final displayedBatch = context.isMPPayment
        ? 'NA'
        : customerDocumentDetail.batchNumber.displayLabel;
    final displayedExpiryDate = context.isMPPayment
        ? 'NA'
        : customerDocumentDetail.expiryDate.dateOrNaString;

    return [
      if (salesConfig.batchNumDisplay)
        '${context.tr('Batch')}: $displayedBatch',
      if (salesConfig.expiryDateDisplay)
        '${context.tr('Expires')}: $displayedExpiryDate',
    ].join(' - ');
  }
}
