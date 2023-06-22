import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
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
          previous.showErrorMessages != current.showErrorMessages ||
          previous.applied != current.applied && current.applied,
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
                    context.read<AllInvoicesFilterBloc>().add(
                          const AllInvoicesFilterEvent.closeFilterBottomSheet(),
                        );
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
                        'Document date',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Row(children: [
                      const _FromDocumentDateFilter(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const _ToDocumentDateFilter(),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Due date',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Row(children: [
                      _FromDueDateFilter(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const _ToDueDateFilter(),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Amount range',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Row(children: [
                      const _AmountValueFromFilter(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '-',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const _AmountValueToFilter(),
                    ]),
                    (state.showErrorMessages &&
                            !state.tempFilter.isAmountValueRangeValid)
                        ? ValueRangeError(
                            valueName: 'Amount',
                            isValid: state.tempFilter.isAmountValueRangeValid,
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        'Status',
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
          previous.tempFilter.filterStatuses !=
          current.tempFilter.filterStatuses,
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
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<AllInvoicesFilterBloc>().add(
                      AllInvoicesFilterEvent.statusChanged(
                        status,
                        value ?? false,
                      ),
                    );
              },
              value: state.tempFilter.filterStatuses.contains(status),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
          ),
          child: Text(
            isValid ? '' : 'Invalid $valueName range!'.tr(),
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.error,
                ),
          ).tr(),
        ),
      ],
    );
  }
}

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.tempFilter.amountValueTo != current.tempFilter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueTo,
            initialValue: state.tempFilter.amountValueTo.apiParameterValue,
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
          previous.tempFilter.amountValueFrom !=
          current.tempFilter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueFrom,
            initialValue: state.tempFilter.amountValueFrom.apiParameterValue,
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
          previous.tempFilter.getDocumentDateFilterDateRange !=
          current.tempFilter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.fromDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.tempFilter.getDocumentDateFilterDateRange,
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
            text: state.tempFilter.documentDateFrom.toValidDateString,
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
          previous.tempFilter.getDocumentDateFilterDateRange !=
          current.tempFilter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.toDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.tempFilter.getDocumentDateFilterDateRange,
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
            text: state.tempFilter.documentDateTo.toValidDateString,
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.tempFilter.getDueDateFilterDateRange !=
          current.tempFilter.getDueDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          key: WidgetKeys.fromDueDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.tempFilter.getDueDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDueDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.tempFilter.dueDateFrom.toValidDateString,
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
          previous.tempFilter.getDueDateFilterDateRange !=
          current.tempFilter.getDueDateFilterDateRange,
      builder: (
        context,
        state,
      ) =>
          Expanded(
        child: TextFormField(
          key: WidgetKeys.toDueDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange: state.tempFilter.getDueDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDueDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          controller: TextEditingController(
            text: state.tempFilter.dueDateTo.toValidDateString,
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
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<AllInvoicesFilterBloc>().add(
                const AllInvoicesFilterEvent.resetFilters(),
              );
          context.router.popForced();
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
          final bloc = context.read<AllInvoicesFilterBloc>();
          bloc.add(
            const AllInvoicesFilterEvent.applyFilters(),
          );
          if (bloc.state.tempFilter.isValid) {
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
