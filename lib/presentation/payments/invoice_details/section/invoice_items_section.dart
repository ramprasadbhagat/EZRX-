import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class InvoiceItemsSection extends StatelessWidget {
  const InvoiceItemsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditAndInvoiceDetailsBloc,
        CreditAndInvoiceDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return state.isLoading
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                ),
              )
            : state.details.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'No files found'.tr(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.details.groupList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              state.details.groupList
                                  .elementAt(index)
                                  .principalName
                                  .getOrDefaultValue(''),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ZPColors.black,
                                  ),
                            ),
                          ),
                          Column(
                            children: state.details.groupList
                                .elementAt(index)
                                .items
                                .map(
                                  (e) => _InvoiceItemDetail(
                                    customerDocumentDetail: e,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      );
                    },
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
      headerText:
          'Batch ${customerDocumentDetail.batchNumber.getOrDefaultValue('')} (EXP:${customerDocumentDetail.expiryDate.dateString})',
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
            'Qty: ${customerDocumentDetail.billingQuantity.getOrDefaultValue(0)}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          PriceComponent(
            salesOrgConfig: salesOrgConfigs,
            price: customerDocumentDetail.grossAmount.toString(),
            priceTextStyle: Theme.of(context).textTheme.labelSmall,
            currencyCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      priceComponent: PriceComponent(
        salesOrgConfig: salesOrgConfigs,
        price: customerDocumentDetail.grossAmount.toString(),
        priceTextStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ZPColors.darkGray),
        currencyCodeTextStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ZPColors.darkGray),
      ),
    );
  }
}
