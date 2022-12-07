import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTenderContractCard extends StatelessWidget {
  final OrderHistoryDetailsBonusAggregate orderHistoryDetailsBonusAggregate;

  const OrderTenderContractCard({
    Key? key,
    required this.orderHistoryDetailsBonusAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibiltiyBlocState = context.read<EligibilityBloc>().state;
    final salesOrgConfigs = eligibiltiyBlocState.salesOrgConfigs;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return InkWell(
          ////revisit later
          // onTap: (){},
          child: Card(
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: BalanceTextRow(
                          keyText:
                              'Contract - ${orderHistoryDetailsBonusAggregate.tenderContractDetails.tenderContractNumber}'
                                  .tr(),
                          valueText: orderHistoryDetailsBonusAggregate
                              .orderItem.materialDescription,
                          valueTextLoading: state.isLoading,
                          keyFlex: 1,
                          valueFlex: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
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
                      BalanceTextRow(
                        keyText: 'Mat No:'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.materialNumber.displayMatNo,
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      BalanceTextRow(
                         key:const Key('sapStatusNotEmpty'),
                        keyText: 'Status'.tr(),
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
                        keyText: 'Picked Quantity'.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.pickedQuantity
                            .toString(),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      BalanceTextRow(
                        keyText: 'Unit Price'.tr(),
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
                      BalanceTextRow(
                        keyText: 'Tax '.tr(),
                        valueText: orderHistoryDetailsBonusAggregate
                            .orderItem.tax
                            .toStringAsFixed(2),
                        valueTextLoading: state.isLoading,
                        keyFlex: 1,
                        valueFlex: 1,
                      ),
                      eligibiltiyBlocState.isBatchNumberEnable
                          ? BalanceTextRow(
                              keyText: 'Batch Number'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem.batch,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            )
                          : const SizedBox.shrink(),
                      eligibiltiyBlocState.isBatchNumberEnable
                          ? BalanceTextRow(
                              keyText: 'Expiry Date'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .orderItem.expiryDate,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                  const Divider(
                    color: ZPColors.lightGray,
                    thickness: 1.5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Contract - ${orderHistoryDetailsBonusAggregate.tenderContractDetails.tenderContractNumber}',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w700,
                                color: ZPColors.darkerGreen,
                              ),
                            ),
                            Text(
                              'Tender Price: ${StringUtils.displayPrice(
                                salesOrgConfigs,
                                orderHistoryDetailsBonusAggregate
                                    .orderItem.unitPrice.zpPrice,
                              )}',
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: ZPColors.lightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            BalanceTextRow(
                              keyText: 'Contact Reference'.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .tenderContractDetails
                                  .tenderContractReference,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            ),
                            BalanceTextRow(
                              keyText: 'Package Description '.tr(),
                              valueText: orderHistoryDetailsBonusAggregate
                                  .tenderContractDetails
                                  .tenderPackageDescription,
                              valueTextLoading: state.isLoading,
                              keyFlex: 1,
                              valueFlex: 1,
                            ),
                          ],
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
