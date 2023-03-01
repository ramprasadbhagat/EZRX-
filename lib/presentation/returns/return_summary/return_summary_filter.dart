import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
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
                      const _SubmittedDateFilter(),
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
                      state.showErrorMessages
                          ? const PriceRangeError()
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
              subceedLength: (f) =>
                  'Search input must be greater than 3 characters.'.tr(),
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
                state.returnSummaryFilter.refundTotalTo.doubleToString,
            onChanged: (value) => context.read<ReturnSummaryFilterBloc>().add(
                  ReturnSummaryFilterEvent.refundTotalToChanged(
                    value.isNotEmpty
                        ? double.parse(value).toStringAsFixed(2)
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
                state.returnSummaryFilter.refundTotalFrom.doubleToString,
            onChanged: (value) => context.read<ReturnSummaryFilterBloc>().add(
                  ReturnSummaryFilterEvent.refundTotalFromChanged(
                    value.isNotEmpty
                        ? double.parse(value).toStringAsFixed(2)
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

class _SubmittedDateFilter extends StatefulWidget {
  const _SubmittedDateFilter({Key? key}) : super(key: key);

  @override
  State<_SubmittedDateFilter> createState() => _SubmittedDateFilterState();
}

class _SubmittedDateFilterState extends State<_SubmittedDateFilter> {
  late TextEditingController submittedDateTextController;
  late ReturnSummaryFilterBloc returnSummaryFilterBloc;

  @override
  void initState() {
    submittedDateTextController = TextEditingController();
    returnSummaryFilterBloc = context.read<ReturnSummaryFilterBloc>();

    submittedDateTextController = TextEditingController()
      ..text = returnSummaryFilterBloc
          .state.returnSummaryFilter.getSubmittedDateFiltered;
    super.initState();
  }

  @override
  void dispose() {
    submittedDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      listenWhen: (previous, current) =>
          previous.returnSummaryFilter.getSubmittedDateFiltered !=
          current.returnSummaryFilter.getSubmittedDateFiltered,
      listener: (
        context,
        state,
      ) {
        submittedDateTextController.text =
            state.returnSummaryFilter.getSubmittedDateFiltered;
      },
      child: TextFormField(
        onTap: () async {
          final state = context.read<ReturnSummaryFilterBloc>().state;

          final submiteDateRange = await showDateRangePicker(
            context: context,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now(),
            initialDateRange:
                state.returnSummaryFilter.getSubmittedFilterDateRange,
          );
          if (submiteDateRange == null || !mounted) return;
          context.read<ReturnSummaryFilterBloc>().add(
                ReturnSummaryFilterEvent.setSubmittedDate(
                  submittedDateRange: submiteDateRange,
                ),
              );
        },
        readOnly: true,
        controller: submittedDateTextController,
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
      ),
    );
  }
}

class PriceRangeError extends StatelessWidget {
  const PriceRangeError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnSummaryFilterBloc, ReturnSummaryFilterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            state.returnSummaryFilter.refundTotalValueRangeAnyEmpty
                ? 'Enter ${state.returnSummaryFilter.refundTotalFrom.isValid() ? 'Second' : 'First'} Refund Total!'
                : 'Invalid Refund Total Range!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall?.apply(
                  color: ZPColors.error,
                ),
          ).tr(),
        );
      },
    );
  }
}
