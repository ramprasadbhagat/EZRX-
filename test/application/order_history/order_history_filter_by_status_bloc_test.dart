import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakestatusName = <StatusType>[];

  group(' Order History Filter Bloc', () {
    blocTest(
      'Intial',
      build: () => OrderHistoryFilterByStatusBloc(),
      act: (OrderHistoryFilterByStatusBloc bloc) async {
        bloc.add(const OrderHistoryFilterByStatusEvent.initialized());
      },
      expect: () => [OrderHistoryFilterByStatusState.initial()],
    );
    blocTest(
      'checkedStatusFilter failed',
      build: () => OrderHistoryFilterByStatusBloc(),
      act: (OrderHistoryFilterByStatusBloc bloc) async {
        bloc.add(
          OrderHistoryFilterByStatusEvent.checkedStatusFilter(
            statusName: StatusType(''),
            isChecked: false,
          ),
        );
      },
      expect: () => [
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [],
        )
      ],
    );
    blocTest(
      'checkedStatusFilter succeed',
      build: () => OrderHistoryFilterByStatusBloc(),
      act: (OrderHistoryFilterByStatusBloc bloc) async {
        bloc.add(
          OrderHistoryFilterByStatusEvent.checkedStatusFilter(
            statusName: StatusType(''),
            isChecked: true,
          ),
        );
      },
      expect: () => [
        OrderHistoryFilterByStatusState.initial().copyWith(
          filterByStatusName: [...fakestatusName, StatusType('')],
        )
      ],
    );
  });
}
