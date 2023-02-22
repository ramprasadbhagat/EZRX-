import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ApproverReturnFilterDrawer extends StatelessWidget {
  const ApproverReturnFilterDrawer({Key? key}) : super(key: key);

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
                      Row(
                        children: [
                          const _FromInvoiceDateFilter(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'to',
                              style: Theme.of(context).textTheme.titleSmall,
                            ).tr(),
                          ),
                          const _ToInvoiceDateFilter(),
                        ],
                      ),
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

class _ReturnIdByFilter extends StatelessWidget {
  const _ReturnIdByFilter({Key? key}) : super(key: key);

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
          initialValue:
              state.approverReturnFilter.returnId.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.returnIdChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.returnId.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
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

class _CreatedByFilter extends StatelessWidget {
  const _CreatedByFilter({Key? key}) : super(key: key);

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
          initialValue:
              state.approverReturnFilter.createdBy.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.createdByChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.createdBy.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Created By'.tr(),
          ),
        );
      },
    );
  }
}

class _ShipToFilter extends StatelessWidget {
  const _ShipToFilter({Key? key}) : super(key: key);

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
          initialValue: state.approverReturnFilter.shipTo.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.shipToChanged(
                  value,
                ),
              ),
          validator: (_) => state.approverReturnFilter.shipTo.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Ship To'.tr(),
          ),
        );
      },
    );
  }
}

class _SoldToFilter extends StatelessWidget {
  const _SoldToFilter({Key? key}) : super(key: key);

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
          initialValue: state.approverReturnFilter.soldTo.getOrDefaultValue(''),
          onChanged: (value) => context.read<ReturnApproverFilterBloc>().add(
                ReturnApproverFilterEvent.soldToChanged(value),
              ),
          validator: (_) => state.approverReturnFilter.soldTo.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Sold To'.tr(),
          ),
        );
      },
    );
  }
}

class _FromInvoiceDateFilter extends StatefulWidget {
  const _FromInvoiceDateFilter({Key? key}) : super(key: key);

  @override
  State<_FromInvoiceDateFilter> createState() => __FromInvoiceDateFilterState();
}

class __FromInvoiceDateFilterState extends State<_FromInvoiceDateFilter> {
  late TextEditingController fromDateTextController;
  late ReturnApproverFilterBloc returnApproverFilterBloc;

  @override
  void initState() {
    fromDateTextController = TextEditingController();
    returnApproverFilterBloc = context.read<ReturnApproverFilterBloc>();
    final fromInvoiceDate =
        returnApproverFilterBloc.state.approverReturnFilter.fromInvoiceDate;
    final toInvoiceDate =
        returnApproverFilterBloc.state.approverReturnFilter.toInvoiceDate;
    if (fromInvoiceDate.isValid() && toInvoiceDate.isValid()) {
      fromDateTextController.text = DateFormat('dd/MM/yyyy').format(
        fromInvoiceDate.dateTimebyDateString,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    fromDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      listenWhen: (previous, current) =>
          previous.approverReturnFilter.fromInvoiceDate !=
              current.approverReturnFilter.fromInvoiceDate ||
          previous.approverReturnFilter.toInvoiceDate !=
              current.approverReturnFilter.toInvoiceDate,
      listener: (context, state) {
        final fromInvoiceDate = state.approverReturnFilter.fromInvoiceDate;
        if (fromInvoiceDate.isValid()) {
          fromDateTextController.text = DateFormat('dd/MM/yyyy').format(
            state.approverReturnFilter.fromInvoiceDate.dateTimebyDateString,
          );
        }
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filterFromDateField'),
          onTap: () async {
            final toInvoiceDate = returnApproverFilterBloc
                .state.approverReturnFilter.toInvoiceDate;

            final fromInvoiceDate = returnApproverFilterBloc
                .state.approverReturnFilter.fromInvoiceDate;

            final initialDate = fromInvoiceDate.isValid()
                ? fromInvoiceDate.dateTimebyDateString
                : toInvoiceDate.dateTimebyDateString;
                
            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: toInvoiceDate.dateTimebyDateString
                  .subtract(const Duration(days: 365)),
              lastDate: toInvoiceDate.dateTimebyDateString,
            );
            if (orderDate == null) return;
            returnApproverFilterBloc.add(
              ReturnApproverFilterEvent.setfromInvoiceDate(
                fromDate: orderDate,
              ),
            );
          },
          validator: (_) {
            final approverReturnFilterList = context
                .read<ReturnApproverFilterBloc>()
                .state
                .approverReturnFilter;

            return approverReturnFilterList.toInvoiceDate.value.fold(
              (l) => null,
              (r) {
                return approverReturnFilterList.fromInvoiceDate.value.fold(
                  (l) => 'Invalid Date'.tr(),
                  (r) => null,
                );
              },
            );
          },
          readOnly: true,
          controller: fromDateTextController,
          decoration: InputDecoration(
            labelText: 'From Date'.tr(),
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
      ),
    );
  }
}

class _ToInvoiceDateFilter extends StatefulWidget {
  const _ToInvoiceDateFilter({Key? key}) : super(key: key);

