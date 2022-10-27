import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/infrastructure/order/repository/valid_customer_material_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class ValidCustomerMaterialRepositoryMock extends Mock
    implements ValidCustomerMaterialRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final ValidCustomerMaterialRepository validCustomerMaterialRepositoryMock =
      ValidCustomerMaterialRepositoryMock();

  final mockUser = User.empty();
  final mockSalesOrg = SalesOrganisation.empty();
  final mockCustomerCodeInfo = CustomerCodeInfo.empty();
  final mockShipToInfo = ShipToInfo.empty();
  final validCustomerMaterialState = ValidCustomerMaterialState.initial();
  final locator = GetIt.instance;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
  });

  //TODO: Fix in CustomerMaterialPriceDetail test case PR
  // group('Material List Bloc', () {
  //   blocTest(
  //     'Valid customer Material List Intial',
  //     build: () => ValidCustomerMaterialBloc(
  //       validCustomerMaterialRepository: validCustomerMaterialRepositoryMock,
  //     ),
  //     act: (ValidCustomerMaterialBloc bloc) {
  //       bloc.add(const ValidCustomerMaterialEvent.initialized());
  //     },
  //     expect: () => [ValidCustomerMaterialState.initial()],
  //   );
  //
  //   blocTest(
  //     'valid customer Material List Fetch fail',
  //     build: () => ValidCustomerMaterialBloc(
  //       validCustomerMaterialRepository: validCustomerMaterialRepositoryMock,
  //     ),
  //     setUp: () {
  //       when(() => validCustomerMaterialRepositoryMock.getValidMaterialList(
  //             user: mockUser,
  //             salesOrganisation: mockSalesOrg,
  //             customerCodeInfo: mockCustomerCodeInfo,
  //             shipToInfo: mockShipToInfo,
  //             materialList: [],
  //             focMaterialList: [],
  //           )).thenAnswer(
  //         (invocation) async => const Left(
  //           ApiFailure.other('fake-error'),
  //         ),
  //       );
  //     },
  //     act: (ValidCustomerMaterialBloc bloc) {
  //       bloc.add(ValidCustomerMaterialEvent.validate(
  //           materialList: [],
  //           focMaterialList: [],
  //           user: mockUser,
  //           salesOrganisation: mockSalesOrg,
  //           customerCodeInfo: mockCustomerCodeInfo,
  //           shipToInfo: mockShipToInfo));
  //     },
  //     expect: () => [],
  //   );
  //
  //   blocTest(
  //       'valid customer Material Fetch list success with all Valid materialList',
  //       build: () => ValidCustomerMaterialBloc(
  //             validCustomerMaterialRepository:
  //                 validCustomerMaterialRepositoryMock,
  //           ),
  //       setUp: () {
  //         when(() => validCustomerMaterialRepositoryMock.getValidMaterialList(
  //               user: mockUser,
  //               salesOrganisation: mockSalesOrg,
  //               customerCodeInfo: mockCustomerCodeInfo,
  //               shipToInfo: mockShipToInfo,
  //               materialList: [],
  //               focMaterialList: [],
  //             )).thenAnswer(
  //           (invocation) async => Right([
  //             MaterialNumber('000000000023008447'),
  //           ]),
  //         );
  //       },
  //       act: (ValidCustomerMaterialBloc bloc) {
  //         bloc.add(ValidCustomerMaterialEvent.validate(
  //             materialList: [],
  //             focMaterialList: [],
  //             user: mockUser,
  //             salesOrganisation: mockSalesOrg,
  //             customerCodeInfo: mockCustomerCodeInfo,
  //             shipToInfo: mockShipToInfo));
  //       },
  //       expect: () => [
  //             validCustomerMaterialState.copyWith(validMaterialList: [
  //               MaterialNumber('000000000023008447'),
  //             ]),
  //           ],
  //       verify: (ValidCustomerMaterialBloc bloc) =>
  //           expect(bloc.state.validMaterialNumber, ['000000000023008447']));
  //   blocTest(
  //       'valid customer Material Fetch list success with avaliable Material on validMaterialList',
  //       build: () => ValidCustomerMaterialBloc(
  //             validCustomerMaterialRepository:
  //                 validCustomerMaterialRepositoryMock,
  //           ),
  //       setUp: () {
  //         when(() => validCustomerMaterialRepositoryMock.getValidMaterialList(
  //               user: mockUser,
  //               salesOrganisation: mockSalesOrg,
  //               customerCodeInfo: mockCustomerCodeInfo,
  //               shipToInfo: mockShipToInfo,
  //               materialList: [],
  //               focMaterialList: [],
  //             )).thenAnswer(
  //           (invocation) async => Right([
  //             MaterialNumber('000000000023008447'),
  //           ]),
  //         );
  //       },
  //       act: (ValidCustomerMaterialBloc bloc) {
  //         bloc.add(ValidCustomerMaterialEvent.validate(
  //             materialList: [],
  //             focMaterialList: [],
  //             user: mockUser,
  //             salesOrganisation: mockSalesOrg,
  //             customerCodeInfo: mockCustomerCodeInfo,
  //             shipToInfo: mockShipToInfo));
  //         bloc.add(ValidCustomerMaterialEvent.validate(
  //             materialList: [],
  //             focMaterialList: [],
  //             user: mockUser,
  //             salesOrganisation: mockSalesOrg,
  //             customerCodeInfo: mockCustomerCodeInfo,
  //             shipToInfo: mockShipToInfo));
  //       },
  //       expect: () => [
  //             validCustomerMaterialState.copyWith(validMaterialList: [
  //               MaterialNumber('000000000023008447'),
  //             ]),
  //           ],
  //       verify: (ValidCustomerMaterialBloc bloc) => expect(
  //           bloc.state.filterInvalidMaterialNumber(
  //               ['000000000023008449', '000000000023008447']),
  //           ['000000000023008449']));
  // });
}
