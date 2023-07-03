import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                Row(children: [
                  const _FromOrderDateFilter(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _ToOrderDateFilter(),
                ]),
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

class _FromOrderDateFilter extends StatelessWidget {
  const _FromOrderDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          onTap: () async {
            final viewByOrderFilterBloc = context.read<ViewByOrderFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.dateRange,
            );
            if (documentDateRange == null) return;
            viewByOrderFilterBloc.add(
              ViewByOrderFilterEvent.setDateRange(
                ViewByOrderHistoryFilter.empty()
                    .copyWith(dateRange: documentDateRange),
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.fromDate.toValidDateString,
          ),
          decoration: InputDecoration(
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }
}

class _ToOrderDateFilter extends StatelessWidget {
  const _ToOrderDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          onTap: () async {
            final viewByOrderFilterBloc = context.read<ViewByOrderFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.dateRange,
            );
            if (documentDateRange == null) return;
            viewByOrderFilterBloc.add(
              ViewByOrderFilterEvent.setDateRange(
                ViewByOrderHistoryFilter.empty()
                    .copyWith(dateRange: documentDateRange),
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.toDate.toValidDateString,
          ),
          decoration: InputDecoration(
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
            focusedBorder:
                Theme.of(context).inputDecorationTheme.disabledBorder,
          ),
        ),
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).pop(
          ViewByOrderHistoryFilter.empty(),
        ),
        child: const Text(
          'Reset',
          style: TextStyle(color: ZPColors.primary),
        ).tr(),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(
          context.read<ViewByOrderFilterBloc>().state.filter,
        ),
        child: const Text(
          'Apply',
          style: TextStyle(color: ZPColors.white),
        ).tr(),
      ),
    );
  }
}
