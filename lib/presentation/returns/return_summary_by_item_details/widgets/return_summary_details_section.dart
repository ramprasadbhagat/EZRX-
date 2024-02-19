import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReturnSummaryDetailsSection extends StatelessWidget {
  const ReturnSummaryDetailsSection({
    Key? key,
    required this.requestInformation,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ReturnDetailsSection(
          requestInformation: requestInformation,
          requestInformationHeader: requestInformationHeader,
        ),
        StatusTrackerSection(
          createDateTime: requestInformationHeader.createdDateTime,
          onTap: () {},
          status: requestInformation.status.displayStatus,
          title: context.tr('Return request status'),
        ),
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: AddressInfoSection.returnRequest(),
        ),
      ],
    );
  }
}

class _ReturnDetailsSection extends StatefulWidget {
  const _ReturnDetailsSection({
    Key? key,
    required this.requestInformation,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformation requestInformation;
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  State<_ReturnDetailsSection> createState() => _ReturnDetailsSectionState();
}

class _ReturnDetailsSectionState extends State<_ReturnDetailsSection> {
  bool isCopied = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      color: ZPColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${context.tr('Return')} #${widget.requestInformationHeader.requestID}',
                  key: WidgetKeys.returnItemDetailReturnId,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ZPColors.white),
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (!isCopied) {
                    await Clipboard.setData(
                      ClipboardData(
                        text: widget.requestInformationHeader.requestID,
                      ),
                    ).then((value) {
                      setState(() {
                        isCopied = !isCopied;
                      });
                    });
                  }
                },
                child: Text(
                  isCopied ? context.tr('Copied') : context.tr('Copy'),
                  key: WidgetKeys.returnItemDetailCopyButton,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ZPColors.lightGreen),
                ),
              ),
            ],
          ),
          Column(
            children: [
              BalanceTextRow(
                key: WidgetKeys.returnItemDetailRequestDate,
                keyText: context.tr('Request date'),
                keyFlex: 2,
                valueText: widget.requestInformation.createdDate.dateString,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Return reference'),
                keyFlex: 2,
                valueText: widget
                    .requestInformationHeader.returnReference.displayNAIfEmpty,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyText: context.tr('Special instructions'),
                keyFlex: 2,
                valueText: widget.requestInformationHeader.specialInstructions
                    .displaySpecialInstructions,
                keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
                valueTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
