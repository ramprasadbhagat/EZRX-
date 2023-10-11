import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestDetailsSection extends StatelessWidget {
  const RequestDetailsSection({
    Key? key,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ReturnDetailsSection(
          requestInformationHeader: requestInformationHeader,
        ),
        StatusTrackerSection(
          createDateTime: requestInformationHeader.createdDateTime,
          onTap: () {},
          status:
              requestInformationHeader.bapiStatus.displayStatusForViewByRequest,
          title: 'Return request status'.tr(),
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
        const Divider(
          indent: 0,
          height: 20,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _InvoiceSummarySection(
          requestInformationHeader: requestInformationHeader,
        ),
        _ROSection(
          requestInformationHeader: requestInformationHeader,
        ),
      ],
    );
  }
}

class _ReturnDetailsSection extends StatelessWidget {
  const _ReturnDetailsSection({
    Key? key,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: ZPColors.primary,
      minVerticalPadding: 20.0,
      title: BalanceTextRow(
        keyText:
            '${context.tr('Return')} #${requestInformationHeader.requestID}',
        valueText:
            requestInformationHeader.bapiStatus.displayStatusForViewByRequest,
        keyTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: ZPColors.white,
            ),
        isStatus: true,
      ),
      subtitle: Column(
        children: [
          BalanceTextRow(
            key: WidgetKeys.returnRequestDetailRequestDate,
            keyText: 'Request date'.tr(),
            keyFlex: 2,
            valueText: requestInformationHeader.createdDateTime.dateString,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          BalanceTextRow(
            keyText: 'Return reference'.tr(),
            keyFlex: 2,
            valueText:
                requestInformationHeader.returnReference.displayNAIfEmpty,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          BalanceTextRow(
            keyText: 'Special instructions'.tr(),
            keyFlex: 2,
            valueText: requestInformationHeader
                .specialInstructions.displaySpecialInstructions,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ],
      ),
    );
  }
}

class _InvoiceSummarySection extends StatelessWidget {
  const _InvoiceSummarySection({
    Key? key,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 16,
      title: Text(
        'Return summary'.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _PriceWidget(
            key: WidgetKeys.returnRequestDetailSubTotal,
            title: 'Subtotal with tax:',
            price: requestInformationHeader.refundTotal.refundTotal.toString(),
          ),
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
          _PriceWidget(
            key: WidgetKeys.returnRequestDetailGrandTotal,
            title: 'Grand total:',
            price: requestInformationHeader.refundTotal.refundTotal.toString(),
            priceStyle: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _PriceWidget extends StatelessWidget {
  const _PriceWidget({
    Key? key,
    required this.title,
    required this.price,
    this.priceStyle,
  }) : super(key: key);
  final String title;
  final String price;
  final TextStyle? priceStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        PriceComponent(
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: price,
        ),
      ],
    );
  }
}

class _ROSection extends StatelessWidget {
  const _ROSection({
    Key? key,
    required this.requestInformationHeader,
  }) : super(key: key);
  final ReturnRequestInformationHeader requestInformationHeader;

  @override
  Widget build(BuildContext context) {
    return requestInformationHeader.bapiStatus.getIsBapiStatusFailed
        ? Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: ZPColors.lightRedStatusColor,
            ),
            child: Text(
              'RO creation for at least one material has failed. Please recreate your return request to proceed.'
                  .tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        : const SizedBox.shrink();
  }
}
