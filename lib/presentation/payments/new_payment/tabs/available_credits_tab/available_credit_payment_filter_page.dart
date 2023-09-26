import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/value_range_error.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class AvailableCreditPaymentFilterPage extends StatelessWidget {
  const AvailableCreditPaymentFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            title: Text(
              context.tr('Filter'),
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
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
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
                context.tr('Document date'),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ZPColors.neutralsBlack,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const _FromDateFilter(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '-',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const _ToDateFilter(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '${context.tr('Amount range')} (${salesOrgConfig.currency.code})',
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
              (!state.filter.isAvailableCreditAmountValueRangeValid)
                  ? ValueRangeError(
                      label: '${(context.tr('Invalid Amount range'))}!',
                      isValid:
                          state.filter.isAvailableCreditAmountValueRangeValid,
                    )
                  : const SizedBox.shrink(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.fromDocumentDateField,
            onTap: () async {
              final availableCreditFilterBloc =
                  context.read<AvailableCreditFilterBloc>();
              final dateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 365)),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getDocumentDateFilterDateRange,
              );
              if (dateRange == null) return;
              availableCreditFilterBloc.add(
                AvailableCreditFilterEvent.setDocumentDate(
                  documentDateRange: dateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.documentDateFrom.dateString,
            ),
            decoration: InputDecoration(
              hintText: context.tr('Date from'),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            key: WidgetKeys.toDocumentDateField,
            onTap: () async {
              final availableCreditFilterBloc =
                  context.read<AvailableCreditFilterBloc>();
              final dateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime.now().subtract(const Duration(days: 364)),
                lastDate: DateTime.now(),
                initialDateRange: state.filter.getDocumentDateFilterDateRange,
              );
              if (dateRange == null) return;
              availableCreditFilterBloc.add(
                AvailableCreditFilterEvent.setDocumentDate(
                  documentDateRange: dateRange,
                ),
              );
            },
            readOnly: true,
            controller: TextEditingController(
              text: state.filter.documentDateTo.dateString,
            ),
            decoration: InputDecoration(
              hintText: context.tr('Date to'),
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
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueFrom,
            initialValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) => context.read<AvailableCreditFilterBloc>().add(
                  AvailableCreditFilterEvent.setAmountFrom(
                    amountFrom: value.isNotEmpty ? value : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText:
                  '${context.tr('From')} (${salesOrgConfig.currency.code})',
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
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        final salesOrgConfig =
            context.read<EligibilityBloc>().state.salesOrgConfigs;

        return Expanded(
          child: TextFormField(
            key: WidgetKeys.amountValueTo,
            initialValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) => context.read<AvailableCreditFilterBloc>().add(
                  AvailableCreditFilterEvent.setAmountTo(
                    amountTo: value.isNotEmpty ? value : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText:
                  '${context.tr('To')} (${salesOrgConfig.currency.code})',
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

class _ResetButton extends StatelessWidget {
  const _ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          context.read<AvailableCreditFilterBloc>().add(
                const AvailableCreditFilterEvent.initializeOrResetFilters(),
              );
          Navigator.of(context).pop(
            context
                .read<AvailableCreditFilterBloc>()
                .state
                .emptyAvailableCreditFilter,
          );
        },
        child: Text(
          context.tr('Reset'),
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
    return BlocBuilder<AvailableCreditFilterBloc, AvailableCreditFilterState>(
      buildWhen: (previous, current) => previous.filter != current.filter,
      builder: (context, state) {
        final lastAppliedFilter =
            context.read<AvailableCreditsBloc>().state.appliedFilter;
        final currentFilter = state.filter;
        final isEnable = lastAppliedFilter != currentFilter;

        return Expanded(
          child: ElevatedButton(
            key: WidgetKeys.filterApplyButton,
            onPressed: isEnable ? () => _onPressed(context: context) : null,
            child: Text(
              context.tr('Apply'),
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
        .read<AvailableCreditFilterBloc>()
        .state
        .filter
        .isAvailableCreditAmountValueRangeValid;
    isValid
        ? Navigator.of(context).pop(
            context.read<AvailableCreditFilterBloc>().state.filter,
          )
        : context.read<AvailableCreditFilterBloc>().add(
              const AvailableCreditFilterEvent.setValidationFailure(),
            );
  }
}
