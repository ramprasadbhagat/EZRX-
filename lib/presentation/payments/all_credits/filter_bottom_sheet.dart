import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_numeric_text_field.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';

class AllCreditsFilterBottomSheet extends StatelessWidget {
  final bool isMarketPlace;

  const AllCreditsFilterBottomSheet({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            key: WidgetKeys.tempFilter,
            children: <Widget>[
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
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          context.tr('Document date'),
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
                        padding: const EdgeInsets.only(bottom: 16.0, top: 24.0),
                        child: Text(
                          context.tr('Amount range'),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _AmountValueFromFilter(),
                          Padding(
                            padding: const EdgeInsets.all(8),
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
                              valueName: context.tr('Amount'),
                              isValid: state.filter.isAmountValueRangeValid,
                            )
                          : const SizedBox.shrink(),
                      if (!context.read<EligibilityBloc>().state.isIDMarket)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16.0, top: 24.0),
                              child: Text(
                                context.tr('Status'),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                            const _StatusesSelector(),
                          ],
                        ),
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          _ResetButton(),
                          SizedBox(width: 16),
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
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.filterStatuses != current.filter.filterStatuses,
      builder: (
        context,
        state,
      ) {
        return Column(
          children: state.statuses.map((String status) {
            final value = state.filter.filterStatuses.contains(status);

            return CheckboxListTile(
              key: WidgetKeys.accountCreditsItemStatus(
                status,
                value,
              ),
              contentPadding: EdgeInsets.zero,
              title: Text(
                status,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: (bool? value) {
                context.read<AllCreditsFilterBloc>().add(
                      AllCreditsFilterEvent.statusChanged(
                        status,
                        value ?? false,
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
        isValid
            ? ''
            : '${context.tr('Invalid')} $valueName ${context.tr('range')}!',
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.error,
            ),
      ),
    );
  }
}

class _AmountValueToFilter extends StatelessWidget {
  const _AmountValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueTo != current.filter.amountValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: CustomNumericTextField.decimalNumber(
            autoCorrect: false,
            fieldKey: WidgetKeys.amountValueTo,
            initValue: state.filter.amountValueTo.apiParameterValue,
            onChanged: (value) => context.read<AllCreditsFilterBloc>().add(
                  AllCreditsFilterEvent.amountValueToChanged(
                    value,
                  ),
                ),
            decoration: InputDecoration(
              labelText: context.tr('Amount to'),
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
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.amountValueFrom != current.filter.amountValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: CustomNumericTextField.decimalNumber(
            autoCorrect: false,
            fieldKey: WidgetKeys.amountValueFrom,
            initValue: state.filter.amountValueFrom.apiParameterValue,
            onChanged: (value) => context.read<AllCreditsFilterBloc>().add(
                  AllCreditsFilterEvent.amountValueFromChanged(value),
                ),
            decoration: InputDecoration(
              hintText: context.tr('Amount from'),
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
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.fromDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllCreditsFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllCreditsFilterEvent.setDocumentDate(
                documentDateRange,
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
      ),
    );
  }
}

class _ToDocumentDateFilter extends StatelessWidget {
  const _ToDocumentDateFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.filter.getDocumentDateFilterDateRange !=
          current.filter.getDocumentDateFilterDateRange,
      builder: (context, state) => Expanded(
        child: TextFormField(
          autocorrect: false,
          key: WidgetKeys.toDocumentDateField,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllCreditsFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDateRange: state.filter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllCreditsFilterEvent.setDocumentDate(
                documentDateRange,
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
      ),
    );
  }
}

class _ResetButton extends StatelessWidget {
  const _ResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        key: WidgetKeys.filterResetButton,
        onPressed: () {
          if (context.read<AllCreditsFilterBloc>().state.filter.excludeSearch !=
              AllCreditsFilter.defaultFilter()) {
            context.allCreditsBloc(context.isMPPayment).add(
                  AllCreditsEvent.fetch(
                    appliedFilter: AllCreditsFilter.defaultFilter().copyWith(
                      searchKey: context
                          .allCreditsBloc(context.isMPPayment)
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
          context.tr('Reset'),
          style: const TextStyle(color: ZPColors.primary),
        ),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        key: WidgetKeys.filterApplyButton,
        onPressed: () {
          final filterBloc = context.read<AllCreditsFilterBloc>();
          filterBloc.add(
            const AllCreditsFilterEvent.validateFilters(),
          );
          if (filterBloc.state.filter.isValid) {
            if (filterBloc.state.filter !=
                context
                    .allCreditsBloc(context.isMPPayment)
                    .state
                    .appliedFilter) {
              context.allCreditsBloc(context.isMPPayment).add(
                    AllCreditsEvent.fetch(
                      appliedFilter: filterBloc.state.filter,
                    ),
                  );
            }
            context.router.popForced();
          }
        },
        child: Text(
          context.tr('Apply'),
          style: const TextStyle(color: ZPColors.white),
        ),
      ),
    );
  }
}
