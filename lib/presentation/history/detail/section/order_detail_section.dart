import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class HistoryOrderDetailSection extends StatelessWidget {
  const HistoryOrderDetailSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enableOHPrice =
        context.read<EligibilityBloc>().state.salesOrgConfigs.enableOHPrice;
    final customerCodeInfo =
        context.read<EligibilityBloc>().state.customerCodeInfo;

    final taxDisplayForOrderHistoryAndDetails = context
        .read<SalesOrgBloc>()
        .state
        .configs
        .taxDisplayForOrderHistoryAndDetails;
    final paymentTermDisplay =
        context.read<EligibilityBloc>().state.isPaymentTermDescriptionEnable;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final orderDetails = state.orderHistoryDetails;

        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          key: const ValueKey('orderDetails'),
          title: Text(
            'Order Details'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            if (enableOHPrice)
              BalanceTextRow(
                keyText: 'Total sub value'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  orderDetails.orderHistoryDetailsOrderHeader.orderValue,
                ),
                valueTextLoading: state.isLoading,
                keyFlex: 1,
                valueFlex: 1,
              ),
            if (taxDisplayForOrderHistoryAndDetails)
              BalanceTextRow(
                key: const Key('taxDisplay'),
                keyText: context.read<SalesOrgBloc>().state.salesOrg.isSg
                    ? 'GST'
                    : 'Total Tax'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  orderDetails.orderHistoryDetailsOrderHeader.totalTax,
                ),
                valueTextLoading: state.isLoading,
                keyFlex: 1,
                valueFlex: 1,
              ),
            if (enableOHPrice)
              BalanceTextRow(
                keyText: 'Grand Total'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  taxDisplayForOrderHistoryAndDetails
                      ? orderDetails.orderHistoryDetailsOrderHeader.grandTotal
                      : orderDetails.orderHistoryDetailsOrderHeader.orderValue,
                ),
                keyFlex: 1,
                valueFlex: 1,
                valueTextLoading: state.isLoading,
              ),
            BalanceTextRow(
              keyText: 'Type'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.type,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Name'.tr(),
              valueText: customerCodeInfo.customerName.toString(),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Created Date'.tr(),
              valueText: orderDetails
                  .orderHistoryDetailsOrderHeader.createdDate.toValidDateString,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'EZRX No.'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.eZRXNumber,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate
                ? BalanceTextRow(
                    keyText: 'Requested Delivery Date'.tr(),
                    valueText: orderDetails.orderHistoryDetailsOrderHeader
                        .requestedDeliveryDate.toValidDateString,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'Special Instructions'.tr(),
              valueText: orderDetails.orderHistoryDetailsSpecialInstructions
                  .displaySpecialInstructions.tr(),
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Reference Note'.tr(),
              valueText:
                  orderDetails.orderHistoryDetailsOrderHeader.referenceNotes,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'PO No.'.tr(),
              valueText: orderDetails.orderHistoryDetailsShippingInformation
                  .pOReference.displayPOReference.tr(),
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Contact Person'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.orderBy,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Contact Number'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader
                  .telephoneNumber.displayTelephoneNumber.tr(),
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Classification'.tr(),
              valueText: customerCodeInfo
                  .customerClassification.displayCustomerClassification.tr(),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Local Group'.tr(),
              valueText: customerCodeInfo.customerLocalGroup,
              keyFlex: 1,
              valueFlex: 1,
            ),
            paymentTermDisplay
                ? BalanceTextRow(
                    key: const ValueKey('paymentTerm'),
                    keyText: 'Payment Term'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermCode.displayPaymentTermCode.tr(),
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            paymentTermDisplay
                ? BalanceTextRow(
                    key: const ValueKey('paymentTermDisplay'),
                    keyText: 'Payment Term Description'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermDescription.displayPaymentTermDescription.tr(),
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
