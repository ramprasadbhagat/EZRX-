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
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
               
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
                          checkColor: Colors.white,
                          activeColor: ZPColors.kPrimaryColor,
                          title: Text(status),
                          onChanged: (bool? value) {
                            BlocProvider.of<OrderHistoryFilterByStatusBloc>(
                                    context,)
                                .add(OrderHistoryFilterByStatusEvent
                                    .checkedStatusFilter(
                                        isChecked: value!, statusName: status,),);
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
                child: 
                 
                    _ClearButtonForFilterByStatus(),
                   
                  
                
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
    return Expanded(
      flex: 3,
      child: GestureDetector(
        onTap: () async {
           context.read<OrderHistoryFilterByStatusBloc>().add(
              const OrderHistoryFilterByStatusEvent.initialized(),
            );
          Navigator.of(context).pop();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 60 / 100,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: const LinearGradient(
              colors: <Color>[ZPColors.kPrimaryColor, ZPColors.gradient],
            ),
          ),
          child: const Center(
            child: Text(
              'Clear All',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

