import 'package:auto_route/auto_route.dart';
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
          key: const ValueKey('order_history_filter_by_status'),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Select Status'.tr(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ZPColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 5,
                    child: IconButton(
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
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          key: const Key('checkboxListTile'),
                          checkColor: Colors.white,
                          activeColor: ZPColors.kPrimaryColor,
                          title: Text(status.tr()),
                          onChanged: (bool? value) {
                            BlocProvider.of<OrderHistoryFilterByStatusBloc>(
                              context,
                            ).add(
                              OrderHistoryFilterByStatusEvent
                                  .checkedStatusFilter(
                                isChecked: value!,
                                statusName: status,
                              ),
                            );
                          },
                          value: state.isChecked(status),
                        ),
                      ],
                    ),
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
    return Container(
      width: MediaQuery.of(context).size.width * 60 / 100,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: const LinearGradient(
          colors: <Color>[ZPColors.kPrimaryColor, ZPColors.gradient],
        ),
      ),
      child: ElevatedButton(
        key: const ValueKey('filterclearAllButton'),
        onPressed: () async {
          context.read<OrderHistoryFilterByStatusBloc>().add(
                const OrderHistoryFilterByStatusEvent.initialized(),
              );
          await context.router.pop();
        },
        child: Center(
          child: Text(
            'Clear All'.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
