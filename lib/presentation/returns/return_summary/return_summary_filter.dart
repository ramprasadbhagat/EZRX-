import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class ReturnSummaryFilterDrawer extends StatelessWidget {
  const ReturnSummaryFilterDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocConsumer<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting,
        listener: (context, state) {
          if (state.isSubmitting) {
            context.router.popForced();
          }
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                const _FilterHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    children: <Widget>[
                      const _ReturnIdByFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      _SubmittedDateFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        const _TotalPriceFromFilter(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'to',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const _TotalPriceToFilter(),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      (state.showErrorMessages &&
                              (!state.returnSummaryFilter
                                      .checkIfTotalRangeIsValid ||
                                  state.returnSummaryFilter
                                      .checkIfAnyRefundTotalIsEmpty))
                          ? const PriceRange()
                          : const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _ClearButton(),
                          _ApplyButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Apply Filters'),
      actions: [
        IconButton(
          key: const Key('filterCrossButton'),
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            context.router.popForced();
          },
        ),
      ],
    );
  }
}

class _ReturnIdByFilter extends StatelessWidget {
  const _ReturnIdByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.returnSummaryFilter.requestId !=
          current.returnSummaryFilter.requestId,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          initialValue:
              state.returnSummaryFilter.requestId.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnSummaryFilterBloc>().add(
                ReturnSummaryFilterEvent.returnIdChanged(
                  value,
                ),
              ),
          validator: (_) => state.returnSummaryFilter.requestId.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Return ID'.tr(),
          ),
        );
      },
    );
  }
}

class _TotalPriceToFilter extends StatelessWidget {
  const _TotalPriceToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.returnSummaryFilter.refundTotalTo !=
          current.returnSummaryFilter.refundTotalTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue:
                state.returnSummaryFilter.refundTotalTo.apiParameterValue,
            autocorrect: false,
            onChanged: (value) => context.read<ReturnSummaryFilterBloc>().add(
                  ReturnSummaryFilterEvent.refundTotalToChanged(
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
              labelText: 'Total Price To'.tr(),
            ),
          ),
        );
      },
    );
  }
}

class _TotalPriceFromFilter extends StatelessWidget {
  const _TotalPriceFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.returnSummaryFilter.refundTotalFrom !=
          current.returnSummaryFilter.refundTotalFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue:
                state.returnSummaryFilter.refundTotalFrom.apiParameterValue,
            autocorrect: false,
            onChanged: (value) => context.read<ReturnSummaryFilterBloc>().add(
                  ReturnSummaryFilterEvent.refundTotalFromChanged(
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
              labelText: 'Total Price From'.tr(),
            ),
          ),
        );
      },
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('filterClearButton'),
      onPressed: () {
        final returnSummaryFilterBloc = context.read<ReturnSummaryFilterBloc>();
        if (returnSummaryFilterBloc
            .state.returnSummaryFilter.anyFilterApplied) {
          returnSummaryFilterBloc.add(
            const ReturnSummaryFilterEvent.initialized(),
          );
        }
        context.router.pop();
      },
      child: Text(
        'Clear'.tr(),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ReturnSummaryFilterBloc>().add(
              const ReturnSummaryFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}

class _SubmittedDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      buildWhen: (previous, current) =>
          previous.returnSummaryFilter.getSubmittedDateFiltered !=
          current.returnSummaryFilter.getSubmittedDateFiltered,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterSubmittedDateField+${state.returnSummaryFilter.getSubmittedDateFiltered}',
          ),
          autocorrect: false,
          onTap: () async {
            final returnSummaryFilterBloc =
                context.read<ReturnSummaryFilterBloc>();
            final submittedDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(
                locator<Config>().dateRangePickerDuration,
              ),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.returnSummaryFilter.getSubmittedFilterDateRange,
              locale: context.read<SalesOrgBloc>().state.salesOrg.locale,
            );
            if (submittedDateRange == null) return;
            returnSummaryFilterBloc.add(
              ReturnSummaryFilterEvent.setSubmittedDate(
                submittedDateRange: submittedDateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.returnSummaryFilter.getSubmittedDateFiltered,
          decoration: InputDecoration(
            labelText: 'Submitted Date'.tr(),
            suffixIcon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_month,
                size: 20,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 25),
          ),
        );
      },
    );
  }
}

class PriceRange extends StatelessWidget {
  const PriceRange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<ReturnSummaryFilterBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        state.returnSummaryFilter.checkIfAnyRefundTotalIsEmpty
            ? 'Enter ${state.returnSummaryFilter.refundTotalFrom.isValid() ? 'Second' : 'First'} Refund Total!'
            : 'Invalid Refund Total Range!',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.error,
            ),
      ).tr(),
    );
  }
}
