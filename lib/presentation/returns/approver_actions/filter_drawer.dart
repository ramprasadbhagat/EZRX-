import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverReturnFilterDrawer extends StatelessWidget {
  const ApproverReturnFilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('approverReturnFilter'),
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocConsumer<ReturnApproverFilterBloc, ReturnApproverFilterState>(
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
            current.isSubmitting,
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
                      const _ReturnIdByFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      const _CreatedByFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      const _SoldToFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      const _ShipToFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      _InvoiceDateFilter(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
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
  const _FilterHeader();

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

class _ReturnIdByFilter extends StatelessWidget {
  const _ReturnIdByFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.approverReturnFilter.returnId !=
          current.approverReturnFilter.returnId,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterReturnIdField'),
          autocorrect: false,
          initialValue:
              state.approverReturnFilter.returnId.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.returnIdChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.returnId.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Return ID'.tr(),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            prefixIcon: const SizedBox.shrink(),
            prefixIconConstraints: const BoxConstraints.tightFor(width: 14),
          ),
        );
      },
    );
  }
}

class _CreatedByFilter extends StatelessWidget {
  const _CreatedByFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.approverReturnFilter.createdBy !=
          current.approverReturnFilter.createdBy,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterCreatedBy'),
          autocorrect: false,
          initialValue:
              state.approverReturnFilter.createdBy.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.createdByChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.createdBy.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Created By'.tr(),
            contentPadding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
            prefix: const SizedBox(width: 15),
          ),
        );
      },
    );
  }
}

class _ShipToFilter extends StatelessWidget {
  const _ShipToFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.approverReturnFilter.shipTo !=
          current.approverReturnFilter.shipTo,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('shipToSearchField'),
          autocorrect: false,
          initialValue: state.approverReturnFilter.shipTo.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.shipToChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.shipTo.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Ship To'.tr(),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            prefixIcon: const SizedBox.shrink(),
            prefixIconConstraints: const BoxConstraints.tightFor(width: 14),
          ),
        );
      },
    );
  }
}

class _SoldToFilter extends StatelessWidget {
  const _SoldToFilter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.approverReturnFilter.soldTo !=
          current.approverReturnFilter.soldTo,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('soldToSearchField'),
          autocorrect: false,
          initialValue: state.approverReturnFilter.soldTo.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.soldToChanged(value),
              ),
          validator: (_) => state.approverReturnFilter.soldTo.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Please enter at least 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Sold To'.tr(),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            prefixIcon: const SizedBox.shrink(),
            prefixIconConstraints: const BoxConstraints.tightFor(width: 14),
          ),
        );
      },
    );
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('filterClearButton'),
      onPressed: () {
        final returnApproverFilterBloc =
            context.read<ReturnApproverFilterBloc>();
        if (!returnApproverFilterBloc.state.approverReturnFilterIsEmpty) {
          returnApproverFilterBloc.add(
            const ReturnApproverFilterEvent.initialized(),
          );
        }
        context.router.popForced();
      },
      child: Text(
        context.tr('Clear'),
        style: const TextStyle(color: ZPColors.primary),
      ),
    );
  }
}

class _ApplyButton extends StatelessWidget {
  const _ApplyButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('filterApplyButton'),
      onPressed: () => context.read<ReturnApproverFilterBloc>().add(
            const ReturnApproverFilterEvent.applyFilters(),
          ),
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}

class _InvoiceDateFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      buildWhen: (previous, current) =>
          previous.approverReturnFilter.getInvoiceFilterDateRange !=
          current.approverReturnFilter.getInvoiceFilterDateRange,
      builder: (context, state) {
        return TextFormField(
          key: Key(
            'filterInvoiceDateField+${state.approverReturnFilter.getFilteredInvoiceDate}',
          ),
          autocorrect: false,
          onTap: () async {
            final returnApproverFilterBloc =
                context.read<ReturnApproverFilterBloc>();
            final invoiceDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(
                locator<Config>().dateRangePickerDuration,
              ),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.approverReturnFilter.getInvoiceFilterDateRange,
            );
            if (invoiceDateRange == null) return;
            returnApproverFilterBloc.add(
              ReturnApproverFilterEvent.setInvoiceDate(
                invoiceDateRange,
              ),
            );
          },
          readOnly: true,
          initialValue: state.approverReturnFilter.getFilteredInvoiceDate,
          decoration: InputDecoration(
            labelText: 'Invoice Date'.tr(),
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
