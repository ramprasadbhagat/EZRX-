import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryBonusItemSection extends StatefulWidget {
  final ReturnRequestInformation returnRequestInformation;

  const ReturnSummaryBonusItemSection({
    Key? key,
    required this.returnRequestInformation,
  }) : super(key: key);

  @override
  State<ReturnSummaryBonusItemSection> createState() =>
      _ReturnSummaryBonusItemSectionState();
}

class _ReturnSummaryBonusItemSectionState
    extends State<ReturnSummaryBonusItemSection> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  context.tr('Bonus Details'),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              StatusLabel(
                status: StatusType(
                  widget.returnRequestInformation.status.displayStatus,
                ),
              ),
            ],
          ),
          _BonusItemDetails(
            returnRequestInformation: widget.returnRequestInformation,
          ),
          const SizedBox(height: 8.0),
          InkWell(
            key: WidgetKeys.returnDetailShowBonusDetailButton,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isExpanded
                      ? context.tr('Hide details')
                      : context.tr('Show details'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: ZPColors.extraDarkGreen,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            const Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 10,
              color: ZPColors.extraLightGrey2,
            ),
          if (_isExpanded) const SizedBox(height: 8.0),
          if (_isExpanded)
            Text(
              context.tr('Bonus return details'),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
          if (_isExpanded) const SizedBox(height: 8.0),
          if (_isExpanded)
            BalanceTextRow(
              keyText: context.tr('Reason'),
              keyFlex: 2,
              valueFlex: 3,
              valueText: widget.returnRequestInformation.returnOrderDesc,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
          if (_isExpanded)
            BalanceTextRow(
              keyText: context.tr('Comments'),
              keyTextStyle: Theme.of(context).textTheme.titleSmall,
              keyFlex: 2,
              valueFlex: 3,
              valueText:
                  widget.returnRequestInformation.comment.getOrDefaultValue(''),
            ),
        ],
      ),
    );
  }
}

class _BonusItemDetails extends StatelessWidget {
  final ReturnRequestInformation returnRequestInformation;
  const _BonusItemDetails({Key? key, required this.returnRequestInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: ZPColors.extraLightGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                returnRequestInformation.materialNumber.displayMatNo,
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
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: ZPColors.primary,
                  ),
                  child: Text(
                    context.tr('Bonus'),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.white,
                          fontSize: 10,
                        ),
                  ),
                ),
            ],
          ),
          Text(
            returnRequestInformation.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            '${context.tr('Batch')} ${returnRequestInformation.batch} (${context.tr('Expires')} ${returnRequestInformation.expiryDate.dateString})',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: returnRequestInformation.totalPrice.toString(),
                type: PriceStyle.returnBonusPrice,
              ),
              Text(
                '${context.tr('Qty')}: ${returnRequestInformation.returnQuantity} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          Text(
            context.tr(
              'Bonus unit price is derived by order subtotal divided by the total item quantity (incl. bonus).',
            ),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.changePasswordRecommendationColor,
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}
