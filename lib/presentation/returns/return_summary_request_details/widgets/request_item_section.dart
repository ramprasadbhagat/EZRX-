import 'dart:io';

import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_summary_item_price.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_override_info_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
part 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/expandable_details_section.dart';
part 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/return_material_item_section.dart';
part 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/return_bonus_item_section.dart';

class RequestItemSection extends StatelessWidget {
  const RequestItemSection({
    Key? key,
    required this.returnRequestinformationList,
  }) : super(key: key);
  final List<ReturnRequestInformation> returnRequestinformationList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Text(
              '${context.tr('Return items')} (${returnRequestinformationList.length})',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          ...returnRequestinformationList.mapIndexed(
            (index, item) => _ReturnItemSection(
              key: WidgetKeys.returnRequestDetailMaterial(index),
              returnRequestinformation: item,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReturnItemSection extends StatelessWidget {
  const _ReturnItemSection({
    Key? key,
    required this.returnRequestinformation,
  }) : super(key: key);
  final ReturnRequestInformation returnRequestinformation;

  @override
  Widget build(BuildContext context) {
    if (returnRequestinformation.prsfd.isBonus) {
      return CustomCard(
        child: ListTile(
          title: _ReturnBonusItemSection(
            isExpandable: true,
            bonusItem: returnRequestinformation,
          ),
        ),
      );
    }

    return CommonTileItem(
      materialNumber: returnRequestinformation.materialNumber,
      label: returnRequestinformation.materialNumber.displayMatNo,
      title: returnRequestinformation.materialDescription,
      subtitle: '',
      isQuantityRequired: false,
      headerText:
          '${context.tr('Batch')} ${returnRequestinformation.batch} (${context.tr('Expires')} ${returnRequestinformation.expiryDate.dateString})',
      quantity: returnRequestinformation.returnQuantity.toString(),
      isQuantityBelowImage: false,
      priceComponent: ReturnSummaryItemPrice(
        requestInformation: returnRequestinformation,
      ),
      statusWidget: StatusLabel(
        status: StatusType(
          returnRequestinformation.status.displayStatus,
        ),
      ),
      footerWidget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${context.tr('Qty:')} ${returnRequestinformation.returnQuantity.toString()}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.black,
                        ),
                  ),
                  if (returnRequestinformation.isApprovedQuantityOverride)
                    ReturnOverrideInfoIcon.quantity(
                      context: context,
                      initialQuantity: returnRequestinformation.initialQuantity,
                    ),
                ],
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price: returnRequestinformation.totalPrice.toString(),
                priceLabelStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ZPColors.primary),
              ),
            ],
          ),
          _ExpandableDetailSection(
            isExpandable: true,
            expandWidget: _ReturnMaterialItemSection(
              returnRequestinformation: returnRequestinformation,
            ),
          ),
        ],
      ),
    );
  }
}
