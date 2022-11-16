import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAupTcRepository extends Mock implements AupTcRepository {
  @override
  bool getTncConfig() {
    return true;
  }
}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AupTcRepository aupTcRepository = MockAupTcRepository();
  late Config config;
  late User user;
  late SettingTc settingTc;
  late SalesOrganisation salesOrganisation;
  late TncDate tncDate;
  late Role role;

  setUpAll(() async {
    config = Config()..appFlavor = Flavor.uat;
    aupTcRepository = MockAupTcRepository();
    aupTcRepository = MockAupTcRepository();
    final TokenStorage tokenStorage = MockTokenStorage();
    when(() => tokenStorage.get())
        .thenAnswer((invocation) async => JWTDto(access: ''));
    user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
    settingTc = SettingTc(
        acceptPrivacyPolicy: false,
        acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
        privacyPolicyAcceptedPlatform: 'Mobile');
    tncDate = TncDate(date: DateTime.parse('1970-01-01 00:00:00'));
    role = Role.empty().copyWith(type: RoleType('internal_sales_rep'));
  });

  group('user state is empty state', () {
    blocTest(
      'user not loged in, AupTcBloc initial state',
      build: () => AupTcBloc(aupTcRepository: aupTcRepository, config: config),
      setUp: () {},
      expect: () => [],
    );
  });

//   group(
//     'UserLogin as salseorg=VN role=roleIsAupAudience',
//     () {
//       setUpAll(() {
//         salesOrganisation = user.userSalesOrganisations.first
//             .copyWith(salesOrg: SalesOrg('3072'));
//       });

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty  salseorg=VN role=roleIsAupAudience , acceptAUP - false, acceptAUPTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate),
//           );
//         },
//         act: (AupTcBloc aupTcBloc) => aupTcBloc.add(AupTcEvent.show(
//             user.copyWith(
//                 settingAup: settingAup.copyWith(
//                     acceptAUP: false, acceptAUPTimestamp: DateTime.now()),
//                 role: role.copyWith(type: RoleType('internal_sales_rep'))),
//             salesOrganisation.salesOrg)),
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPVNUrl,
//               initialFile: config.getAUPVNFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty salseorg=VN role=roleIsAupAudience, acceptAUP - true, acceptAUPTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc aupTcBloc) => aupTcBloc.add(AupTcEvent.show(
//             user.copyWith(
//                 settingAup: settingAup.copyWith(acceptAUP: true),
//                 role: role.copyWith(type: RoleType('internal_sales_rep'))),
//             salesOrganisation.salesOrg)),
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPVNUrl,
//               initialFile: config.getAUPVNFile)
//         ],
//       );
//       // blocTest<AupTcBloc, AupTcState>(
//       //   '''Loged in and userbloc state is Not empty salseorg=VN role=roleIsAupAudience, acceptAUP - true, acceptAUPTimestamp > tncDate
//       //   ''',
//       //   build: () => AupTcBloc(
//       //     aupTcRepository: aupTcRepository,
//       //     config: config,
//       //   ),
//       //   setUp: () async {
//       //     when(() => aupTcRepository.getTncDate()).thenAnswer(
//       //       (invocation) async => Right(tncDate),
//       //     );
//       //   },
//       //   act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//       //       user.copyWith(
//       //           settingAup: settingAup.copyWith(
//       //               acceptAUP: true, acceptAUPTimestamp: DateTime.now()),
//       //           role: role.copyWith(type: RoleType('internal_sales_rep'))),
//       //       salesOrganisation.salesOrg)),
//       //   expect: () => [
//       //     AupTcState(
//       //         showTermsAndConditon: false,
//       //         title: 'Acceptable Use Policy',
//       //         url: config.getAUPVNUrl,
//       //         initialFile: config.getAUPVNFile)
//       //   ],
//       // );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty salseorg=VN role=roleIsAupAudience, acceptAUP - false, acceptAUPTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate),
//           );
//         },
//         act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//             user.copyWith(
//                 settingAup: settingAup.copyWith(
//                     acceptAUP: false, acceptAUPTimestamp: DateTime.now()),
//                 role: role.copyWith(type: RoleType('internal_sales_rep'))),
//             salesOrganisation.salesOrg)),
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPVNUrl,
//               initialFile: config.getAUPVNFile)
//         ],
//       );

