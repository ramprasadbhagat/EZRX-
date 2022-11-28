import 'package:easy_localization/easy_localization.dart';
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
      key: const Key('orderHistoryFilter'),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height,
            child:
                BlocConsumer<OrderHistoryFilterBloc, OrderHistoryFilterState>(
              listenWhen: (previous, current) =>
                  previous.isSubmitting != current.isSubmitting,
              listener: (context, state) {
                if (state.isSubmitting) {
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return Form(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Column(
                        children: <Widget>[
                          const _FilterHeader(),
                          const SizedBox(
                            height: 16,
                          ),
                          const _OrderIdByFilter(),
                          const SizedBox(
                            height: 16,
                          ),
                          const _PoNumberFilter(),
                          const SizedBox(
                            height: 16,
                          ),
                          const _MaterialSearchByFilter(),
                          const SizedBox(
                            height: 16,
                          ),
                          const _PrincipleSearchByFilter(),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(children: const [
                            _OrderFromDateByFilter(),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'to',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            _OrderToDateByFilter(),
                          ]),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
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
                    ],
                  ),
                );
              },
            ),
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
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 0.0,
        left: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Filter Order History'.tr(),
            style: const TextStyle(
              fontSize: 16,
              color: ZPColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: IconButton(
              key: const Key('filterCrossButton'),
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
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
      builder: (
        context,
        state,
      ) {
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
                  'Search input must be greater than 4 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            // border: InputBorder.none,
            labelText: 'Order ID'.tr(),
            labelStyle: const TextStyle(
              fontSize: 12.0,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ZPColors.kPrimaryColor,
                width: 1.0,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ZPColors.kPrimaryColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ZPColors.kPrimaryColor,
              ),
            ),
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
                  'Search input must be greater than 4 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            labelText: 'PO Number'.tr(),
            labelStyle: const TextStyle(
              fontSize: 12.0,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ZPColors.kPrimaryColor,
                width: 1.0,
              ),
            ),
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
                  'Search input must be greater than 4 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ZPColors.kPrimaryColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: ZPColors.kPrimaryColor,
              ),
            ),
            labelText: 'Material ID/Name'.tr(),
            labelStyle: const TextStyle(
              fontSize: 12.0,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ZPColors.kPrimaryColor,
                width: 1.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PrincipleSearchByFilter extends StatelessWidget {
  const _PrincipleSearchByFilter({Key? key}) : super(key: key);
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
          key: const Key('filterPrincipleSearchField'),
          initialValue: state.orderHistoryFilterList.principalSearch
              .getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.principalSearchChanged(value),
              ),
          validator: (_) =>
              state.orderHistoryFilterList.principalSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Search input must be greater than 4 characters.'.tr(),
              orElse: () => null,
            ),
            (_) => null,
          ),
          keyboardType: TextInputType.text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            labelText: 'Principal Code/Name'.tr(),
            labelStyle: const TextStyle(
              fontSize: 12.0,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ZPColors.kPrimaryColor,
                width: 1.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<DateTime?> viewDatePicker(
  initialDate,
  selectedDateType,
  BuildContext context,
) =>
    showPlatformDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: selectedDateType == 'startDate'
          ? DateTime(2018)
          : initialDate.subtract(
              const Duration(
                days: 6,
              ),
            ),
      lastDate: selectedDateType == 'startDate'
          ? initialDate.add(
              const Duration(
                days: 7,
              ),
            )
          : initialDate,
    );

class _OrderFromDateByFilter extends StatefulWidget {
  const _OrderFromDateByFilter({Key? key}) : super(key: key);
  @override
  State<_OrderFromDateByFilter> createState() => __OrderFromDateByFilterState();
}

class __OrderFromDateByFilterState extends State<_OrderFromDateByFilter> {
  late TextEditingController txtfromDateController;

  @override
  void initState() {
    txtfromDateController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    txtfromDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.fromDate !=
          current.orderHistoryFilterList.fromDate,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: const Key('filteFromdateField'),
            onTap: () async {
              final orderDate = await viewDatePicker(
                state.orderHistoryFilterList.fromDate,
                'startDate',
                context,
              );
              if (mounted) {
                context.read<OrderHistoryFilterBloc>().add(
                      OrderHistoryFilterEvent.setfromDate(
                        fromDate: orderDate!,
                      ),
                    );
              }
            },
            readOnly: true,
            controller: txtfromDateController
              ..text = DateFormat('dd/MM/yyyy')
                  .format(state.orderHistoryFilterList.fromDate),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 4.0,
              ),
              labelText: 'From Date'.tr(),
              labelStyle: const TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              suffixIcon: const Icon(
                Icons.calendar_month,
              ),
            ),
          ),
        );
      },
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
  @override
  void initState() {
    txttoDateController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    txttoDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilterList.toDate !=
          current.orderHistoryFilterList.toDate,
      builder: (
        context,
        state,
      ) {
        return Expanded(
          child: TextFormField(
            key: const Key('filterTodateField'),
            onTap: () async {
              final orderDate = await viewDatePicker(
                state.orderHistoryFilterList.toDate,
                'endDate',
                context,
              );
              if (mounted) {
                context.read<OrderHistoryFilterBloc>().add(
                      OrderHistoryFilterEvent.setToDate(
                        toDate: orderDate!,
                      ),
                    );
              }
            },
            readOnly: true,
            controller: txttoDateController
              ..text = DateFormat('dd/MM/yyyy')
                  .format(state.orderHistoryFilterList.toDate),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 4.0,
              ),
              labelText: 'To Date'.tr(),
              labelStyle: const TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              suffixIcon: const Icon(
                Icons.calendar_month,
              ),
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
    return ElevatedButton(
      key: const Key('filterClearButton'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => ZPColors.white,
        ),
        side: MaterialStateProperty.resolveWith(
          (states) => const BorderSide(color: ZPColors.primary),
        ),
      ),
      onPressed: () async {
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.initialized(),
            );

        Navigator.of(context).pop();
      },
      child: Text(
        'Clear'.tr(),
        style: const TextStyle(
          color: ZPColors.primary,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
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
        style: const TextStyle(
          color: ZPColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
