import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReturnSummaryItemSection extends StatelessWidget {
  const ReturnSummaryItemSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: requestInformation != ReturnRequestInformation.empty()
          ? ReturnItemSection(requestInformation: requestInformation)
          : const SizedBox.shrink(),
    );
  }
}

class ReturnItemSection extends StatefulWidget {
  const ReturnItemSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  @override
  State<ReturnItemSection> createState() => _ReturnItemSectionState();
}

class _ReturnItemSectionState extends State<ReturnItemSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CommonTileItem(
      key: WidgetKeys.returnItemDetailMaterial(
        widget.requestInformation.materialNumber.displayMatNo,
        widget.requestInformation.returnQuantity,
        StringUtils.displayPrice(
          salesOrgConfig,
          widget.requestInformation.totalPrice,
        ),
      ),
      materialNumber: widget.requestInformation.materialNumber,
      label: widget.requestInformation.materialNumber.displayMatNo,
      title: widget.requestInformation.materialDescription,
      subtitle: '',
      isQuantityRequired: false,
      headerText:
          'Batch ${widget.requestInformation.batch}\n(Expires ${widget.requestInformation.expiryDate.dateString})',
      quantity: widget.requestInformation.returnQuantity.toString(),
      isQuantityBelowImage: false,
      priceComponent: PriceComponent(
        salesOrgConfig: salesOrgConfig,
        price: widget.requestInformation.calculatedUnitPrice.toString(),
        type: PriceStyle.bonusPrice,
      ),
      statusWidget: StatusLabel(
        status: StatusType(
          widget.requestInformation.status.displayStatus,
        ),
      ),
      footerWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Qty: ${widget.requestInformation.returnQuantity.toString()}'
                    .tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
              PriceComponent(
                salesOrgConfig: salesOrgConfig,
                price: widget.requestInformation.totalPrice.toString(),
                priceLabelStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.primary),
              ),
            ],
          ),
          InkWell(
            key: WidgetKeys.returnDetailShowDetailButton,
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isExpanded ? 'Hide details'.tr() : 'Show details'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ZPColors.extraDarkGreen,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          _ExtendedSection(
            isExtended: isExpanded,
            requestInformation: widget.requestInformation,
          ),
        ],
      ),
      topHeaderWidget: widget.requestInformation.displayOutSidePolicy(
        salesOrgConfig.allowReturnsOutsidePolicy,
      )
          ? const OutsideReturnPolicyTag()
          : null,
    );
  }
}

