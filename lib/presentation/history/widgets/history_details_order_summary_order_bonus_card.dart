import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_expanion_tile.dart';
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

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            final materialPrice =
                context.read<MaterialPriceBloc>().state.materialPrice[
                    orderHistoryDetailsBonusAggregate.orderItem.materialNumber];
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
                        keyText: 'Type'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.type
                            .getOrCrash(),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      eligibiltiyBlocState.isBatchNumberEnable
                          ? BalanceTextRow(
                              keyText: 'Batch Number & Expiry Date'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem.materialNumber.displayMatNo,
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
                      eligibiltiyBlocState.isDeliveryDateOrTimeEnable
                          ? BalanceTextRow(
                              keyText: 'Delivery Date/Time'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem.plannedDeliveryDate,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            )
                          : const SizedBox.shrink(),
                      BalanceTextRow(
                        keyText: 'Status:'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                                .orderItem.sAPStatus.isNotEmpty
                            ? orderHistoryDetailsBonusAggregate
                                .orderItem.sAPStatus
                            : 'Order Placed'.tr(),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
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
                              .toString(),
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                      BalanceTextRow(
                        keyText: 'Remarks'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.lineReferenceNotes,
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      if (enableDisplayOrderDiscount)
                        BalanceTextRow(
                          keyText: 'Discount'.tr(),
                          valueText:
                              orderHistoryDetailsBonusAggregate.details.isEmpty
                                  ? ''
                                  : state.discountRate(
                                      orderHistoryDetailsBonusAggregate.details,
                                    ),
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                    ],
                  ),
                  CustomExpansionTile(
                    titleText: 'Bonuses'.tr(),
                    items: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          top: 0.0,
                        ),
                        child: Column(
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
                                      eligibiltiyBlocState.isBatchNumberEnable
                                          ? BalanceTextRow(
                                              keyText:
                                                  'Batch Number & Expiry Date'
                                                      .tr(),
                                              valueText: orderItem
                                                  .materialNumber.displayMatNo,
                                              valueTextLoading: state.isLoading,
                                              keyFlex: 1,
                                              valueFlex: 1,
                                            )
                                          : const SizedBox.shrink(),
                                      BalanceTextRow(
                                        keyText: 'Material ID'.tr(),
                                        valueText: orderItem
                                            .materialNumber.displayMatNo,
                                        valueTextLoading: state.isLoading,
                                        keyFlex: 1,
                                        valueFlex: 1,
                                      ),
                                      eligibiltiyBlocState
                                              .isDeliveryDateOrTimeEnable
                                          ? BalanceTextRow(
                                              keyText:
                                                  'Delivery Date/Time'.tr(),
                                              valueText:
                                                  orderItem.plannedDeliveryDate,
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
                                          valueText:
                                              orderItem.lineReferenceNotes,
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
  final cartBloc = context.read<CartBloc>();
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
        discountedMaterialCount: cartBloc.state.zmgMaterialCount,
        bundle: Bundle.empty(),
        addedBonusList: [],
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: itemInfo.info.materialNumber,
        ),
      ),
    );
  }
}
