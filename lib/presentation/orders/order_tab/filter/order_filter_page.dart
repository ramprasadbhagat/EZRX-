import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderFilterPage extends StatelessWidget {
  const OrderFilterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text(
              'Filter'.tr(),
            ),
            automaticallyImplyLeading: false,
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                key: WidgetKeys.closeButton,
                onPressed: () {
                  context.read<ViewByItemFilterBloc>().add(
                        ViewByItemFilterEvent.resetFiltersToLastApplied(
                          lastAppliedFilter: context
                              .read<ViewByItemsBloc>()
                              .state
                              .appliedFilter,
                        ),
                      );
                  context.router.pop();
                },
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          const _OrderFilter(),
        ],
      ),
    );
  }
}

class _OrderFilter extends StatelessWidget {
  const _OrderFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order date'.tr(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          const SizedBox(
            height: 12,
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Status'.tr(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const _StatusesSelector(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              _ResetButton(),
              SizedBox(
                width: 12,
              ),
              _ApplyButton(),
            ],
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
    return BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.dateRange != current.filter.dateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.fromOrderDateField,
            onTap: () async {
              final orderHistoryFilterBloc =
                  context.read<ViewByItemFilterBloc>();
              final orderDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.dateRange,
              );
              if (orderDateRange == null) return;
              orderHistoryFilterBloc.add(
                ViewByItemFilterEvent.setOrderDate(
                  dateRange: orderDateRange,
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
        );
      },
    );
  }
}

class _ToOrderDateFilter extends StatelessWidget {
  const _ToOrderDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.dateRange != current.filter.dateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.toOrderDateField,
            onTap: () async {
              final orderHistoryFilterBloc =
                  context.read<ViewByItemFilterBloc>();
              final orderDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 364)),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.dateRange,
              );
              if (orderDateRange == null) return;
              orderHistoryFilterBloc.add(
                ViewByItemFilterEvent.setOrderDate(
                  dateRange: orderDateRange,
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
        );
      },
    );
  }
}

class _StatusesSelector extends StatelessWidget {
  const _StatusesSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.orderStatusList != current.filter.orderStatusList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statusList.map((StatusType status) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                status.getOrDefaultValue(''),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ViewByItemFilterBloc>().add(
                      ViewByItemFilterEvent.setOrderStatus(
                        status: status,
                        value: value ?? false,
                      ),
                    );
              },
              value: state.filter.orderStatusList.contains(status),
            );
          }).toList(),
        );
      },
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<ViewByItemFilterBloc>().add(
                const ViewByItemFilterEvent.initializeOrReset(),
              );
          Navigator.of(context).pop(
            context
                .read<ViewByItemFilterBloc>()
                .state
                .emptyViewByItemHistoryFilter,
          );
        },
        child: Text(
          'Reset'.tr(),
          style: const TextStyle(color: ZPColors.primary),
        ),
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
        key: WidgetKeys.filterApplyButton,
        onPressed: () {
          Navigator.of(context).pop(
            context.read<ViewByItemFilterBloc>().state.filter,
          );
        },
        child: Text(
          'Apply'.tr(),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
