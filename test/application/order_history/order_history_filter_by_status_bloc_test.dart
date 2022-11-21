import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakestatusName = <String>[];
  const fakeIsChecked = false;
  const fakestatus = '';

  group(' Order History Filter Bloc', () {
    blocTest('Intial',
        build: () => OrderHistoryFilterByStatusBloc(),
        act: (OrderHistoryFilterByStatusBloc bloc) async {
          bloc.add(const OrderHistoryFilterByStatusEvent.initialized());
        },
        expect: () => [OrderHistoryFilterByStatusState.initial()]);
    blocTest('checkedStatusFilter failed',
        build: () => OrderHistoryFilterByStatusBloc(),
        act: (OrderHistoryFilterByStatusBloc bloc) async {
          bloc.add(const OrderHistoryFilterByStatusEvent.checkedStatusFilter(
              statusName: fakestatus, isChecked: false));
        },
        expect: () => [
              OrderHistoryFilterByStatusState.initial().copyWith(
                filterByStatusName: [
                  
                ],
              )
            ]);
             blocTest('checkedStatusFilter succeed',
        build: () => OrderHistoryFilterByStatusBloc(),
        act: (OrderHistoryFilterByStatusBloc bloc) async {
          bloc.add(const OrderHistoryFilterByStatusEvent.checkedStatusFilter(
              statusName: fakestatus, isChecked: true));
        },
        expect: () => [
              OrderHistoryFilterByStatusState.initial().copyWith(
                filterByStatusName:[...fakestatusName, fakestatus]
                
              )
            ]);
  });
}

