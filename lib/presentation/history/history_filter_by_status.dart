import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryFilterByStatus extends StatelessWidget {
  const HistoryFilterByStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryFilterByStatusBloc,
        OrderHistoryFilterByStatusState>(
      builder: (context, state) {
        return SingleChildScrollView(
          key: const ValueKey('order_history_filter_by_status'),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                      ),
                      child: Text(
                        'Select Status'.tr(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      key: const Key('closeButton'),
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.clear,
                        color: ZPColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: state.getAllStatusName.map((status) {
                  return CheckboxListTile(
                    key: Key('checkboxListTile_$status'),
                    dense: true,
                    checkColor: Colors.white,
                    activeColor: ZPColors.kPrimaryColor,
                    title: Text(
                      status.tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    onChanged: (bool? value) {
                      BlocProvider.of<OrderHistoryFilterByStatusBloc>(
                        context,
                      ).add(
                        OrderHistoryFilterByStatusEvent.checkedStatusFilter(
                          isChecked: value!,
                          statusName: StatusType(status),
                        ),
                      );
                    },
                    value: state.isChecked(status),
                  );
                }).toList(),
              ),
              const _ClearButtonForFilterByStatus(),
            ],
          ),
        );
      },
    );
  }
}

class _ClearButtonForFilterByStatus extends StatelessWidget {
  const _ClearButtonForFilterByStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OutlinedButton(
        key: const ValueKey('filterclearAllButton'),
        onPressed: () async {
          context.read<OrderHistoryFilterByStatusBloc>().add(
                const OrderHistoryFilterByStatusEvent.initialized(),
              );
          await context.router.pop();
        },
        child: Text(
          'Clear All'.tr(),
        ),
      ),
    );
  }
}
