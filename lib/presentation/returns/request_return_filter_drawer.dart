import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/request_return_filter/request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class RequestReturnFilterDrawer extends StatelessWidget {
  const RequestReturnFilterDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        key: const Key('requestReturnFilter'),
        child: BlocConsumer<RequestReturnFilterBloc, RequestReturnFilterState>(
          listenWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            if (state.isSubmitting) {
              context.router.popForced();
            }
          },
          buildWhen: (previous, current) => previous != current,
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
                        const _AssignmentNumberByFilter(),
                        const SizedBox(
                          height: 16,
                        ),
                        const _BatchNumberFilter(),
                        const SizedBox(
                          height: 16,
                        ),
                        const _MaterialDescriptionSearchByFilter(),
                        const SizedBox(
                          height: 16,
                        ),
                        const _MaterialNumberSearchByFilter(),
                        const SizedBox(
                          height: 16,
                        ),
                        const _PrincipalSearchByFilter(),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const _InvoiceFromDateByFilter(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'to',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                            const _InvoiceToDateByFilter(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            _ClearButton(),
                            SizedBox(
                              width: 30,
                            ),
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
      title: Text('Filter Request Return'.tr()),
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

class _AssignmentNumberByFilter extends StatelessWidget {
  const _AssignmentNumberByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.requestReturnFilter.assignmentNumber !=
          current.requestReturnFilter.assignmentNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterInvoiceNumberField'),
          initialValue:
              state.requestReturnFilter.assignmentNumber.getOrDefaultValue(''),
          onChanged: (value) => context.read<RequestReturnFilterBloc>().add(
                RequestReturnFilterEvent.assignmentNumberChanged(
                  value,
                ),
              ),
          validator: (_) =>
              state.requestReturnFilter.assignmentNumber.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Enter at least 3 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Invoice Number'.tr(),
          ),
        );
      },
    );
  }
}

class _BatchNumberFilter extends StatelessWidget {
  const _BatchNumberFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.requestReturnFilter.batch !=
          current.requestReturnFilter.batch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterBatchNumberField'),
          initialValue: state.requestReturnFilter.batch.getOrDefaultValue(''),
          onChanged: (value) => context.read<RequestReturnFilterBloc>().add(
                RequestReturnFilterEvent.batchChanged(
                  value,
                ),
              ),
          validator: (_) => state.requestReturnFilter.batch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Enter at least 3 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Batch Number'.tr(),
          ),
        );
      },
    );
  }
}

class _MaterialDescriptionSearchByFilter extends StatelessWidget {
  const _MaterialDescriptionSearchByFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.requestReturnFilter.materialDescription !=
          current.requestReturnFilter.materialDescription,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterMaterialDescriptionField'),
          initialValue: state.requestReturnFilter.materialDescription
              .getOrDefaultValue(''),
          onChanged: (value) => context.read<RequestReturnFilterBloc>().add(
                RequestReturnFilterEvent.materialDescriptionSearchChanged(
                  value,
                ),
              ),
          validator: (_) =>
              state.requestReturnFilter.materialDescription.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Enter at least 3 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Material Description'.tr(),
          ),
        );
      },
    );
  }
}

class _MaterialNumberSearchByFilter extends StatelessWidget {
  const _MaterialNumberSearchByFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.requestReturnFilter.materialNumber !=
          current.requestReturnFilter.materialNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterMaterialNumberSearchField'),
          initialValue:
              state.requestReturnFilter.materialNumber.getOrDefaultValue(''),
          onChanged: (value) => context.read<RequestReturnFilterBloc>().add(
                RequestReturnFilterEvent.materialNumberSearchChanged(
                  value,
                ),
              ),
          validator: (_) => state.requestReturnFilter.materialNumber.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Enter at least 3 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Material Number'.tr(),
          ),
        );
      },
    );
  }
}

class _PrincipalSearchByFilter extends StatelessWidget {
  const _PrincipalSearchByFilter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestReturnFilterBloc, RequestReturnFilterState>(
      buildWhen: (previous, current) =>
          previous.requestReturnFilter.principalSearch !=
          current.requestReturnFilter.principalSearch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterPrincipalSearchField'),
          initialValue:
              state.requestReturnFilter.principalSearch.getOrDefaultValue(''),
          onChanged: (value) => context.read<RequestReturnFilterBloc>().add(
                RequestReturnFilterEvent.principalSearchChanged(value),
              ),
          validator: (_) =>
              state.requestReturnFilter.principalSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) => 'Enter at least 3 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Principal Code/Name'.tr(),
          ),
        );
      },
    );
  }
}

