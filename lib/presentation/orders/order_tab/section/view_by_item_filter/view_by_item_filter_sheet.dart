import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_app_bar.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_apply_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_date_range_picker.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_reset_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/widgets/view_by_item_filter_status_picker.dart';

class ViewByItemFilterSheet extends StatelessWidget {
  const ViewByItemFilterSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ViewByItemFilterAppBar(),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order date'.tr(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                const SizedBox(height: 12),
                const _ViewByItemFilterDateRangePicker(),
                const SizedBox(height: 20),
                Text(
                  'Status'.tr(),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const SizedBox(height: 12),
                const _ViewByItemFilterStatusPicker(),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: _ViewByItemFilterResetButton(),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _ViewByItemFilterApplyButton(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
