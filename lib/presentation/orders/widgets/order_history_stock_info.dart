import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderHistoryStockInfo extends StatelessWidget {
  final String batchNumber;
  final String expiryDate;
  final EligibilityState eligibilityState;

  const OrderHistoryStockInfo({
    super.key,
    required this.batchNumber,
    required this.expiryDate,
    required this.eligibilityState,
  });

  factory OrderHistoryStockInfo.viewByOrder({
    required OrderHistoryDetailsOrderItem item,
    required EligibilityState eligibilityState,
  }) {
    final stockInfo = StockInfo.empty().copyWith(
      batch: item.batch,
      expiryDate: item.expiryDate,
    );

    return OrderHistoryStockInfo(
      batchNumber:
          stockInfo.displayBatchNumber(isMarketPlace: item.isMarketPlace),
      expiryDate: stockInfo.displayExpiryDate(
        isMarketPlace: item.isMarketPlace,
        isPhMdi: eligibilityState.salesOrg.isPhMdi,
        isAbbotPrincipalCode: item.principalData.principalCode.isAbbot,
      ),
      eligibilityState: eligibilityState,
    );
  }

  factory OrderHistoryStockInfo.viewByItem({
    required OrderHistoryItem item,
    required EligibilityState eligibilityState,
  }) {
    final stockInfo = StockInfo.empty().copyWith(
      batch: item.batch,
      expiryDate: item.expiryDate,
    );

    return OrderHistoryStockInfo(
      batchNumber:
          stockInfo.displayBatchNumber(isMarketPlace: item.isMarketPlace),
      expiryDate: stockInfo.displayExpiryDate(
        isMarketPlace: item.isMarketPlace,
        isPhMdi: eligibilityState.salesOrg.isPhMdi,
        isAbbotPrincipalCode: item.principalData.principalCode.isAbbot,
      ),
      eligibilityState: eligibilityState,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!eligibilityState.salesOrgConfigs.batchNumDisplay) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Text(
        '${context.tr('Batch')}: $batchNumber - ${context.tr('Expires')}: $expiryDate',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: ZPColors.neutralsGrey1),
      ),
    );
  }
}
