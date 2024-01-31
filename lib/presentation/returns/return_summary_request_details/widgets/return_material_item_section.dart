part of 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_item_section.dart';

class _ReturnMaterialItemSection extends StatelessWidget {
  const _ReturnMaterialItemSection({
    Key? key,
    required this.returnRequestinformation,
  }) : super(key: key);
  final ReturnRequestInformation returnRequestinformation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MaterialDetailsSection(
          requestInformation: returnRequestinformation,
        ),
        const Divider(
          indent: 0,
          height: 30,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _ApprovalDetailsSection(
          requestInformation: returnRequestinformation,
        ),
        _ReturnDetailsSection(
          requestInformation: returnRequestinformation,
        ),
        if (returnRequestinformation.bonusInformation.isNotEmpty) ...[
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
          ...returnRequestinformation.bonusInformation.map(
            (item) => _ReturnBonusItemSection(
              isExpandable: false,
              bonusItem: item,
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
    this.isBonusDetails = false,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
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
                ? context.tr('Bonus Return details')
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
        _CustomListTile(
          imageUrlList: requestInformation.imageUrl,
          title: 'Attachments',
        ),
      ],
    );
  }
}

class _ApprovalDetailsSection extends StatelessWidget {
  const _ApprovalDetailsSection({
    Key? key,
    required this.requestInformation,
    this.isBonusDetails = false,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final bool isBonusDetails;

  @override
  Widget build(BuildContext context) {
    return requestInformation.status.isApprovedStatus
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
                      ? context.tr('Bonus Approval details')
                      : context.tr('Approval details'),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              BalanceTextRow(
                keyText: context.tr('Reason'),
                valueText: requestInformation.returnOrderDesc,
              ),
              BalanceTextRow(
                keyText: context.tr('Approval number'),
                valueText: requestInformation.displayBapiStatus,
              ),
              _CustomListTile(
                imageUrlList: requestInformation.imageUrl,
                title: 'Attachments',
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

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    Key? key,
    required this.title,
    required this.imageUrlList,
  }) : super(key: key);
  final String title;
  final List<String> imageUrlList;

  @override
  Widget build(BuildContext context) {
    return imageUrlList.isEmpty
        ? BalanceTextRow(
            keyText: context.tr(title),
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
            valueText: '-',
          )
        : ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${context.tr(title)}:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            subtitle: ListView.builder(
              itemCount: imageUrlList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final file = File(imageUrlList[index]);
                final fileName = path.basename(file.path).split('?').first;

                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: ZPColors.accentColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fileName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cloud_download_outlined,
                          color: ZPColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
