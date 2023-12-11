import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/outside_return_policy_tag.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/regexes.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/widgets/bonus_material_return_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/bonus_material_return_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/upload_file_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_quantity_and_price.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';

part 'widgets/return_material_widget.dart';
part 'widgets/special_instructions_field.dart';
part 'widgets/return_reference_field.dart';
part 'widgets/material_return_details_section.dart';
part 'widgets/bonus_item_section.dart';

class ReturnReviewTab extends StatelessWidget {
  const ReturnReviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.selectedItems != current.selectedItems,
      builder: (context, state) {
        return SingleChildScrollView(
          key: WidgetKeys.returnReviewTabBodyKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                const _ReturnReferenceField(),
                const SizedBox(
                  height: 8,
                ),
                const SpecialInstructionsField(),
                ...state.selectedItems
                    .map(
                      (item) => item.balanceQuantity.isGreaterThanZero
                          ? _ReturnMaterialWidget(
                              key: WidgetKeys.genericKey(
                                key:
                                    'selectedItem#${state.selectedItems.indexOf(item)}',
                              ),
                              item: item,
                            )
                          : Column(
                              children: state
                                  .getReturnBonusItemsOfMainItem(item)
                                  .map(
                                    (item) => BonusMaterialReturnWidget(
                                      returnMaterial: item,
                                      returnItemDetail:
                                          state.getReturnItemDetails(item.uuid),
                                    ),
                                  )
                                  .toList(),
                            ),
                    )
                    .toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
