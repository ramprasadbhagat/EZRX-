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
    final enableTaxDisplay =
        context.read<SalesOrgBloc>().state.configs.enableTaxDisplay;
    final enableTaxAtTotalLevelOnly =
        context.read<SalesOrgBloc>().state.configs.enableTaxAtTotalLevelOnly;
    final customerCodeInfo =
        context.read<EligibilityBloc>().state.customerCodeInfo;

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
            if (enableTaxDisplay || enableTaxAtTotalLevelOnly)
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
                  orderDetails.orderHistoryDetailsOrderHeader.grandTotal,
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
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .enableSpecialInstructions
                ? BalanceTextRow(
                    keyText: 'Special Instructions'.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsSpecialInstructions
                        .displaySpecialInstructions,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'PO No.'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.pOReference
                  .displayPOReference,
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
                  .telephoneNumber.displayTelephoneNumber,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Classification'.tr(),
              valueText: customerCodeInfo
                  .customerClassification.displayCustomerClassification,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Local Group'.tr(),
              valueText: customerCodeInfo.customerLocalGroup,
              keyFlex: 1,
              valueFlex: 1,
            ),
            context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .enablePaymentTerms
                ? BalanceTextRow(
                    key: const ValueKey('paymentTerm'),
                    keyText: 'Payment Term'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermCode.displayPaymentTermCode,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            context.read<EligibilityBloc>().state.isPaymentTermDescriptionEnable
                ? BalanceTextRow(
                    keyText: 'Payment Term Description'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermDescription.displayPaymentTermDescription,
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
