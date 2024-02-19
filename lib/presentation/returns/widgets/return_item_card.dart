import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_detail_attachment_tile.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/returns/widgets/return_bonus_item_card.dart';
part 'package:ezrxmobile/presentation/returns/widgets/expandable_details_section.dart';
part 'package:ezrxmobile/presentation/returns/widgets/return_item_expand_section.dart';

class ReturnItemCard extends StatelessWidget {
  const ReturnItemCard({
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
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;
    if (returnRequestInformation.isEmpty) return const SizedBox.shrink();
    if (returnRequestInformation.prsfd.isBonus) {
      return CustomCard(
        key: WidgetKeys.returnItemDetailBonusItem,
        child: ListTile(
          title: _ReturnBonusItemSection(
            isExpandable: true,
            bonusItem: returnRequestInformation,
            downloadingAttachments: downloadingAttachments,
            downloadAttachment: downloadAttachment,
          ),
        ),
      );
    }

    return CommonTileItem(
      key: WidgetKeys.returnItemDetailMaterial(
        returnRequestInformation.materialNumber.displayMatNo,
        returnRequestInformation.returnQuantity,
        StringUtils.displayPrice(
          salesOrgConfigs,
          returnRequestInformation.totalPrice,
        ),
      ),
      materialNumber: returnRequestInformation.materialNumber,
      label: returnRequestInformation.materialNumber.displayMatNo,
      title: returnRequestInformation.materialDescription,
      subtitle: '',
      isQuantityRequired: false,
      headerText:
          '${context.tr('Batch')} ${returnRequestInformation.batch} (${context.tr('Expires')} ${returnRequestInformation.expiryDate.dateString})',
      quantity: returnRequestInformation.returnQuantity.toString(),
      isQuantityBelowImage: false,
      priceComponent: ReturnSummaryItemPrice(
        requestInformation: returnRequestInformation,
      ),
      statusWidget: StatusLabel(
        status: StatusType(
          returnRequestInformation.status.displayStatus,
        ),
      ),
      topHeaderWidget: returnRequestInformation.displayOutSidePolicy(
        salesOrgConfigs.allowReturnsOutsidePolicy,
      )
          ? const OutsideReturnPolicyTag()
          : null,
      footerWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${context.tr('Qty:')} ${returnRequestInformation.returnQuantity.toString()}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.black,
                        ),
                  ),
                  if (returnRequestInformation.isApprovedQuantityOverride)
                    ReturnOverrideInfoIcon.quantity(
                      context: context,
                      initialQuantity: returnRequestInformation.initialQuantity,
                    ),
                ],
              ),
              PriceComponent(
                salesOrgConfig: salesOrgConfigs,
                price: returnRequestInformation.totalPrice.toString(),
                priceLabelStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.primary),
              ),
            ],
          ),
          _ExpandableDetailSection(
            isExpanded: false,
            isExpandable: true,
            expandWidget: _ReturnItemExpandSection(
              returnRequestInformation: returnRequestInformation,
              downloadingAttachments: downloadingAttachments,
              downloadAttachment: downloadAttachment,
            ),
          ),
        ],
      ),
    );
  }
}
