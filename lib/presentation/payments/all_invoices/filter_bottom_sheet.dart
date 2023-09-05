import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter/services.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class AllInvoicesFilterBottomSheet extends StatelessWidget {
  const AllInvoicesFilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          key: WidgetKeys.tempFilter,
          children: <Widget>[
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
                    Navigator.of(context).pop();
                  },
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
              child: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Document date'.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Row(
                      children: [
                        const _FromDocumentDateFilter(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '-',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const _ToDocumentDateFilter(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Due date'.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Row(
                      children: [
                        const _FromDueDateFilter(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '-',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const _ToDueDateFilter(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, top: 20.0),
                      child: Text(
                        'Amount range'.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
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
                    (state.showErrorMessages &&
                            !state.filter.isAmountValueRangeValid)
                        ? ValueRangeError(
                            valueName: 'Amount'.tr(),
                            isValid: state.filter.isAmountValueRangeValid,
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, top: 20.0),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusesSelector extends StatelessWidget {
  const _StatusesSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.filterStatuses != current.filter.filterStatuses,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statuses.map((String status) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                status,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: (bool? value) {
                context.read<AllInvoicesFilterBloc>().add(
                      AllInvoicesFilterEvent.statusChanged(
                        status,
                        value ?? false,
                      ),
                    );
              },
              value: state.filter.filterStatuses.contains(status),
            );
          }).toList(),
        );
      },
    );
  }
}

class ValueRangeError extends StatelessWidget {
  final String valueName;
  final bool isValid;
  const ValueRangeError({
    Key? key,
    required this.valueName,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 8.0,
      ),
      child: Text(
        isValid ? '' : 'Invalid $valueName range!'.tr(),
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.error,
            ),
      ).tr(),
    );
  }
}

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            autocorrect: false,
            key: WidgetKeys.amountValueTo,
            initialValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) => context.read<AllInvoicesFilterBloc>().add(
                  AllInvoicesFilterEvent.amountValueToChanged(
                    value.isNotEmpty
                        ? StringUtils.formatter.format(double.parse(value))
                        : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: 'Amount to'.tr(),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
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
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            autocorrect: false,
            key: WidgetKeys.amountValueFrom,
            initialValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) => context.read<AllInvoicesFilterBloc>().add(
                  AllInvoicesFilterEvent.amountValueFromChanged(
                    value.isNotEmpty
                        ? StringUtils.formatter.format(double.parse(value))
                        : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              hintText: 'Amount from'.tr(),
              hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.darkGray,
                  ),
            ),
          ),
        );
      },
    );
  }
}

class _FromDocumentDateFilter extends StatelessWidget {
  const _FromDocumentDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.fromDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDocumentDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.documentDateFrom.dateString,
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

class _ToDocumentDateFilter extends StatelessWidget {
  const _ToDocumentDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.toDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDocumentDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.documentDateTo.dateString,
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

class _FromDueDateFilter extends StatelessWidget {
  const _FromDueDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDueDateFilterDateRange !=
          current.filter.getDueDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.fromDueDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final dueDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDueDateFilterDateRange,
            );
            if (dueDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDueDate(
                dueDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.dueDateFrom.dateString,
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

class _ToDueDateFilter extends StatelessWidget {
  const _ToDueDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDueDateFilterDateRange !=
          current.filter.getDueDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.toDueDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final dueDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDueDateFilterDateRange,
            );
            if (dueDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDueDate(
                dueDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.filter.dueDateTo.dateString,
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
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      builder: (context, state) {
        return Expanded(
          child: OutlinedButton(
            key: WidgetKeys.filterResetButton,
            onPressed: () {
              if (context
                      .read<AllInvoicesFilterBloc>()
                      .state
                      .filter
                      .excludeSearch !=
                  AllInvoicesFilter.empty()) {
                context.read<AllInvoicesBloc>().add(
                      AllInvoicesEvent.fetch(
                        appliedFilter: AllInvoicesFilter.empty().copyWith(
                          searchKey: context
                              .read<AllInvoicesBloc>()
                              .state
                              .appliedFilter
                              .searchKey,
                        ),
                      ),
                    );
              }
              context.router.popForced();
            },
            child: Text(
              'Reset'.tr(),
              style: const TextStyle(color: ZPColors.primary),
            ),
          ),
        );
      },
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
          final filterBloc = context.read<AllInvoicesFilterBloc>();
          filterBloc.add(
            const AllInvoicesFilterEvent.validateFilters(),
          );
          if (filterBloc.state.filter.isValid) {
            if (filterBloc.state.filter !=
                context.read<AllInvoicesBloc>().state.appliedFilter) {
              context.read<AllInvoicesBloc>().add(
                    AllInvoicesEvent.fetch(
                      appliedFilter: filterBloc.state.filter,
                    ),
                  );
            }
            context.router.popForced();
          }
        },
        child: Text(
          'Apply'.tr(),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
