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
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemBonusCard extends StatelessWidget {
  final OrderHistoryDetailsBonusAggregate orderHistoryDetailsBonusAggregate;

  const OrderItemBonusCard({
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
    final enableOHPrice = salesOrgConfigs.enableOHPrice;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return GestureDetector(
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
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderHistoryDetailsBonusAggregate
                        .orderItem.materialDescription,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: ZPColors.darkerGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      BalanceTextRow(
                        key: const Key('sapStatusNotEmpty'),
                        keyText: 'Status:'.tr(),
                        isStatus: true,
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.sAPStatus.displaySAPStatus,
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
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
                              key: const Key('batchNumberExpiryDate'),
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
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem
                                  .plannedDeliveryDate
                                  .toValidDateString,
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
                      if (enableOHPrice)
                        BalanceTextRow(
                          key: Key('zpPrice${orderHistoryDetailsBonusAggregate
                            .orderItem.materialNumber.getOrDefaultValue('')}'),
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
                      if (enableOHPrice)
                        BalanceTextRow(
                          key: Key('totalPrice${orderHistoryDetailsBonusAggregate
                            .orderItem.materialNumber.getOrDefaultValue('')}'),
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
                              .toString(),
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
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
                  custom.ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                      'Bonuses'.tr(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ZPColors.darkerGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            orderHistoryDetailsBonusAggregate.bonusList.map(
                          (orderItem) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderItem.materialDescription,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: ZPColors.darkerGreen,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    BalanceTextRow(
                                      keyText: 'Type'.tr(),
                                      valueText: orderItem.type.getOrCrash(),
                                      valueTextLoading: state.isLoading,
                                      keyFlex: 1,
                                      valueFlex: 1,
                                    ),
                                    eligibiltiyBlocState
                                            .salesOrgConfigs.batchNumDisplay
                                        ? BalanceTextRow(
                                            keyText:
                                                'Batch Number & Expiry Date'
                                                    .tr(),
                                            valueText:
                                                orderItem.batchAndExpiryDate,
                                            valueTextLoading: state.isLoading,
                                            keyFlex: 1,
                                            valueFlex: 1,
                                          )
                                        : const SizedBox.shrink(),
                                    BalanceTextRow(
                                      keyText: 'Material ID'.tr(),
                                      valueText:
                                          orderItem.materialNumber.displayMatNo,
                                      valueTextLoading: state.isLoading,
                                      keyFlex: 1,
                                      valueFlex: 1,
                                    ),
                                    eligibiltiyBlocState
                                            .salesOrgConfigs.disableDeliveryDate
                                        ? BalanceTextRow(
                                            keyText: 'Delivery Date/Time'.tr(),
                                            valueText: orderItem
                                                .plannedDeliveryDate
                                                .toValidDateString,
                                            valueTextLoading: state.isLoading,
                                            keyFlex: 1,
                                            valueFlex: 1,
                                          )
                                        : const SizedBox.shrink(),
                                    BalanceTextRow(
                                      keyText: 'Quantity:'.tr(),
                                      valueText: orderItem.qty.toString(),
                                      valueTextLoading: state.isLoading,
                                      keyFlex: 1,
                                      valueFlex: 1,
                                    ),
                                    BalanceTextRow(
                                      keyText: 'Tax '.tr(),
                                      valueText: orderItem.tax.toString(),
                                      valueTextLoading: state.isLoading,
                                      keyFlex: 1,
                                      valueFlex: 1,
                                    ),
                                    if (enableRemark)
                                      BalanceTextRow(
                                        keyText: 'Remarks'.tr(),
                                        valueText: orderItem
                                            .lineReferenceNotes.displayRemarks,
                                        valueTextLoading: state.isLoading,
                                        keyFlex: 1,
                                        valueFlex: 1,
                                      ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ).toList(),
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
