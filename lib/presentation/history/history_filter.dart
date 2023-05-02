import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';

class OrderHistoryFilterDrawer extends StatelessWidget {
  const OrderHistoryFilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('orderHistoryFilterDrawer'),
      width: MediaQuery.of(context).size.width * 0.8,
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
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 30,
                    ),
                    children: <Widget>[
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
                      _OrderDateFilter(),
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
      title: const Text('Apply Order History Filters').tr(),
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

class _OrderIdByFilter extends StatelessWidget {
  const _OrderIdByFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilter.orderId !=
          current.orderHistoryFilter.orderId,
      builder: (context, state) {
        return TextFormField(
          key: const Key('filterOrderIdField'),
          initialValue: state.orderHistoryFilter.orderId.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.orderIdChanged(
                  value,
                ),
              ),
          validator: (_) => state.orderHistoryFilter.orderId.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Please enter at least 2 characters.'.tr(),
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
          previous.orderHistoryFilter.poNumber !=
          current.orderHistoryFilter.poNumber,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterPoNumberField'),
          initialValue: state.orderHistoryFilter.poNumber.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.poNumberChanged(
                  value,
                ),
              ),
          validator: (_) => state.orderHistoryFilter.poNumber.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Please enter at least 2 characters.'.tr(),
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
          previous.orderHistoryFilter.materialSearch !=
          current.orderHistoryFilter.materialSearch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterMaterialSearchField'),
          initialValue:
              state.orderHistoryFilter.materialSearch.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.materialSearchChanged(
                  value,
                ),
              ),
          validator: (_) => state.orderHistoryFilter.materialSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Please enter at least 2 characters.'.tr(),
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
          previous.orderHistoryFilter.principalSearch !=
          current.orderHistoryFilter.principalSearch,
      builder: (
        context,
        state,
      ) {
        return TextFormField(
          key: const Key('filterPrincipalSearchField'),
          initialValue:
              state.orderHistoryFilter.principalSearch.getOrDefaultValue(''),
          onChanged: (value) => context.read<OrderHistoryFilterBloc>().add(
                OrderHistoryFilterEvent.principalSearchChanged(value),
              ),
          validator: (_) => state.orderHistoryFilter.principalSearch.value.fold(
            (f) => f.maybeMap(
              subceedLength: (f) =>
                  'Please enter at least 2 characters.'.tr(),
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

class _ClearButton extends StatelessWidget {
  const _ClearButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: const Key('filterClearButton'),
      onPressed: () {
        final orderHistoryFilterBloc = context.read<OrderHistoryFilterBloc>();

        if (orderHistoryFilterBloc.state.orderHistoryFilter.anyFilterApplied) {
          orderHistoryFilterBloc.add(
            const OrderHistoryFilterEvent.initialized(),
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
        context.read<OrderHistoryFilterBloc>().add(
              const OrderHistoryFilterEvent.applyFilters(),
            );
      },
      child: Text(
        'Apply'.tr(),
        style: const TextStyle(color: ZPColors.white),
      ),
    );
  }
}

class _OrderDateFilter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterBloc, OrderHistoryFilterState>(
      buildWhen: (previous, current) =>
          previous.orderHistoryFilter.getOrderDateFiltered !=
          current.orderHistoryFilter.getOrderDateFiltered,
      builder: (context, state) {

        return TextFormField(
          key:  Key('filterOrderDateField+${state.orderHistoryFilter.getOrderDateFiltered}'),
          onTap: () async {
            final orderHistoryFilterBloc = context.read<OrderHistoryFilterBloc>();
            final orderDateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now(),
              initialDateRange:
                  state.orderHistoryFilter.getOrderFilterDateRange,
            );
            if (orderDateRange == null) return;
            orderHistoryFilterBloc.add(
                  OrderHistoryFilterEvent.setOrderDate(
                    orderDateRange: orderDateRange,
                  ),
                );
          },
          readOnly: true,
          initialValue: state.orderHistoryFilter.getOrderDateFiltered,
          decoration: InputDecoration(
            labelText: 'Order Date'.tr(),
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