class _InvoiceFromDateByFilter extends StatefulWidget {
  const _InvoiceFromDateByFilter({Key? key}) : super(key: key);
  @override
  State<_InvoiceFromDateByFilter> createState() =>
      __InvoiceFromDateByFilterState();
}

class __InvoiceFromDateByFilterState extends State<_InvoiceFromDateByFilter> {
  late TextEditingController txtfromDateController;
  late RequestReturnFilterBloc requestReturnFilterBloc;

  @override
  void initState() {
    txtfromDateController = TextEditingController();
    requestReturnFilterBloc = context.read<RequestReturnFilterBloc>();
    txtfromDateController.text = requestReturnFilterBloc
        .state.requestReturnFilter.fromInvoiceDate.toValidDateString;

    super.initState();
  }

  @override
  void dispose() {
    txtfromDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestReturnFilterBloc, RequestReturnFilterState>(
      listenWhen: (previous, current) =>
          previous.requestReturnFilter.fromInvoiceDate !=
              current.requestReturnFilter.fromInvoiceDate ||
          previous.requestReturnFilter.toInvoiceDate !=
              current.requestReturnFilter.toInvoiceDate,
      listener: (context, state) {
        txtfromDateController.text =
            state.requestReturnFilter.fromInvoiceDate.toValidDateString;
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filteInvoiceFromdateField'),
          onTap: () async {
            final state = context.read<RequestReturnFilterBloc>().state;
            final fromDateTime =
                state.requestReturnFilter.fromInvoiceDate.dateTimeByDateString;
            final toDateTime =
                state.requestReturnFilter.toInvoiceDate.dateTimeByDateString;
            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: fromDateTime,
              firstDate: fromDateTime.subtract(const Duration(days: 1460)),
              lastDate: toDateTime,
            );
            requestReturnFilterBloc.add(
              RequestReturnFilterEvent.setInvoicefromDate(
                fromInvoiceDate: DateTimeStringValue(
                  getDateStringByDateTime(orderDate!),
                ),
              ),
            );
          },
          readOnly: true,
          controller: txtfromDateController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelText: 'Invoice From Date'.tr(),
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

class _InvoiceToDateByFilter extends StatefulWidget {
  const _InvoiceToDateByFilter({Key? key}) : super(key: key);
  @override
  State<_InvoiceToDateByFilter> createState() => __InvoiceToDateByFilterState();
}

class __InvoiceToDateByFilterState extends State<_InvoiceToDateByFilter> {
  late TextEditingController txttoDateController;
  late RequestReturnFilterBloc requestReturnFilterBloc;
  @override
  void initState() {
    txttoDateController = TextEditingController();
    requestReturnFilterBloc = context.read<RequestReturnFilterBloc>();
    txttoDateController.text = requestReturnFilterBloc
        .state.requestReturnFilter.toInvoiceDate.toValidDateString;

    super.initState();
  }

  @override
  void dispose() {
    txttoDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestReturnFilterBloc, RequestReturnFilterState>(
      listenWhen: (previous, current) =>
          previous.requestReturnFilter.toInvoiceDate !=
              current.requestReturnFilter.toInvoiceDate ||
          previous.requestReturnFilter.fromInvoiceDate !=
              current.requestReturnFilter.fromInvoiceDate,
      listener: (
        context,
        state,
      ) {
        txttoDateController.text =
            state.requestReturnFilter.toInvoiceDate.toValidDateString;
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filterInvoiceTodateField'),
          onTap: () async {
            final state = context.read<RequestReturnFilterBloc>().state;
            final toExpiryDate =
                state.requestReturnFilter.toInvoiceDate.dateTimeByDateString;
            final fromExpiryDate =
                state.requestReturnFilter.fromInvoiceDate.dateTimeByDateString;
            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: toExpiryDate,
              firstDate: fromExpiryDate,
              lastDate: DateTime.now(),
            );

            requestReturnFilterBloc.add(
              RequestReturnFilterEvent.setInvoiceToDate(
                toInvoiceDate: DateTimeStringValue(
                  getDateStringByDateTime(orderDate!),
                ),
              ),
            );
          },
          readOnly: true,
          controller: txttoDateController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelText: 'Invoice To Date'.tr(),
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
        context.read<RequestReturnFilterBloc>().add(
              const RequestReturnFilterEvent.initialized(),
            );
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
        context.read<RequestReturnFilterBloc>().add(
              const RequestReturnFilterEvent.filterRequestReturn(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
