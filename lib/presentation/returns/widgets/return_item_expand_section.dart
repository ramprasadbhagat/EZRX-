part of 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';

class _ReturnItemExpandSection extends StatelessWidget {
  const _ReturnItemExpandSection({
    Key? key,
    required this.returnRequestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  }) : super(key: key);
  final ReturnRequestInformation returnRequestInformation;
  final List<ReturnRequestAttachment> downloadingAttachments;
  final Function(ReturnRequestAttachment) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.returnDetailSummary,
      children: [
        _MaterialDetailsSection(
          requestInformation: returnRequestInformation,
        ),
        const Divider(
          indent: 0,
          height: 30,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _ApprovalDetailsSection(
          requestInformation: returnRequestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
        _ReturnDetailsSection(
          requestInformation: returnRequestInformation,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
        if (returnRequestInformation.bonusInformation.isNotEmpty) ...[
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
          ...returnRequestInformation.bonusInformation.map(
            (item) => _ReturnBonusItemSection(
              isExpandable: false,
              bonusItem: item,
              downloadingAttachments: downloadingAttachments,
              downloadAttachment: downloadAttachment,
            ),
          ),
        ],
      ],
    );
  }
}

class _MaterialDetailsSection extends StatelessWidget {
  const _MaterialDetailsSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            context.tr('Material details'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BalanceTextRow(
          keyText: context.tr('Principal code').tr(),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.principal,
        ),
        BalanceTextRow(
          keyText: context.tr('Principal name'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.principalName.name,
        ),
        BalanceTextRow(
          keyText: context.tr('Invoice number'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.invoiceNo,
        ),
        BalanceTextRow(
          key: WidgetKeys.returnItemDetailMaterialInvoiceDate,
          keyText: context.tr('Invoice date'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.invoiceDate.dateString,
        ),
      ],
    );
  }
}

class _ReturnDetailsSection extends StatelessWidget {
  const _ReturnDetailsSection({
    Key? key,
    required this.requestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
    this.isBonusDetails = false,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final List<ReturnRequestAttachment> downloadingAttachments;
  final Function(ReturnRequestAttachment) downloadAttachment;
  final bool isBonusDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          child: Text(
            isBonusDetails
                ? context.tr('Bonus return details')
                : context.tr('Return details'),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BalanceTextRow(
          keyText: context.tr('Reason'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.returnOrderDesc,
        ),
        BalanceTextRow(
          keyText: context.tr('Comments'),
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueText: requestInformation.remarks.displayText,
        ),
        _ReturnAttachmentSection(
          attachments: requestInformation.attachmentUrl,
          downloadingAttachments: downloadingAttachments,
          downloadAttachment: downloadAttachment,
        ),
      ],
    );
  }
}

class _ApprovalDetailsSection extends StatelessWidget {
  const _ApprovalDetailsSection({
    Key? key,
    required this.requestInformation,
    required this.downloadingAttachments,
    required this.downloadAttachment,
    this.isBonusDetails = false,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final List<ReturnRequestAttachment> downloadingAttachments;
  final Function(ReturnRequestAttachment) downloadAttachment;
  final bool isBonusDetails;

  @override
  Widget build(BuildContext context) {
    return requestInformation.status.showApprovalDetails
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                child: Text(
                  isBonusDetails
                      ? context.tr('Bonus approval details')
                      : context.tr('Approval details'),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              BalanceTextRow(
                keyText: context.tr('Reason'),
                valueText: requestInformation.statusReason.getOrDefault,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Approval number'),
                valueText: requestInformation.displayBapiStatus,
                keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              _ReturnAttachmentSection(
                downloadingAttachments: downloadingAttachments,
                downloadAttachment: downloadAttachment,
                attachments: const <ReturnRequestAttachment>[],
              ),
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _ReturnAttachmentSection extends StatelessWidget {
  const _ReturnAttachmentSection({
    Key? key,
    required this.attachments,
    required this.downloadingAttachments,
    required this.downloadAttachment,
  }) : super(key: key);
  final List<ReturnRequestAttachment> attachments;
  final List<ReturnRequestAttachment> downloadingAttachments;
  final Function(ReturnRequestAttachment) downloadAttachment;

  @override
  Widget build(BuildContext context) {
    return attachments.isEmpty
        ? BalanceTextRow(
            keyText: context.tr('Attachments'),
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
            valueText: '-',
          )
        : ListTile(
            key: WidgetKeys.returnAttachmentSection,
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${context.tr('Attachments')}:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                attachments.length,
                (index) {
                  final attachment = attachments.elementAt(index);
                  final isDownloading =
                      downloadingAttachments.contains(attachment);

                  return ReturnDetailAttachmentTile(
                    attachment: attachment,
                    isDownloading: isDownloading,
                    tapDownload: () => downloadAttachment(attachment),
                  );
                },
              ),
            ),
          );
  }
}
