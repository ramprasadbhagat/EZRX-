//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class AllCreditsFilterDrawer extends StatelessWidget {
  const AllCreditsFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('allCreditsFilter'),
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocConsumer<AllCreditsFilterBloc, AllCreditsFilterState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
            current.isSubmitting,
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
              children: <Widget>[
                const _FilterHeader(),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    children: <Widget>[
                      const _DocumentNumberByFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      _DocumentDateFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        const _CreditAmountFromFilter(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'to',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const _CreditAmountToFilter(),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      (state.showErrorMessages &&
                              !state.allCreditsFilter.areFiltersValid)
                          ? const CreditAmountRangeError()
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
      title: const Text('Apply Filters').tr(),
      actions: <Widget>[
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

class CreditAmountRangeError extends StatelessWidget {
  const CreditAmountRangeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<AllCreditsFilterBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        // TODO: will revisit and enhance this
        state.allCreditsFilter.checkIfAnyCreditAmountIsEmpty
            ? 'Enter ${state.allCreditsFilter.creditAmountFrom.isValid() ? 'Second' : 'First'} Credit Amount!'
            : 'Invalid Credit Amount Range!',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.error,
            ),
      ).tr(),
    );
  }
}

class _DocumentNumberByFilter extends StatelessWidget {
  const _DocumentNumberByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.allCreditsFilter.documentNumber !=
          current.allCreditsFilter.documentNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterDocumentNumberField'),
          initialValue:
              state.allCreditsFilter.documentNumber.getOrDefaultValue(''),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (value) => context.read<AllCreditsFilterBloc>().add(
                AllCreditsFilterEvent.documentNumberChanged(
                  DocumentNumber(value),
                ),
              ),
          decoration: InputDecoration(
            labelText: 'Document Number'.tr(),
          ),
        );
      },
    );
  }
}

class _DocumentDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.allCreditsFilter.getDocumentDateFilterDateRange !=
          current.allCreditsFilter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterDocumentDateField+${state.allCreditsFilter.getFilteredDocumentDate}',
          ),
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllCreditsFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(
                locator<Config>().dateRangePickerDuration,
              ),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.allCreditsFilter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllCreditsFilterEvent.setDocumentDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.allCreditsFilter.getFilteredDocumentDate,
          decoration: InputDecoration(
            labelText: 'Document Date'.tr(),
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

class _CreditAmountToFilter extends StatelessWidget {
  const _CreditAmountToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.allCreditsFilter.creditAmountTo !=
          current.allCreditsFilter.creditAmountTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue:
                state.allCreditsFilter.creditAmountTo.apiParameterValue,
            onChanged: (value) => context.read<AllCreditsFilterBloc>().add(
                  AllCreditsFilterEvent.creditAmountToChanged(
                    value.isNotEmpty ? value : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: 'Credit Amount To'.tr(),
            ),
          ),
        );
      },
    );
  }
}

class _CreditAmountFromFilter extends StatelessWidget {
  const _CreditAmountFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCreditsFilterBloc, AllCreditsFilterState>(
      buildWhen: (previous, current) =>
          previous.allCreditsFilter.creditAmountFrom !=
          current.allCreditsFilter.creditAmountFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue:
                state.allCreditsFilter.creditAmountFrom.apiParameterValue,
            onChanged: (value) => context.read<AllCreditsFilterBloc>().add(
                  AllCreditsFilterEvent.creditAmountFromChanged(
                    value.isNotEmpty ? value : '',
                  ),
                ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(_decimalOnlyRegx),
            ],
            decoration: InputDecoration(
              labelText: 'Credit Amount From'.tr(),
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
        final allCreditsBloc = context.read<AllCreditsFilterBloc>();
        if (allCreditsBloc.state.allCreditsFilter.anyFilterApplied) {
          context.read<AllCreditsFilterBloc>().add(
                const AllCreditsFilterEvent.clearFilters(),
              );
        }
        context.router.popForced();
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
      key: const Key('filterApplyButton'),
      onPressed: () {
        context.read<AllCreditsFilterBloc>().add(
              const AllCreditsFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
