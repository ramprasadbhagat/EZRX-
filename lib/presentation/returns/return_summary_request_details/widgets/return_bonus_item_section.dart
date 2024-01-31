part of 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_item_section.dart';

class _ReturnBonusItemSection extends StatelessWidget {
  const _ReturnBonusItemSection({
    Key? key,
    required this.bonusItem,
    required this.isExpandable,
  }) : super(key: key);
  final ReturnRequestInformation bonusItem;
  final bool isExpandable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  context.tr('Bonus details'),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              StatusLabel(
                status: StatusType(
                  bonusItem.status.displayStatus,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: ZPColors.downPink,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    bonusItem.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: BonusTag(),
                  ),
                ],
              ),
              Text(
                bonusItem.materialDescription,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${context.tr('Batch')} ${bonusItem.batch} (${context.tr('Expires')} ${bonusItem.expiryDate.dateString})',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ZPColors.neutralsGrey1),
                    ),
                  ),
                  if (bonusItem.bapiStatus.getIsBapiStatusFailed)
                    Text(
                      '${context.tr('Qty')}: ${bonusItem.returnQuantity} ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
              bonusItem.bapiStatus.getIsBapiStatusFailed
                  ? BalanceTextRow(
                      keyText: context.tr('Reason for return'),
                      valueText: bonusItem.returnOrderDesc,
                      keyFlex: 3,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        key: WidgetKeys.bonusPriceComponent,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReturnSummaryItemPrice(
                            requestInformation: bonusItem,
                          ),
                          Text(
                            '${context.tr('Qty')}: ${bonusItem.returnQuantity} ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
              Text(
                context.tr(
                  'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
                ),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
        _ExpandableDetailSection(
          isExpandable: isExpandable,
          expandWidget: _BonusDetailsSection(
            requestInformation: bonusItem,
          ),
        ),
      ],
    );
  }
}

class _BonusDetailsSection extends StatelessWidget {
  const _BonusDetailsSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ApprovalDetailsSection(
          key: WidgetKeys.returnBonusApprovalDetail,
          requestInformation: requestInformation,
          isBonusDetails: true,
        ),
        _ReturnDetailsSection(
          key: WidgetKeys.returnBonusReturnDetail,
          requestInformation: requestInformation,
          isBonusDetails: true,
        ),
      ],
    );
  }
}
