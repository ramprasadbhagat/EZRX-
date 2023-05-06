import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/tender_contract_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTenderContractCard extends StatelessWidget {
  final OrderHistoryDetailsBonusAggregate orderHistoryDetailsBonusAggregate;
  final bool isLoading;

  const OrderTenderContractCard({
    Key? key,
    required this.orderHistoryDetailsBonusAggregate,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibiltiyBlocState = context.read<EligibilityBloc>().state;
    final salesOrgConfigs = eligibiltiyBlocState.salesOrgConfigs;
    // final disableCreateOrder =
    //     context.read<UserBloc>().state.user.disableCreateOrder;

    return BlocListener<TenderContractBloc, TenderContractState>(
      listenWhen: (previous, current) =>
          previous.selectedTenderContract != current.selectedTenderContract,
      listener: (context, state) {
        context.read<OrderHistoryDetailsBloc>().add(
              OrderHistoryDetailsEvent.updateMaterialTenderContract(
                selectedTenderContract: state.selectedTenderContract,
                queryInfo:
                    orderHistoryDetailsBonusAggregate.orderItem.queryInfo,
              ),
            );
      },
      child: InkWell(
        ////revisit later
        // onTap: disableCreateOrder ? null : (){},
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
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Column(
                  children: [
                    BalanceTextRow(
                      key: const Key('sapStatusNotEmpty'),
                      keyText: 'Status'.tr(),
                      isStatus: true,
                      valueText: orderHistoryDetailsBonusAggregate
                          .orderItem.sAPStatus.displaySAPStatus,
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Type'.tr(),
                      valueText: orderHistoryDetailsBonusAggregate
                          .orderItem.type
                          .getOrCrash(),
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Mat No:'.tr(),
                      valueText: orderHistoryDetailsBonusAggregate
                          .orderItem.materialNumber.displayMatNo.tr(),
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Quantity'.tr(),
                      valueText: orderHistoryDetailsBonusAggregate.orderItem.qty
                          .toString(),
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Picked Quantity'.tr(),
                      valueText: orderHistoryDetailsBonusAggregate
                          .orderItem.pickedQuantity
                          .toString(),
                      valueTextLoading: isLoading,
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
                      valueTextLoading: isLoading,
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
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    BalanceTextRow(
                      keyText: 'Tax '.tr(),
                      valueText: StringUtils.formatter.format(orderHistoryDetailsBonusAggregate.orderItem.tax),
                      valueTextLoading: isLoading,
                      keyFlex: 1,
                      valueFlex: 1,
                    ),
                    eligibiltiyBlocState.salesOrgConfigs.batchNumDisplay
                        ? BalanceTextRow(
                            keyText: 'Batch Number'.tr(),
                            valueText: orderHistoryDetailsBonusAggregate
                                .orderItem.batch,
                            valueTextLoading: isLoading,
                            keyFlex: 1,
                            valueFlex: 1,
                          )
                        : const SizedBox.shrink(),
                    eligibiltiyBlocState.salesOrgConfigs.batchNumDisplay
                        ? BalanceTextRow(
                            keyText: 'Expiry Date'.tr(),
                            valueText: orderHistoryDetailsBonusAggregate
                                .orderItem.expiryDate.toValidDateString,
                            valueTextLoading: isLoading,
                            keyFlex: 1,
                            valueFlex: 1,
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
                  buildWhen: (previous, current) =>
                      previous.isLoadingTenderContract !=
                      current.isLoadingTenderContract,
                  builder: (context, state) {
                    final material = state.materials[
                        orderHistoryDetailsBonusAggregate.orderItem.queryInfo];

                    return TenderContractDetailsTile(
                      tenderContract:
                          material?.tenderContract ?? TenderContract.empty(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
