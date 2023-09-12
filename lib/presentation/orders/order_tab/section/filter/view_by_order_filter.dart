import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/from_order_date_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/to_order_date_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/reset_button.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/section/filter/widgets/apply_button.dart';

class ViewByOrderFilterBottomSheet extends StatefulWidget {
  const ViewByOrderFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<ViewByOrderFilterBottomSheet> createState() =>
      _ViewByOrderFilterBottomSheetState();
}

class _ViewByOrderFilterBottomSheetState
    extends State<ViewByOrderFilterBottomSheet> {
  @override
  void initState() {
    context.read<ViewByOrderFilterBloc>().add(
          ViewByOrderFilterEvent.setDateRange(
            context.read<ViewByOrderBloc>().state.appliedFilter,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          AppBar(
            title: const Text(
              'Filter',
            ).tr(),
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
                    'Order Date',
                    style: Theme.of(context).textTheme.labelSmall,
                  ).tr(),
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
