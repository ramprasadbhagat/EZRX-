import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
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
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
                child: Text(
                  'Select Status'.tr(),
                  style: const TextStyle(
                    color: ZPColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: state.getAllStatusName.map((status) {
                  return Column(
                    children: <Widget>[
                      CheckboxListTile(
                        title: Text(status),
                        onChanged: (bool? value) {
                          BlocProvider.of<OrderHistoryFilterByStatusBloc>(
                            context,
                          ).add(
                            OrderHistoryFilterByStatusEvent.checkedStatusFilter(
                              isChecked: value!,
                              statusName: status,
                            ),
                          );
                        },
                        value: state.isChecked(status),
                      ),
                    ],
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: _ClearButtonForFilterByStatus(),
              ),
              const SizedBox(
                height: 40,
              ),
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
    return ElevatedButton(
      onPressed: () async {
        context.read<OrderHistoryFilterByStatusBloc>().add(
              const OrderHistoryFilterByStatusEvent.initialized(),
            );
        Navigator.of(context).pop();
      },
      child: const Text(
        'Clear All',
      ),
    );
  }
}
