import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/from_order_date_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/to_order_date_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/reset_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/apply_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/order_status_picker.dart';

class ViewByOrderFilterBottomSheet extends StatelessWidget {
  const ViewByOrderFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            title: Text(
              context.tr('Filter'),
            ),
            backgroundColor: ZPColors.transparent,
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                key: WidgetKeys.closeButton,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    context.tr('Order Date'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Row(
                  children: [
                    const _FromOrderDateFilter(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '-',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const _ToOrderDateFilter(),
                  ],
                ),
                BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
                  buildWhen: (previous, current) =>
                      previous.statusList != current.statusList ||
                      previous.filter.orderStatusList !=
                          current.filter.orderStatusList,
                  builder: (context, state) => state.statusList.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              context.tr('Status'),
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            const SizedBox(height: 12),
                            _OrderStatusPicker(
                              selectedStatus: state.filter.orderStatusList,
                              statusList: state.statusList,
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    _ResetButton(),
                    SizedBox(width: 12),
                    _ApplyButton(),
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