  @override
  State<_ToInvoiceDateFilter> createState() => _ToInvoiceDateFilterState();
}

class _ToInvoiceDateFilterState extends State<_ToInvoiceDateFilter> {
  late TextEditingController toDateTextController;
  late ReturnApproverFilterBloc returnApproverFilterBloc;

  @override
  void initState() {
    toDateTextController = TextEditingController();
    returnApproverFilterBloc = context.read<ReturnApproverFilterBloc>();
    final toInvoiceDate =
        returnApproverFilterBloc.state.approverReturnFilter.toInvoiceDate;
    final fromInvoiceDate =
        returnApproverFilterBloc.state.approverReturnFilter.fromInvoiceDate;
    if (toInvoiceDate.isValid() && fromInvoiceDate.isValid()) {
      toDateTextController.text = DateFormat('dd/MM/yyyy').format(
        returnApproverFilterBloc
            .state.approverReturnFilter.toInvoiceDate.dateTimebyDateString,
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    toDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnApproverFilterBloc, ReturnApproverFilterState>(
      listenWhen: (previous, current) =>
          previous.approverReturnFilter.toInvoiceDate !=
              current.approverReturnFilter.toInvoiceDate ||
          previous.approverReturnFilter.fromInvoiceDate !=
              current.approverReturnFilter.fromInvoiceDate,
      listener: (
        context,
        state,
      ) {
        if (!state.approverReturnFilter.toInvoiceDate.isValid()) return;
        toDateTextController.text = DateFormat('dd/MM/yyyy').format(
          state.approverReturnFilter.toInvoiceDate.dateTimebyDateString,
        );
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filterToDateField'),
          onTap: () async {
            final toInvoiceDate = returnApproverFilterBloc
                .state.approverReturnFilter.toInvoiceDate;

            final fromInvoiceDate = returnApproverFilterBloc
                .state.approverReturnFilter.fromInvoiceDate;

            final initialDate = toInvoiceDate.isValid()
                ? toInvoiceDate.dateTimebyDateString
                : DateTime.now();

            final firstDate = fromInvoiceDate
                    .isValid()
                ? fromInvoiceDate.dateTimebyDateString
                : DateTime.now().subtract(const Duration(days: 360));

            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: DateTime.now(),
            );
            if (orderDate == null) return;
            returnApproverFilterBloc.add(
              ReturnApproverFilterEvent.setToInvoiceDate(
                toDate: orderDate,
              ),
            );
          },
          validator: (_) {
            final approverReturnFilterList = context
                .read<ReturnApproverFilterBloc>()
                .state
                .approverReturnFilter;

            return approverReturnFilterList.fromInvoiceDate.value.fold(
              (l) => null,
              (r) {
                return approverReturnFilterList.toInvoiceDate.value.fold(
                  (l) => 'Invalid Date'.tr(),
                  (r) => null,
                );
              },
            );
          },
          readOnly: true,
          controller: toDateTextController,
          decoration: InputDecoration(
            labelText: 'To Date'.tr(),
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
      ),
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
        final returnApproverFilterBloc =
            context.read<ReturnApproverFilterBloc>();
        if (returnApproverFilterBloc.state.approverReturnFilter !=
            ReturnApproverFilter.empty()) {
          returnApproverFilterBloc.add(
            const ReturnApproverFilterEvent.initialized(),
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
      onPressed: () async {
        context.read<ReturnApproverFilterBloc>().add(
              const ReturnApproverFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
