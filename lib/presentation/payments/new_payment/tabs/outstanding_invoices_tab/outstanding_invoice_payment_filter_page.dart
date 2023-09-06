import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class OutstandingInvoicePaymentFilterPage extends StatelessWidget {
  const OutstandingInvoicePaymentFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
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
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const _PaymentFilter(),
          ),
        ],
      ),
    );
  }
}

class _PaymentFilter extends StatelessWidget {
  const _PaymentFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessage != current.showErrorMessage,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;

        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Document date'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const _FromDateFilter(
                    isDue: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _ToDateFilter(
                    isDue: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Due date'.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const _FromDateFilter(
                    isDue: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _ToDateFilter(
                    isDue: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${'Amount range'.tr()} (${salesOrgConfig.currency.code})',
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
              (!state.filter.isOutstandingInvoiceAmountValueRangeValid)
                  ? ValueRangeError(
                      label: 'Invalid Amount range!'.tr(),
                      isValid: state
                          .filter.isOutstandingInvoiceAmountValueRangeValid,
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

class _FromDateFilter extends StatelessWidget {
  const _FromDateFilter({
    Key? key,
    required this.isDue,
  }) : super(key: key);

  final bool isDue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) => isDue
          ? previous.filter.getDueDateFilterDateRange !=
              current.filter.getDueDateFilterDateRange
          : previous.filter.getDocumentDateFilterDateRange !=
              current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: isDue
                ? WidgetKeys.fromDueDateField
                : WidgetKeys.fromDocumentDateField,
            onTap: () async {
              final outstandingInvoiceFilterBloc =
                  context.read<OutstandingInvoiceFilterBloc>();
              final dateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: isDue
                    ? DateTime.now().add(const Duration(days: 365))
                    : DateTime.now(),
                initialDateRange: isDue
                    ? state.filter.getDueDateFilterDateRange
                    : state.filter.getDocumentDateFilterDateRange,
              );
              if (dateRange == null) return;
              outstandingInvoiceFilterBloc.add(
                isDue
                    ? OutstandingInvoiceFilterEvent.setDueDate(
                        dueDateRange: dateRange,
                      )
                    : OutstandingInvoiceFilterEvent.setDocumentDate(
                        documentDateRange: dateRange,
                      ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: isDue
                  ? state.filter.dueDateFrom.dateString
                  : state.filter.documentDateFrom.dateString,
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

class _ToDateFilter extends StatelessWidget {
  const _ToDateFilter({
    Key? key,
    required this.isDue,
  }) : super(key: key);
  final bool isDue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) => isDue
          ? previous.filter.getDueDateFilterDateRange !=
              current.filter.getDueDateFilterDateRange
          : previous.filter.getDocumentDateFilterDateRange !=
              current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: isDue
                ? WidgetKeys.toDueDateField
                : WidgetKeys.toDocumentDateField,
            onTap: () async {
              final outstandingInvoiceFilterBloc =
                  context.read<OutstandingInvoiceFilterBloc>();
              final dateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 364)),
                lastDate: isDue
                    ? DateTime.now().add(const Duration(days: 365))
                    : DateTime.now(),
                initialDateRange: isDue
                    ? state.filter.getDueDateFilterDateRange
                    : state.filter.getDocumentDateFilterDateRange,
              );
              if (dateRange == null) return;
              outstandingInvoiceFilterBloc.add(
                isDue
                    ? OutstandingInvoiceFilterEvent.setDueDate(
                        dueDateRange: dateRange,
                      )
                    : OutstandingInvoiceFilterEvent.setDocumentDate(
                        documentDateRange: dateRange,
                      ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: isDue
                  ? state.filter.dueDateTo.dateString
                  : state.filter.documentDateTo.dateString,
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

class _AmountValueFromFilter extends StatelessWidget {
  const _AmountValueFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;

        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueFrom,
            initialValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) =>
                context.read<OutstandingInvoiceFilterBloc>().add(
                      OutstandingInvoiceFilterEvent.setAmountFrom(
                        amountFrom: value.isNotEmpty ? value : '',
                      ),
                    ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: '${'From'.tr()} (${salesOrgConfig.currency.code})',
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

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;

        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueTo,
            initialValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) =>
                context.read<OutstandingInvoiceFilterBloc>().add(
                      OutstandingInvoiceFilterEvent.setAmountTo(
                        amountTo: value.isNotEmpty ? value : '',
                      ),
                    ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: '${'To'.tr()} (${salesOrgConfig.currency.code})',
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

class _StatusesSelector extends StatelessWidget {
  const _StatusesSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.outstandingInvoiceStatus !=
          current.filter.outstandingInvoiceStatus,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statusList.map((StatusType status) {
            return CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                status.displayPaymentStatus,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: VisualDensity.compact,
              onChanged: (bool? value) {
                context.read<OutstandingInvoiceFilterBloc>().add(
                      OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(
                        status: status,
                        value: value ?? false,
                      ),
                    );
              },
              value: status == state.filter.outstandingInvoiceStatus,
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
          context.read<OutstandingInvoiceFilterBloc>().add(
                const OutstandingInvoiceFilterEvent.initializeOrResetFilters(),
              );
          Navigator.of(context).pop(
            context
                .read<OutstandingInvoiceFilterBloc>()
                .state
                .emptyOutstandingInvoiceFilter,
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
    return BlocBuilder<OutstandingInvoiceFilterBloc,
        OutstandingInvoiceFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        final lastAppliedFilter =
            context.read<OutstandingInvoicesBloc>().state.appliedFilter;
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
        .read<OutstandingInvoiceFilterBloc>()
        .state
        .filter
        .isOutstandingInvoiceAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<OutstandingInvoiceFilterBloc>().state.filter,
          )
        : context.read<OutstandingInvoiceFilterBloc>().add(
              const OutstandingInvoiceFilterEvent.setValidationFailure(),
            );
  }
}
