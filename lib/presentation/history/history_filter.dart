import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderHistoryFilterDrawer extends StatelessWidget {
  const OrderHistoryFilterDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const Key('Order History Filter'),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).size.height,
            child: Column(
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
        left: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text(
            'Filter Order History',
            style: TextStyle(
              fontSize: 16,
              color: ZPColors.kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 20.0,
            ),
            child: IconButton(
              key: const Key('filtercrossbutton'),
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
        builder: (context, state,) {
          return TextFormField(
            key: const Key('filterorderidField'),
            initialValue: state.orderHistoryFilterList.orderId,
            onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                  OrderHistoryFilterEvent.orderIdChanged(
                    value,
                  ),
                ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              border: InputBorder.none,
              labelText: 'Order ID',
              labelStyle: TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.lightGray,
                  width: 1.0,
                ),
              ),
            ),
          );
        },);
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
        builder: (context, state,) {
          return TextFormField(
            key: const Key('filterponumberField'),
            initialValue: state.orderHistoryFilterList.poNumber,
            onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                  OrderHistoryFilterEvent.poNumberChanged(
                    value,
                  ),
                ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              border: InputBorder.none,
              labelText: 'PO Number',
              labelStyle: TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.lightGray,
                  width: 1.0,
                ),
              ),
            ),
          );
        },);
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
        builder: (context, state,) {
          return TextFormField(
            key: const Key('filtermaterialsearchField'),
            initialValue: state.orderHistoryFilterList.materialSearch
                .getOrDefaultValue(''),
            onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                  OrderHistoryFilterEvent.materialSearchChanged(
                    MaterialNumber(value),
                  ),
                ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              border: InputBorder.none,
              labelText: 'Material ID/Name',
              labelStyle: TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.lightGray,
                  width: 1.0,
                ),
              ),
            ),
          );
        },);
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
        builder: (context, state,) {
          return TextFormField(
            key: const Key('filterprinciplesearchField'),
            initialValue: state.orderHistoryFilterList.principalSearch,
            onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                  OrderHistoryFilterEvent.principalSearchChanged(value),
                ),
            keyboardType: TextInputType.text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              border: InputBorder.none,
              labelText: 'Principle Code/Name',
              labelStyle: TextStyle(
                fontSize: 12.0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.kPrimaryColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ZPColors.lightGray,
                  width: 1.0,
                ),
              ),
            ),
          );
        },);
  }
}

Future<DateTime?> shoDatePicker(
        initialDate, selectedDateType, BuildContext context,) =>
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      selectableDayPredicate: (DateTime day) => selectedDateType == 'startDate'
          ? day.isBefore(DateTime.now())
          : day.isAfter(DateTime.now().subtract(
                const Duration(
                  days: 7,
                ),
              )) &&
              day.isBefore(
                DateTime.now(),
              ),
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
        builder: (context, state,) {
          return Expanded(
            child: TextFormField(
              key: const Key('filtefromdateField'),
              onTap: () async {
                final orderDate = await shoDatePicker(
                    state.orderHistoryFilterList.fromDate,
                    'startDate',
                    context,);
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
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 4.0,
                ),
                border: InputBorder.none,
                labelText: 'From Date',
                labelStyle: TextStyle(
                  fontSize: 12.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ZPColors.kPrimaryColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ZPColors.lightGray,
                    width: 1.0,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
            ),
          );
        },);
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
        builder: (context, state,) {
          return Expanded(
            child: TextFormField(
              key: const Key('filtertodateField'),
              onTap: () async {
                final orderDate = await shoDatePicker(
                    state.orderHistoryFilterList.toDate, 'endDate', context,);
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
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 4.0,
                ),
                border: InputBorder.none,
                labelText: 'To Date',
                labelStyle: TextStyle(
                  fontSize: 12.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ZPColors.kPrimaryColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ZPColors.lightGray,
                    width: 1.0,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
            ),
          );
        },);
  }
}

class _ClearButton extends StatelessWidget {
  const _ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('filterclearButton'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => Colors.white,
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              3.0,
            ),
            side: const BorderSide(
              color: ZPColors.darkGreen,
            ),
          ),
        ),
      ),
      onPressed: () async {
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.initialized(),
            );
        Navigator.of(context).pop();
      },
      child: const Text(
        'Clear',
        style: TextStyle(
          color: ZPColors.darkGreen,
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
      key: const Key('filterapplyButton'),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) => ZPColors.secondary,
        ),
        padding: MaterialStateProperty.resolveWith(
          (states) => const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              3.0,
            ),
          ),
        ),
      ),
      onPressed: () async {
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.filterOrderHistory(),
            );

        Navigator.of(context).pop();
      },
      child: const Text(
        'Apply',
        style: TextStyle(
          color: ZPColors.darkGreen,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