class _ExtendedSection extends StatelessWidget {
  const _ExtendedSection({
    Key? key,
    required this.requestInformation,
    required this.isExtended,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final bool isExtended;

  @override
  Widget build(BuildContext context) {
    return isExtended
        ? Column(
            key: WidgetKeys.returnDetailSummary,
            children: [
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
              _MaterialDetailsSection(
                requestInformation: requestInformation,
              ),
              const Divider(
                indent: 0,
                height: 30,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
              _ApprovalDetailsSection(
                requestInformation: requestInformation,
              ),
              _ReturnDetailsSection(
                requestInformation: requestInformation,
              ),
              _BonusItemSection(
                requestInformation: requestInformation,
              ),
            ],
          )
        : const SizedBox.shrink();
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
            'Material details'.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BalanceTextRow(
          keyText: 'Principal code'.tr(),
          valueText: requestInformation.principal,
        ),
        BalanceTextRow(
          keyText: 'Principal name'.tr(),
          valueText: requestInformation.principalName.name,
        ),
        BalanceTextRow(
          keyText: context.tr('Invoice number'),
          valueText: requestInformation.invoiceNo,
        ),
        BalanceTextRow(
          key: WidgetKeys.returnItemDetailMaterialInvoiceDate,
          keyText: 'Invoice date'.tr(),
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
          keyText: 'Reason'.tr(),
          valueText: requestInformation.returnOrderDesc,
        ),
        BalanceTextRow(
          keyText: 'Comments'.tr(),
          valueText: requestInformation.remarks.displayText,
        ),
        _AttachmentSection(
          attachments: requestInformation.attachmentUrl,
        ),
      ],
    );
  }
}

class _ApprovalDetailsSection extends StatelessWidget {
  const _ApprovalDetailsSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;

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
                  'Approval details'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              BalanceTextRow(
                keyText: 'Reason'.tr(),
                valueText: requestInformation.returnOrderDesc,
              ),
              BalanceTextRow(
                keyText: 'Approval number'.tr(),
                valueText: requestInformation.displayBapiStatus,
              ),
              _AttachmentSection(
                attachments: requestInformation.attachmentUrl,
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

class _BonusItemSection extends StatelessWidget {
  const _BonusItemSection({
    Key? key,
    required this.requestInformation,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;

  @override
  Widget build(BuildContext context) {
    return requestInformation.bonusInformation.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Bonus details'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              ...requestInformation.bonusInformation.map(
                (e) => Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: ZPColors.lightGray2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                e.materialNumber.displayMatNo,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              if (!context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs
                                  .salesOrg
                                  .isID)
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: ZPColors.primary,
                                  ),
                                  child: Text(
                                    'Bonus'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: ZPColors.white,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            e.materialDescription,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            'Batch ${e.batch} (Expires ${e.expiryDate.dateString})',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PriceComponent(
                                salesOrgConfig: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrgConfigs,
                                price: e.totalPrice.toString(),
                                type: PriceStyle.returnBonusPrice,
                              ),
                              Text(
                                'Qty: ${e.returnQuantity} ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _ReturnDetailsSection(
                      requestInformation: e,
                      isBonusDetails: true,
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _AttachmentSection extends StatelessWidget {
  const _AttachmentSection({
    Key? key,
    required this.attachments,
  }) : super(key: key);

  final List<ReturnRequestAttachment> attachments;

  @override
  Widget build(BuildContext context) {
    const title = 'Attachments';

    return attachments.isEmpty
        ? BalanceTextRow(
            keyText: title.tr(),
            valueText: '-'.tr(),
          )
        : ListTile(
            key: WidgetKeys.returnAttachmentSection,
            contentPadding: EdgeInsets.zero,
            title: Text(
              '${title.tr()}:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
            subtitle: BlocBuilder<ReturnSummaryDetailsBloc,
                ReturnSummaryDetailsState>(
              buildWhen: (previous, current) =>
                  previous.downloadingAttachments !=
                  current.downloadingAttachments,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: attachments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final attachment = attachments[index];
                    final isDownloading =
                        state.downloadingAttachments.contains(attachment);

                    return _AttachmentTile(
                      attachment: attachment,
                      isDownloading: isDownloading,
                    );
                  },
                );
              },
            ),
          );
  }
}

class _AttachmentTile extends StatelessWidget {
  const _AttachmentTile({
    Key? key,
    required this.attachment,
    required this.isDownloading,
  }) : super(key: key);

  final ReturnRequestAttachment attachment;
  final bool isDownloading;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.returnAttachmentTile,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ZPColors.lightGray2,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              attachment.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          isDownloading
              ? LoadingAnimationWidget.discreteCircle(
                  key: WidgetKeys.loadMoreLoader,
                  color: ZPColors.primary,
                  secondRingColor: ZPColors.secondary,
                  thirdRingColor: ZPColors.orange,
                  size: 24,
                )
              : InkWell(
                  key: WidgetKeys.returnAttachmentDownloadButton,
                  onTap: () {
                    context.read<ReturnSummaryDetailsBloc>().add(
                          ReturnSummaryDetailsEvent.downloadFile(
                            file: attachment,
                          ),
                        );
                  },
                  child: const Icon(
                    Icons.download_outlined,
                    color: ZPColors.primary,
                  ),
                ),
        ],
      ),
    );
  }
}
