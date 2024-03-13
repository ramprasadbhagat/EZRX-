part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderDetailHeader extends StatelessWidget {
  final List<OrderHistoryDetails> orderHistoryList;
  final OrderHistoryDetails orderHeader;

  const _OrderDetailHeader({
    Key? key,
    required this.orderHistoryList,
    required this.orderHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ZPColors.white,
        );
    const keyFlex = 3;
    const valueFlex = 4;
    final zpOrders = orderHistoryList.zpOrderOnly;
    final mpOrders = orderHistoryList.mpOrderOnly;

    return ListTile(
      minVerticalPadding: 15.0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      tileColor: ZPColors.primary,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mpOrders.isNotEmpty
            ? [
                if (zpOrders.isNotEmpty)
                  _OrderNumberList(
                    prefix: 'ZP',
                    orderStatus: orderHeader.processingStatus,
                    orderNumber: zpOrders.map((e) => e.orderNumber).toList(),
                  ),
                if (zpOrders.isNotEmpty && mpOrders.isNotEmpty)
                  const SizedBox(height: 16),
                if (mpOrders.isNotEmpty)
                  _OrderNumberList(
                    prefix: 'MP',
                    orderStatus: orderHeader.processingStatus,
                    orderNumber: mpOrders.map((e) => e.orderNumber).toList(),
                  ),
              ]
            : [
                _OrderNumberList(
                  orderStatus: orderHeader.processingStatus,
                  orderNumber: [orderHeader.orderNumber],
                ),
              ],
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 16),
          BalanceTextRow(
            keyFlex: keyFlex,
            valueFlex: valueFlex,
            keyText: 'Order Date'.tr(),
            keyTextStyle: textStyle,
            valueText: orderHeader.createdDate.dateString,
            valueTextStyle: textStyle,
          ),
          BalanceTextRow(
            keyFlex: keyFlex,
            valueFlex: valueFlex,
            keyText: 'PO reference'.tr(),
            keyTextStyle: textStyle,
            valueText: orderHeader.pOReference.displayPOReference,
            valueTextStyle: textStyle,
          ),
          if (eligibilityState.salesOrgConfigs.enableFutureDeliveryDay)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Request delivery date'),
              keyTextStyle: textStyle,
              valueText: orderHeader.requestedDeliveryDate.dateString,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableReferenceNote)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Reference note'),
              keyTextStyle: textStyle,
              valueText: orderHeader.referenceNotes,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.displayPaymentTerm)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Payment term'),
              keyTextStyle: textStyle,
              valueText:
                  orderHeader.orderHistoryDetailsPaymentTerm.displayPaymentTerm,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableMobileNumber)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Contact person'),
              keyTextStyle: textStyle,
              valueText: context
                  .read<AdditionalDetailsBloc>()
                  .state
                  .deliveryInfoData
                  .contactPerson
                  .getOrDefaultValue(''),
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableMobileNumber)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Contact number'),
              keyTextStyle: textStyle,
              valueText: orderHeader.telephoneNumber.displayTelephoneNumber,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.enableSpecialInstructions)
            BalanceTextRow(
              keyFlex: keyFlex,
              valueFlex: valueFlex,
              keyText: context.tr('Delivery instructions'),
              keyTextStyle: textStyle,
              valueText: orderHeader.orderHistoryDetailsSpecialInstructions
                  .displaySpecialInstructions,
              valueTextStyle: textStyle,
            ),
          if (eligibilityState.salesOrgConfigs.showPOAttachment)
            const OrderSuccessAttachmentSection(),
        ],
      ),
    );
  }
}

class _OrderNumberList extends StatelessWidget {
  const _OrderNumberList({
    Key? key,
    required this.orderStatus,
    required this.orderNumber,
    this.prefix = '',
  }) : super(key: key);

  final OrderStepValue orderStatus;
  final List<OrderNumber> orderNumber;
  final String prefix;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
          color: ZPColors.white,
        );

    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(
            text:
                '${prefix.isNotEmpty ? '$prefix ' : ''}${context.tr(orderStatus.prefix)} ',
          ),
          ...orderNumber
              .mapIndexed(
                (index, e) => [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: InkWell(
                      key: WidgetKeys.orderSuccessOrderId,
                      onTap: () {
                        context.read<ViewByOrderDetailsBloc>().add(
                              ViewByOrderDetailsEvent.fetch(orderNumber: e),
                            );
                        context.read<ViewByItemDetailsBloc>().add(
                              ViewByItemDetailsEvent.searchOrderHistory(
                                searchKey: SearchKey(e.getValue()),
                              ),
                            );
                        context.router
                            .push(const ViewByOrderDetailsPageRoute());
                      },
                      child: Text(
                        '#${e.getOrDefaultValue('')}',
                        style: textStyle,
                      ),
                    ),
                  ),
                  if (index != orderNumber.length - 1)
                    const TextSpan(text: ', '),
                ],
              )
              .flattened
              .toList(),
          if (orderStatus.isInQueue)
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: QueueNumberInfoIcon(
                iconColor: ZPColors.attachmentColor,
              ),
            ),
        ],
      ),
    );
  }
}