//       // blocTest<AupTcBloc, AupTcState>(
//       //   '''Loged in and userbloc state is Not empty salseorg=VN role=roleIsAupAudience , acceptAUP - false, tncDate - error
//       //   ''',
//       //   build: () => AupTcBloc(
//       //     aupTcRepository: aupTcRepository,
//       //     config: config,
//       //   ),
//       //   setUp: () async {
//       //     when(() => aupTcRepository.getTncDate()).thenAnswer(
//       //       (invocation) async => const Left(ApiFailure.other('fake-error')),
//       //     );
//       //   },
//       //   act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//       //       user.copyWith(
//       //           settingAup: settingAup.copyWith(
//       //               acceptAUP: false, acceptAUPTimestamp: DateTime.now()),
//       //           role: role.copyWith(type: RoleType('internal_sales_rep'))),
//       //       salesOrganisation.salesOrg)),
//       //   expect: () => [
//       //     AupTcState(
//       //         showTermsAndConditon: false,
//       //         title: 'Acceptable Use Policy',
//       //         url: config.getAUPVNUrl,
//       //         initialFile: config.getAUPVNFile)
//       //   ],
//       // );

//   //     blocTest<AupTcBloc, AupTcState>(
//   //       '''Loged in and userbloc state is Not empty , salseorg=VN role=roleIsAupAudience, acceptAUP - true
//   //        tncDate - error
//   //       ''',
//   //       build: () => AupTcBloc(
//   //         aupTcRepository: aupTcRepository,
//   //         config: config,
//   //       ),
//   //       setUp: () async {
//   //         when(() => aupTcRepository.getTncDate()).thenAnswer(
//   //           (invocation) async => const Left(ApiFailure.other('fake-error')),
//   //         );
//   //       },
//   //       act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//   //           user.copyWith(
//   //               settingAup: settingAup.copyWith(
//   //                   acceptAUP: true, acceptAUPTimestamp: DateTime.now()),
//   //               role: role.copyWith(type: RoleType('internal_sales_rep'))),
//   //           salesOrganisation.salesOrg)),
//   //       expect: () => [
//   //         AupTcState(
//   //             showTermsAndConditon: false,
//   //             title: 'Acceptable Use Policy',
//   //             url: config.getAUPVNUrl,
//   //             initialFile: config.getAUPVNFile)
//   //       ],
//   //     );
//   //   },
//   // );

//   group(
//     'UserLogin as salseorg=NotVN role=roleIsAupAudience',
//     () {
//       setUpAll(() {
//         salesOrganisation = user.userSalesOrganisations.first
//             .copyWith(salesOrg: SalesOrg('3152'));
//       });

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty , salseorg=NotVN role=roleIsAupAudience, acceptAUP - false, acceptAUPTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate),
//           );
//         },
//         act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//             user.copyWith(
//                 settingAup: settingAup.copyWith(
//                     acceptAUP: false, acceptAUPTimestamp: DateTime.now()),
//                 role: role.copyWith(type: RoleType('internal_sales_rep'))),
//             salesOrganisation.salesOrg)),
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPUrl,
//               initialFile: config.getAUPFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty , salseorg=NotVN role=roleIsAupAudience, acceptAUP - true, acceptAUPTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) => bloc.add(AupTcEvent.show(
//             user.copyWith(
//                 settingAup: settingAup.copyWith(acceptAUP: true),
//                 role: role.copyWith(type: RoleType('internal_sales_rep'))),
//             salesOrganisation.salesOrg)),
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPUrl,
//               initialFile: config.getAUPFile)
//         ],
//       );
//       // blocTest<AupTcBloc, AupTcState>(
//       //   '''Loged in and userbloc state is Not empty , salseorg=NotVN role=roleIsAupAudience, acceptAUP - true
//       //    acceptAUPTimestamp > tncDate
//       //   ''',
//       //   build: () => AupTcBloc(
//       //     aupTcRepository: aupTcRepository,
//       //     config: config,
//       //   ),
//       //   setUp: () async {
//       //     when(() => aupTcRepository.getTncDate()).thenAnswer(
//       //       (invocation) async => Right(tncDate),
//       //     );
//       //   },
//       //   act: (AupTcBloc bloc) {
//       //     bloc.add(AupTcEvent.show(
//       //         user.copyWith(
//       //             settingAup: settingAup.copyWith(
//       //                 acceptAUP: true, acceptAUPTimestamp: DateTime.now()),
//       //             role: role.copyWith(type: RoleType('internal_sales_rep'))),
//       //         salesOrganisation.salesOrg));
//       //   },
//       //   expect: () => [
//       //     AupTcState(
//       //         showTermsAndConditon: false,
//       //         title: 'Acceptable Use Policy',
//       //         url: config.getAUPUrl,
//       //         initialFile: config.getAUPFile)
//       //   ],
//       // );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty salseorg=NotVN role=roleIsAupAudience, acceptAUP - false, acceptAUPTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingAup: settingAup.copyWith(
//                     acceptAUP: false,
//                   ),
//                   role: role.copyWith(type: RoleType('internal_sales_rep'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPUrl,
//               initialFile: config.getAUPFile)
//         ],
//       );

