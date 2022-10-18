import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderHistoryRepoMock extends Mock implements OrderHistoryRepository {}

class CustomerCodeMockBloc extends Mock implements CustomerCodeBloc {}

class ShipToCodeMocBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // late OrderHistoryRepository orderHistoryRepoMock = OrderHistoryRepoMock();
  // late CustomerCodeBloc customerCodeBloc = CustomerCodeMockBloc();
  // late ShipToCodeBloc shipToCodeBloc = ShipToCodeMocBloc();
  // late UserBloc userMockBloc = UserMockBloc();
  // final orderHistoryState = OrderHistoryListState.initial();
  // var fakeSort = 'desc';
  // var user = User(
  //   id: '1',
  //   username: Username(''),
  //   email: EmailAddress(''),
  //   fullName: const FullName(firstName: '', lastName: ''),
  //   role: Role(id: '', description: '', name: '', type: RoleType('Developer')),
  //   customerCode: CustomerCode(''),
  //   userSalesOrganisations: [],
  //   settings: Settings.empty(),
  //   settingTc: SettingTc.empty(),
  //   settingAup: SettingAup.empty(),
  //   enableOrderType: false,
  // );
  // var fakePageSize = 20;
  // var fakeorderBy = 'orderDate';
  // var fakeFromDate = DateTime.parse('2022-09-16 00:00:00Z');
  // var fakeToDate = DateTime.parse('2022-09-23 00:00:00Z');
  // var shipToWithoutValue = ShipToInfo.empty();
  // var shipToWithValue = const ShipToInfo(
  //   building: 'test',
  //   city1: 'test',
  //   city2: 'test',
  //   defaultShipToAddress: false,
  //   floor: 'test',
  //   houseNumber1: 'test',
  //   plant: 'test',
  //   postalCode: 'test',
  //   region: 'test',
  //   shipToAddress: ShipToAddress(
  //     street2: 'test',
  //     street3: 'test',
  //     street4: 'test',
  //     street5: 'test',
  //     street: 'test',
  //   ),
  //   shipToCustomerCode: '1111111111',
  //   shipToName: ShipToName(
  //     name1: 'test',
  //     name2: 'test',
  //     name3: 'test',
  //     name4: 'test',
  //   ),
  //   status: 'test',
  //   telephoneNumber: '12345',
  // );
  // var soldTo = CustomerCodeInfo(
  //   customerCodeSoldTo: '',
  //   customerAddress: CustomerAddress.empty(),
  //   billToInfos: [],
  //   customerClassification: '',
  //   customerLocalGroup: '',
  //   customerName: const CustomerName(
  //     name1: '',
  //     name2: '',
  //     name3: '',
  //     name4: '',
  //   ),
  //   paymentTermDescription: '',
  //   postalCode: '',
  //   shipToInfos: [],
  //   status: '',
  // );
  // late CustomerCodeState customerCodeInitState;
  // late UserState userInitState;
  // late ShipToCodeState shipToInitState;

  setUpAll(() {
    // customerCodeBloc = CustomerCodeMockBloc();
    // orderHistoryRepoMock = OrderHistoryRepoMock();
    // shipToCodeBloc = ShipToCodeMocBloc();
    // userMockBloc = UserMockBloc();
    // userInitState = UserState.initial();
    // customerCodeInitState = CustomerCodeState.initial();
    // shipToInitState = ShipToCodeState.initial();
  });
  group('Order History Bloc', () {
    // TODO: Jyoti rewrite the test cases
    // blocTest('Order History Initial State',
    //     build: () => OrderHistoryListBloc(
    //           customerCodeBloc: customerCodeBloc,
    //           userBloc: userMockBloc,
    //           shipToCodeBloc: shipToCodeBloc,
    //           orderHistoryRepository: orderHistoryRepoMock,
    //         ),
    //     setUp: () {
    //       when(() => customerCodeBloc.state).thenAnswer((invocation) {
    //         return CustomerCodeState.initial();
    //       });

    //       when(() => shipToCodeBloc.state).thenAnswer((invocation) {
    //         return ShipToCodeState.initial()
    //             .copyWith(shipToInfo: ShipToInfo.empty());
    //       });
    //       when(() => userMockBloc.state).thenAnswer(
    //           (invocation) => UserState.initial().copyWith(user: user));
    //       when(() => orderHistoryRepoMock.getOrderHistory(
    //             fromDate: fakeFromDate,
    //             toDate: fakeToDate,
    //             orderBy: fakeorderBy,
    //             pageSize: fakePageSize,
    //             offset: 0,
    //             soldTo: soldTo,
    //             shipTo: shipToWithoutValue,
    //             sort: fakeSort,
    //             user: user,
    //           )).thenAnswer((invocation) async {
    //         return const Right(
    //           [],
    //         );
    //       });
    //     },
    //     expect: () =>
    //         [orderHistoryState.copyWith(failureOrSuccessOption: none())]);

    // blocTest('Order History Failed State',
    //     build: () => OrderHistoryListBloc(
    //           customerCodeBloc: customerCodeBloc,
    //           userBloc: userMockBloc,
    //           shipToCodeBloc: shipToCodeBloc,
    //           orderHistoryRepository: orderHistoryRepoMock,
    //         ),
    //     setUp: () {
    //       when(() => customerCodeBloc.state).thenAnswer((invocation) {
    //         return CustomerCodeState.initial();
    //       });

    //       when(() => shipToCodeBloc.state).thenAnswer((invocation) {
    //         return ShipToCodeState.initial()
    //             .copyWith(shipToInfo: shipToWithoutValue);
    //       });
    //       when(() => userMockBloc.state).thenAnswer(
    //           (invocation) => UserState.initial().copyWith(user: user));
    //       when(() => orderHistoryRepoMock.getOrderHistory(
    //             fromDate: fakeFromDate,
    //             toDate: fakeToDate,
    //             orderBy: fakeorderBy,
    //             pageSize: fakePageSize,
    //             offset: 0,
    //             soldTo: soldTo,
    //             shipTo: shipToWithoutValue,
    //             sort: fakeSort,
    //             user: user,
    //           )).thenAnswer((invocation) async {
    //         return const Left(
    //           ApiFailure.other('fake-error'),
    //         );
    //       });
    //     },
    //     expect: () => [
    //           orderHistoryState.copyWith(
    //             failureOrSuccessOption: optionOf(
    //               const Left(
    //                 ApiFailure.other('fake-error'),
    //               ),
    //             ),
    //           ),
    //         ]);

    // blocTest('Order History Successed State',
    //     build: () => OrderHistoryListBloc(
    //           customerCodeBloc: customerCodeBloc,
    //           userBloc: userMockBloc,
    //           shipToCodeBloc: shipToCodeBloc,
    //           orderHistoryRepository: orderHistoryRepoMock,
    //         ),
    //     setUp: () {
    //       when(() => customerCodeBloc.state).thenAnswer((invocation) {
    //         return CustomerCodeState.initial();
    //       });

    //       when(() => shipToCodeBloc.state).thenAnswer((invocation) {
    //         return ShipToCodeState.initial()
    //             .copyWith(shipToInfo: shipToWithValue);
    //       });
    //       when(() => userMockBloc.state).thenAnswer(
    //           (invocation) => UserState.initial().copyWith(user: user));
    //       // when(() => shipToCodeBloc.stream).thenAnswer((invocation) {
    //       //   return Stream.fromIterable([
    //       //     ShipToCodeState.initial().copyWith(shipToInfo: shipToWithValue),
    //       //     ShipToCodeState.initial().copyWith(
    //       //         shipToInfo:
    //       //             shipToWithValue.copyWith(shipToCustomerCode: '987654'))
    //       //   ]);
    //       // });
    //       // when(() => customerCodeBloc.state).thenAnswer((invocation) {
    //       //   return CustomerCodeState.initial();
    //       // });

    //       // when(() => shipToCodeBloc.state).thenAnswer((invocation) {
    //       //   return shipToInitState;
    //       // });
    //       // when(() => userMockBloc.state).thenAnswer(
    //       //     (invocation) => UserState.initial().copyWith(user: user));
    //       when(() => orderHistoryRepoMock.getOrderHistory(
    //             fromDate: fakeFromDate,
    //             toDate: fakeToDate,
    //             orderBy: fakeorderBy,
    //             pageSize: fakePageSize,
    //             offset: 0,
    //             soldTo: soldTo,
    //             shipTo: shipToWithValue,
    //             sort: fakeSort,
    //             user: user,
    //           )).thenAnswer((invocation) async {
    //         return const Right(
    //           [],
    //         );
    //       });
    //     },
    //     expect: () => [
    //           orderHistoryState.copyWith(failureOrSuccessOption: none()),
    //         ]);
  });
}
