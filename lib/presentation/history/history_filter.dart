import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderHistoryFilterDrawer extends StatelessWidget {
  const OrderHistoryFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: BlocConsumer<OrderHistoryFilterBloc, OrderHistoryFilterState>(
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
                  children: <Widget>[
                    const _FilterHeader(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _OrderIdByFilter(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _PoNumberFilter(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _MaterialSearchByFilter(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _PrincipalSearchByFilter(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      const _OrderFromDateByFilter(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'to',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      const _OrderToDateByFilter(),
                    ]),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Filter Order History'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
      ),
    );
  }
}

class _OrderIdByFilter extends StatelessWidget {
  const _OrderIdByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.orderId !=
          current.orderHistoryFilterList.orderId,
      builder: (context, state) {
        return TextFormField(
          key: const Key('filterOrderIdField'),
          initialValue:
              state.orderHistoryFilterList.orderId.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.orderIdChanged(
                  value,
                ),
              ),
          validator: (_) => state.orderHistoryFilterList.orderId.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Order ID'.tr(),
          ),
        );
      },
    );
  }
}

class _PoNumberFilter extends StatelessWidget {
  const _PoNumberFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.poNumber !=
          current.orderHistoryFilterList.poNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterPoNumberField'),
          initialValue:
              state.orderHistoryFilterList.poNumber.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.poNumberChanged(
                  value,
                ),
              ),
          validator: (_) => state.orderHistoryFilterList.poNumber.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'PO Number'.tr(),
          ),
        );
      },
    );
  }
}

class _MaterialSearchByFilter extends StatelessWidget {
  const _MaterialSearchByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.materialSearch !=
          current.orderHistoryFilterList.materialSearch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterMaterialSearchField'),
          initialValue:
              state.orderHistoryFilterList.materialSearch.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.materialSearchChanged(
                  value,
                ),
              ),
          validator: (_) =>
              state.orderHistoryFilterList.materialSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          decoration: InputDecoration(
            labelText: 'Material ID/Name'.tr(),
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
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.principalSearch !=
          current.orderHistoryFilterList.principalSearch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterPrincipalSearchField'),
          initialValue: state.orderHistoryFilterList.principalSearch
              .getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.principalSearchChanged(value),
              ),
          validator: (_) =>
              state.orderHistoryFilterList.principalSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 2 characters.'.tr(),
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

class _OrderFromDateByFilter extends StatefulWidget {
  const _OrderFromDateByFilter({Key? key}) : super(key: key);

  @override
  State<_OrderFromDateByFilter> createState() => __OrderFromDateByFilterState();
}

class __OrderFromDateByFilterState extends State<_OrderFromDateByFilter> {
  late TextEditingController txtfromDateController;
  late OrderHistoryFilterBloc orderHistoryFilterBloc;

  @override
  void initState() {
    txtfromDateController = TextEditingController();
    orderHistoryFilterBloc = context.read<OrderHistoryFilterBloc>();
    txtfromDateController.text = orderHistoryFilterBloc
        .state.orderHistoryFilterList.fromDate.toValidDateString;

    super.initState();
  }

  @override
  void dispose() {
    txtfromDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      listenWhen: (previous, current) =>
          previous.orderHistoryFilterList.fromDate !=
              current.orderHistoryFilterList.fromDate ||
          previous.orderHistoryFilterList.toDate !=
              current.orderHistoryFilterList.toDate,
      listener: (context, state) {
        txtfromDateController.text =
            state.orderHistoryFilterList.fromDate.toValidDateString;
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filteFromdateField'),
          onTap: () async {
            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.fromDate.dateTimeByDateString,
              firstDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.toDate.dateTimeByDateString
                  .subtract(const Duration(days: 365)),
              lastDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.toDate.dateTimeByDateString,
            );
            orderHistoryFilterBloc.add(
              OrderHistoryFilterEvent.setfromDate(
                fromDate:
                    DateTimeStringValue(getDateStringByDateTime(orderDate!)),
              ),
            );
          },
          readOnly: true,
          controller: txtfromDateController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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

class _OrderToDateByFilter extends StatefulWidget {
  const _OrderToDateByFilter({Key? key}) : super(key: key);

  @override
  State<_OrderToDateByFilter> createState() => __OrderToDateByFilterState();
}

class __OrderToDateByFilterState extends State<_OrderToDateByFilter> {
  late TextEditingController txttoDateController;
  late OrderHistoryFilterBloc orderHistoryFilterBloc;

  @override
  void initState() {
    txttoDateController = TextEditingController();
    orderHistoryFilterBloc = context.read<OrderHistoryFilterBloc>();
    txttoDateController.text = orderHistoryFilterBloc
        .state.orderHistoryFilterList.toDate.toValidDateString;

    super.initState();
  }

  @override
  void dispose() {
    txttoDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      listenWhen: (previous, current) =>
          previous.orderHistoryFilterList.toDate !=
              current.orderHistoryFilterList.toDate ||
          previous.orderHistoryFilterList.fromDate !=
              current.orderHistoryFilterList.fromDate,
      listener: (
        context,
        state,
      ) {
        txttoDateController.text =
            state.orderHistoryFilterList.toDate.toValidDateString;
      },
      child: Expanded(
        child: TextFormField(
          key: const Key('filterTodateField'),
          onTap: () async {
            final orderDate = await showPlatformDatePicker(
              context: context,
              initialDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.toDate.dateTimeByDateString,
              firstDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.fromDate.dateTimeByDateString,
              lastDate: orderHistoryFilterBloc
                  .state.orderHistoryFilterList.fromDate.dateTimeByDateString
                  .add(const Duration(days: 365)),
            );

            orderHistoryFilterBloc.add(
              OrderHistoryFilterEvent.setToDate(
                toDate:
                    DateTimeStringValue(getDateStringByDateTime(orderDate!)),
              ),
            );
          },
          readOnly: true,
          controller: txttoDateController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.initialized(),
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
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.filterOrderHistory(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}
