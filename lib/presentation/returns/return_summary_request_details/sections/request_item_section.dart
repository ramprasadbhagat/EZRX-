import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class RequestItemSection extends StatelessWidget {
  const RequestItemSection({
    Key? key,
    required this.returnRequestinformationList,
  }) : super(key: key);
  final List<ReturnRequestInformation> returnRequestinformationList;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoAttachmentBloc, PoAttachmentState>(
      listener: (context, state) {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                '${'Return items'.tr()} (${returnRequestinformationList.length})',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            ...returnRequestinformationList.map(
              (item) => _ReturnItemSection(
                returnRequestinformation: item,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReturnItemSection extends StatefulWidget {
  const _ReturnItemSection({
    Key? key,
    required this.returnRequestinformation,
  }) : super(key: key);
  final ReturnRequestInformation returnRequestinformation;

  @override
  State<_ReturnItemSection> createState() => _ReturnItemSectionState();
}

class _ReturnItemSectionState extends State<_ReturnItemSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return CommonTileItem(
      materialNumber: widget.returnRequestinformation.materialNumber,
      label: widget.returnRequestinformation.materialNumber.displayMatNo,
      title: widget.returnRequestinformation.materialDescription,
      subtitle: '',
      isQuantityRequired: false,
      headerText:
          '${'Batch'.tr()} ${widget.returnRequestinformation.batch} (${'Expires'.tr()} ${widget.returnRequestinformation.expiryDate.toValidDateString})',
      quantity: widget.returnRequestinformation.returnQuantity.toString(),
      isQuantityBelowImage: false,
      priceComponent: PriceComponent(
        salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
        price: widget.returnRequestinformation.calculatedUnitPrice.toString(),
        currencyCodeTextStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: ZPColors.extraLightGrey4),
        priceTextStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: ZPColors.extraLightGrey4),
      ),
      statusWidget: StatusLabel(
        status: StatusType(
          widget.returnRequestinformation.status.displayStatus,
        ),
      ),
      footerWidget: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '${'Qty:'.tr()} ${widget.returnRequestinformation.returnQuantity.toString()}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.black,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              price: widget.returnRequestinformation.totalPrice.toString(),
              priceLabelStyle: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: ZPColors.primary),
              currencyCodeTextStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ZPColors.primary),
            ),
          ]),
          InkWell(
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
            returnRequestinformation: widget.returnRequestinformation,
          ),
        ],
      ),
    );
  }
}

class _ExtendedSection extends StatelessWidget {
  const _ExtendedSection({
    Key? key,
    required this.isExtended,
    required this.returnRequestinformation,
  }) : super(key: key);
  final bool isExtended;
  final ReturnRequestInformation returnRequestinformation;

  @override
  Widget build(BuildContext context) {
    return isExtended
        ? Column(
            children: [
              const Divider(
                indent: 0,
                height: 20,
                endIndent: 0,
                color: ZPColors.lightGray2,
              ),
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
              _BonusItemSection(
                requestInformation: returnRequestinformation,
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
          keyText: 'Invoice number'.tr(),
          valueText: requestInformation.invoiceNo,
        ),
        BalanceTextRow(
          keyText: 'Invoice date'.tr(),
          valueText: requestInformation.invoiceDate.toValidDateString,
        ),
      ],
    );
  }
}

class _ReturnDetailsSection extends StatelessWidget {
  const _ReturnDetailsSection({
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
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 10,
          ),
          child: Text(
            'Return details'.tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        BalanceTextRow(
          keyText: 'Reason'.tr(),
          valueText: requestInformation.returnOrderDesc,
        ),
        BalanceTextRow(
          keyText: 'Comments'.tr(),
          valueText: requestInformation.comment.displayStringValue,
        ),
        _CustomListTile(
          imageUrlList: requestInformation.imageUrl,
          title: 'Attachments:',
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
                valueText: requestInformation.bapiStatus
                    .getbapiStatusType(requestInformation.bapiSalesDocNumber),
              ),
              _CustomListTile(
                imageUrlList: requestInformation.imageUrl,
                title: 'Attachments:',
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
            keyText: title.tr(),
            valueText: '-',
          )
        : ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title.tr(),
              style: Theme.of(context).textTheme.titleMedium,
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
                  'Bonus return details'.tr(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              ...requestInformation.bonusInformation.map(
                (e) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: ZPColors.extraLightGrey5,
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
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${'Batch'.tr()} ${e.batch} (${'Expires'.tr()} ${e.expiryDate.toValidDateString})',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          Text(
                            'Qty: ${e.returnQuantity} ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      BalanceTextRow(
                        keyText: 'Reason for return'.tr(),
                        valueText: e.returnOrderDesc,
                        keyFlex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
