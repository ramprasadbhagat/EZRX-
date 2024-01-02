import 'package:collection/collection.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';

class InvoiceItemsSection extends StatelessWidget {
  const InvoiceItemsSection({Key? key, required this.customerDocumentDetail})
      : super(key: key);
  final List<CustomerDocumentDetail> customerDocumentDetail;

  @override
  Widget build(BuildContext context) {
    return customerDocumentDetail.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                context.tr('No files found'),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: customerDocumentDetail.groupList.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      customerDocumentDetail.groupList
                          .elementAt(index)
                          .principalName
                          .getOrDefaultValue(''),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ZPColors.black,
                          ),
                    ),
                  ),
                  Column(
                    children: customerDocumentDetail.groupList
                        .elementAt(index)
                        .items
                        .mapIndexed(
                          (itemIndex, e) => _InvoiceItemDetail(
                            key: WidgetKeys.invoiceDetailMaterial(
                              index,
                              itemIndex,
                            ),
                            customerDocumentDetail: e,
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
            },
          );
  }
}

class _InvoiceItemDetail extends StatelessWidget {
  final CustomerDocumentDetail customerDocumentDetail;
  const _InvoiceItemDetail({
    required this.customerDocumentDetail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CommonTileItem(
      key: Key(customerDocumentDetail.batchNumber.getOrDefaultValue('')),
      headerText:
          '${context.tr('Batch')} ${customerDocumentDetail.batchNumber.getOrDefaultValue('')} (EXP:${customerDocumentDetail.expiryDate.dateString})',
      materialNumber: customerDocumentDetail.materialNumber,
      label: customerDocumentDetail.materialNumber.displayMatNo,
      subtitle: '',
      title: customerDocumentDetail.billingDocumentItemText,
      quantity:
          '${customerDocumentDetail.billingQuantity.getOrDefaultValue(0)}',
      isQuantityBelowImage: true,
      isQuantityRequired: false,
      statusWidget: const SizedBox.shrink(),
      footerWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${context.tr('Qty')}: ${customerDocumentDetail.billingQuantity.getOrDefaultValue(0)}',
            key: WidgetKeys.invoiceDetailMaterialQty,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          PriceComponent(
            key: WidgetKeys.invoiceDetailMaterialTotalPrice,
            salesOrgConfig: salesOrgConfigs,
            price: customerDocumentDetail.netAmount.toString(),
          ),
        ],
      ),
      priceComponent: PriceComponent(
        key: WidgetKeys.invoiceDetailMaterialUnitPrice,
        salesOrgConfig: salesOrgConfigs,
        price: customerDocumentDetail.unitPrice.toString(),
      ),
    );
  }
}
