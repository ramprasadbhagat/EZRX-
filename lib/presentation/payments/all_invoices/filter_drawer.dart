import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/domain/payments/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _decimalOnlyRegx = RegExp(r'^\d+\.?\d{0,10}');

class AllInvoicesFilterDrawer extends StatelessWidget {
  const AllInvoicesFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('allInvoicesFilter'),
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocConsumer<AllInvoicesFilterBloc, AllInvoicesFilterState>(
        listenWhen: (previous, current) =>
            previous.changed != current.changed && current.changed,
        listener: (context, state) {
          context.router.popForced();
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
                      _DueDateFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      const _DocumentNumberByFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      _DocumentDateFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        const _DebitValueFromFilter(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'to',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        const _DebitValueToFilter(),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      (state.showErrorMessages &&
                              !state.allInvoicesFilter.isDebitValueRangeValid)
                          ? const DebitValueRangeError()
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 20,
                      ),
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

class DebitValueRangeError extends StatelessWidget {
  const DebitValueRangeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<AllInvoicesFilterBloc>().state;

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        state.allInvoicesFilter.checkIfAnyDebitValueIsEmpty
            ? 'Enter ${state.allInvoicesFilter.debitValueFrom.isValid() ? 'Second' : 'First'} Debit Value!'
            : 'Invalid Debit Value Range!',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall?.apply(
              color: ZPColors.error,
            ),
      ).tr(),
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

class _DocumentNumberByFilter extends StatelessWidget {
  const _DocumentNumberByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.allInvoicesFilter.documentNumber !=
          current.allInvoicesFilter.documentNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterDocumentNumberField'),
          initialValue:
              state.allInvoicesFilter.documentNumber.getOrDefaultValue(''),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Only digits
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            // limit charcter length to 10
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (value) => context.read<AllInvoicesFilterBloc>().add(
                AllInvoicesFilterEvent.documentNumberChanged(
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

class _DebitValueToFilter extends StatelessWidget {
  const _DebitValueToFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.allInvoicesFilter.debitValueTo !=
          current.allInvoicesFilter.debitValueTo,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue: state.allInvoicesFilter.debitValueTo.doubleToString,
            onChanged: (value) => context.read<AllInvoicesFilterBloc>().add(
                  AllInvoicesFilterEvent.debitValueToChanged(
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
              labelText: 'Debit Value To'.tr(),
            ),
          ),
        );
      },
    );
  }
}

class _DebitValueFromFilter extends StatelessWidget {
  const _DebitValueFromFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.allInvoicesFilter.debitValueFrom !=
          current.allInvoicesFilter.debitValueFrom,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            initialValue: state.allInvoicesFilter.debitValueFrom.doubleToString,
            onChanged: (value) => context.read<AllInvoicesFilterBloc>().add(
                  AllInvoicesFilterEvent.debitValueFromChanged(
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
              labelText: 'Debit Value From'.tr(),
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
        if (context.read<AllInvoicesFilterBloc>().state.clearNeeded) {
          context.read<AllInvoicesFilterBloc>().add(
                const AllInvoicesFilterEvent.clearFilters(),
              );
        } else {
          context.router.popForced();
        }
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
        context.read<AllInvoicesFilterBloc>().add(
              const AllInvoicesFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}

class _DueDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.allInvoicesFilter.getDueDateFilterDateRange !=
          current.allInvoicesFilter.getDueDateFilterDateRange,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterDueDateField+${state.allInvoicesFilter.getFilteredDueDate}',
          ),
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final dueDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.allInvoicesFilter.getDueDateFilterDateRange,
            );
            if (dueDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDueDate(
                dueDateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.allInvoicesFilter.getFilteredDueDate,
          decoration: InputDecoration(
            labelText: 'Due Date'.tr(),
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

class _DocumentDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllInvoicesFilterBloc, AllInvoicesFilterState>(
      buildWhen: (previous, current) =>
          previous.allInvoicesFilter.getDocumentDateFilterDateRange !=
          current.allInvoicesFilter.getDocumentDateFilterDateRange,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterDocumentDateField+${state.allInvoicesFilter.getFilteredDocumentDate}',
          ),
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<AllInvoicesFilterBloc>();
            final documentDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.allInvoicesFilter.getDocumentDateFilterDateRange,
            );
            if (documentDateRange == null) return;
            returnApproverFilterBloc.add(
              AllInvoicesFilterEvent.setDocumentDate(
                documentDateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.allInvoicesFilter.getFilteredDocumentDate,
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