//       // blocTest<AupTcBloc, AupTcState>(
//       //   '''Loged in and userbloc state is Not empty, salseorg=NotVN role=roleIsAupAudience, sacceptAUP - false, tncDate - error
//       //   ''',
//       //   build: () => AupTcBloc(
//       //     aupTcRepository: aupTcRepository,
//       //     config: config,
//       //   ),
//       //   setUp: () async {
//       //     when(() => aupTcRepository.getTncDate()).thenAnswer(
//       //       (invocation) async => const Left(ApiFailure.other('fake-error')),
//       //     );
//       //   },
//       //   act: (AupTcBloc bloc) {
//       //     bloc.add(AupTcEvent.show(
//       //         user.copyWith(
//       //             settingAup: settingAup.copyWith(
//       //                 acceptAUP: false, acceptAUPTimestamp: DateTime.now()),
//       //             role: role.copyWith(type: RoleType('internal_sales_rep'))),
//       //         salesOrganisation.salesOrg));
//       //   },
//       //   expect: () => [
//       //     AupTcState(
//       //         showTermsAndConditon: false,
//       //         title: 'Acceptable Use Policy',
//       //         url: config.getAUPUrl,
//       //         initialFile: config.getAUPFile)
//       //   ],
//       // );

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=NotVN role=roleIsAupAudience, acceptAUP - true, tncDate - error
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => const Left(ApiFailure.other('fake-error')),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingAup: settingAup.copyWith(
//                       acceptAUP: true, acceptAUPTimestamp: DateTime.now()),
//                   role: role.copyWith(type: RoleType('internal_sales_rep'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'Acceptable Use Policy',
//               url: config.getAUPUrl,
//               initialFile: config.getAUPFile)
//         ],
//       );
//     },
//   );
//   group(
//     'UserLogin as salseorg=VN role=roleIsTcAudience',
//     () {
//       setUpAll(() {
//         salesOrganisation = user.userSalesOrganisations.first
//             .copyWith(salesOrg: SalesOrg('3000'));
//       });

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty , salseorg=VN role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VN role=roleIsTcAudience, acceptTC - true, acceptTCTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: true,
//                   ),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VN role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VN role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(acceptPrivacyPolicy: false),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VN role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp - error
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => const Left(ApiFailure.other('fake-error')),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VN role=roleIsTcAudience, acceptTC - true, acceptTCTimestamp - error
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => const Left(ApiFailure.other('fake-error')),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCVNUrl,
//               initialFile: config.getTCVNFile)
//         ],
//       );
//     },
//   );

//   group(
//     'UserLogin as salseorg=VNNOT role=roleIsTcAudience',
//     () {
//       setUpAll(() {
//         salesOrganisation = user.userSalesOrganisations.first
//             .copyWith(salesOrg: SalesOrg('2500'));
//       });

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - true, acceptTCTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                   ),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: true,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - true, acceptTCTimestamp > tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                      acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.now().add(const Duration(seconds: 30)),
//                     privacyPolicyAcceptedPlatform: 'Mobile'
//                   ),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );
//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp < tncDate
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => Right(tncDate.copyWith(date: DateTime.now())),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           return bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                        acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.now().add(const Duration(seconds: 30)),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - false, acceptTCTimestamp - error
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => const Left(ApiFailure.other('fake-error')),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                        acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.now(),
//                     privacyPolicyAcceptedPlatform: 'Mobile'),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );

//       blocTest<AupTcBloc, AupTcState>(
//         '''Loged in and userbloc state is Not empty, salseorg=VNNOT role=roleIsTcAudience, acceptTC - true, acceptTCTimestamp - error
//         ''',
//         build: () => AupTcBloc(
//           aupTcRepository: aupTcRepository,
//           config: config,
//         ),
//         setUp: () async {
//           when(() => aupTcRepository.getTncDate()).thenAnswer(
//             (invocation) async => const Left(ApiFailure.other('fake-error')),
//           );
//         },
//         act: (AupTcBloc bloc) {
//           bloc.add(AupTcEvent.show(
//               user.copyWith(
//                   settingTc: settingTc.copyWith(
//                     acceptPrivacyPolicy: false,
//                     acceptPrivacyPolicyTime: DateTime.now(),
//                     privacyPolicyAcceptedPlatform: 'Mobile'
//                   ),
//                   role: role.copyWith(type: RoleType('client_admin'))),
//               salesOrganisation.salesOrg));
//         },
//         expect: () => [
//           AupTcState(
//               showTermsAndConditon: false,
//               title: 'TERMS OF USE',
//               url: config.getTCUrl,
//               initialFile: config.getTCFile)
//         ],
//       );
//     },
//   );
// }
}
