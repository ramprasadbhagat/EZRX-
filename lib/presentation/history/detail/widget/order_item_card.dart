import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/status_label.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemCard extends StatelessWidget {
  final OrderHistoryDetailsBonusAggregate orderHistoryDetailsBonusAggregate;

  const OrderItemCard({
    Key? key,
    required this.orderHistoryDetailsBonusAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibiltiyBlocState = context.read<EligibilityBloc>().state;
    final salesOrgConfigs = eligibiltiyBlocState.salesOrgConfigs;
    final enableTaxDisplay = salesOrgConfigs.enableTaxDisplay;
    final enableDisplayOrderDiscount = salesOrgConfigs.displayOrderDiscount;
    final enableRemark = salesOrgConfigs.enableRemarks;
    final disableCreateOrder =
        context.read<UserBloc>().state.user.disableCreateOrder;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return InkWell(
          onTap: disableCreateOrder
              ? null
              : () {
                  final materialPrice =
                      context.read<MaterialPriceBloc>().state.materialPrice[
                          orderHistoryDetailsBonusAggregate
                              .orderItem.materialNumber];
                  if (materialPrice == null) {
                    showSnackBar(
                      context: context,
                      message: 'Product Not Available'.tr(),
                    );
                  } else {
                    _addToCartPressed(
                      context,
                      context.read<MaterialPriceDetailBloc>().state,
                      orderHistoryDetailsBonusAggregate.orderItem,
                    );
                  }
                },
          child: Card(
            key: const Key('orderItemCard'),
            color: ZPColors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StatusLabel(
                    status: StatusType(
                      orderHistoryDetailsBonusAggregate
                          .orderItem.sAPStatus.displaySAPStatus,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      orderHistoryDetailsBonusAggregate
                          .orderItem.materialDescription,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Column(
                    children: [
                      BalanceTextRow(
                        keyText: 'Type'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.type
                            .getOrCrash(),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      eligibiltiyBlocState.salesOrgConfigs.batchNumDisplay
                          ? BalanceTextRow(
                              keyText: 'Batch Number & Expiry Date'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem.batchAndExpiryDate,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            )
                          : const SizedBox.shrink(),
                      BalanceTextRow(
                        keyText: 'Material ID'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.materialNumber.displayMatNo,
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      eligibiltiyBlocState
                                  .salesOrgConfigs.disableDeliveryDate &&
                              orderHistoryDetailsBonusAggregate
                                  .orderItem.plannedDeliveryDate.isNotEmpty
                          ? BalanceTextRow(
                              key: const Key('deliveryDateTime'),
                              keyText: 'Delivery Date/Time'.tr(),
                              valueText:orderHistoryDetailsBonusAggregate
                                    .orderItem.plannedDeliveryDate.toValidDateString,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            )
                          : const SizedBox.shrink(),
                      BalanceTextRow(
                        keyText: 'Quantity'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.qty
                            .toString(),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      BalanceTextRow(
                        keyText: 'ZP Price'.tr(),
                        valueText: StringUtils.displayPrice(
                          salesOrgConfigs,
                          orderHistoryDetailsBonusAggregate
                              .orderItem.unitPrice.zpPrice,
                        ),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      BalanceTextRow(
                        keyText: 'Total Price'.tr(),
                        valueText: StringUtils.displayPrice(
                          salesOrgConfigs,
                          orderHistoryDetailsBonusAggregate
                              .orderItem.totalPrice.totalPrice,
                        ),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      if (enableTaxDisplay)
                        BalanceTextRow(
                          keyText: 'Included Tax '.tr(),
                          valueText: orderHistoryDetailsBonusAggregate
                              .orderItem.tax
                              .toStringAsFixed(2),
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                      if (enableRemark)
                        BalanceTextRow(
                          keyText: 'Remarks'.tr(),
                          valueText: orderHistoryDetailsBonusAggregate
                              .orderItem.lineReferenceNotes.displayRemarks,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                      if (enableDisplayOrderDiscount)
                        BalanceTextRow(
                          key: const Key('discountRateForItemCard'),
                          keyText: 'Discount'.tr(),
                          valueText: orderHistoryDetailsBonusAggregate
                              .details.discountRate,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _addToCartPressed(
  BuildContext context,
  MaterialPriceDetailState state,
  OrderHistoryDetailsOrderItem orderHistoryDetailsOrderItem,
) {
  final queryInfo = MaterialQueryInfo.fromOrderHistoryDetails(
    orderHistoryDetailsOrderItem: orderHistoryDetailsOrderItem,
  );
  final itemInfo = state.materialDetails[queryInfo];
  if (itemInfo != null) {
    CartBottomSheet.showAddToCartBottomSheet(
      context: context,
      priceAggregate: PriceAggregate(
        price: itemInfo.price,
        materialInfo: itemInfo.info,
        salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
        quantity: 1,
        bundle: Bundle.empty(),
        addedBonusList: [],
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: itemInfo.info.materialNumber,
        ),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
      ),
    );
  }
}
