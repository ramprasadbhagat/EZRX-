import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class ReturnByItemFilterPage extends StatelessWidget {
  const ReturnByItemFilterPage({
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
                  context.router.pop();
                },
                icon: const Icon(
                  Icons.clear,
                  color: ZPColors.black,
                ),
              ),
            ],
          ),
          const _ReturnFilter(),
        ],
      ),
    );
  }
}

class _ReturnFilter extends StatelessWidget {
  const _ReturnFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Request date'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const _FromRequestDateFilter(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _ToRequestDateFilter(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${'Request amount'.tr()} (${salesOrgConfig.currency.code})',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const _AmountValueFromFilter(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _AmountValueToFilter(),
                ],
              ),
              (!state.filter.isReturnAmountValueRangeValid)
                  ? ValueRangeError(
                      label: 'Invalid Amount range!'.tr(),
                      isValid: state.filter.isReturnAmountValueRangeValid,
                    )
                  : const SizedBox.shrink(),
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueTo,
            initialValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) =>
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setAmountTo(
                        amountTo: value.isNotEmpty ? value : '',
                      ),
                    ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: 'Amount to'.tr(),
              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class _AmountValueFromFilter extends StatelessWidget {
  const _AmountValueFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueFrom,
            initialValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) =>
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setAmountFrom(
                        amountFrom: value.isNotEmpty ? value : '',
                      ),
                    ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: 'Amount from'.tr(),
              labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class _FromRequestDateFilter extends StatelessWidget {
  const _FromRequestDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getReturnDateFilterDateRange !=
          current.filter.getReturnDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.fromReturnDateField,
            onTap: () async {
              final returnByItemFilterBloc =
                  context.read<ViewByItemReturnFilterBloc>();
              final returnDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getReturnDateFilterDateRange,
              );
              if (returnDateRange == null) return;
              returnByItemFilterBloc.add(
                ViewByItemReturnFilterEvent.setReturnDate(
                  returnDateRange: returnDateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.returnDateFrom.dateString,
            ),
            decoration: InputDecoration(
              hintText: 'Date from'.tr(),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
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

class _ToRequestDateFilter extends StatelessWidget {
  const _ToRequestDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getReturnDateFilterDateRange !=
          current.filter.getReturnDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.toReturnDateField,
            onTap: () async {
              final returnByItemFilterBloc =
                  context.read<ViewByItemReturnFilterBloc>();
              final returnDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getReturnDateFilterDateRange,
              );
              if (returnDateRange == null) return;
              returnByItemFilterBloc.add(
                ViewByItemReturnFilterEvent.setReturnDate(
                  returnDateRange: returnDateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.returnDateTo.dateString,
            ),
            decoration: InputDecoration(
              hintText: 'Date to'.tr(),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
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
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.returnStatusList != current.filter.returnStatusList,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statusList.map((StatusType status) {
            final name = status.displayStatus;
            final value = state.filter.returnStatusList.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.returnStatusFilter(name, value),
              contentPadding: EdgeInsets.zero,
              title: Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<ViewByItemReturnFilterBloc>().add(
                      ViewByItemReturnFilterEvent.setReturnStatus(
                        status: status,
                        value: value ?? false,
                      ),
                    );
              },
              value: value,
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
          context.read<ViewByItemReturnFilterBloc>().add(
                const ViewByItemReturnFilterEvent.resetFilters(),
              );
          Navigator.of(context).pop(
            ReturnFilter.dateRangeEmpty(),
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
    return BlocBuilder<ViewByItemReturnFilterBloc, ViewByItemReturnFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        final lastAppliedFilter =
            context.read<ReturnListByItemBloc>().state.appliedFilter;
        final currentFilter = state.filter;
        final isEnable = lastAppliedFilter != currentFilter;

        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: isEnable ? () => _onPressed(context: context) : null,
            child: Text(
              'Apply'.tr(),
              style: const TextStyle(color: ZPColors.white),
            ),
          ),
        );
      },
    );
  }

  void _onPressed({
    required BuildContext context,
  }) {
    final isValid = context
        .read<ViewByItemReturnFilterBloc>()
        .state
        .filter
        .isReturnAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<ViewByItemReturnFilterBloc>().state.filter,
          )
        : context.read<ViewByItemReturnFilterBloc>().add(
              const ViewByItemReturnFilterEvent.setValidationFailure(),
            );
  }
}
