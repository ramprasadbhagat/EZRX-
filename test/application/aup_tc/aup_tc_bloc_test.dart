import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/config.dart';
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
  // late TncDate tncDate;
  // late Role role;
  late TokenStorage tokenStorage;

  setUpAll(() async {
    const rootAdminToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsIkNSRUFURURfQVQiOjE2ODYxMTE2ODcsImV4cCI6MTY4NjExNTI4NywiaWF0IjoxNjg2MTExNjg3LCJpZCI6Mzg2MCwicmlnaHRzIjpbeyJ2YWx1ZSI6W3siY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyMDAxIiwic2hpcFRvQ29kZSI6WyJhbGwiXX1dfV0sInJvbGUiOiJST09UIEFkbWluIiwic2FsZXNPcmdzIjpbIjIwMDEiXSwidXNlcm5hbWUiOiJyb290YWRtaW4ifQ.StCC3ABQsxfsnKud8SL74AV_hHQGqKhf8IoH_9pYGcM';
    //final fakeJWT = JWT(rootAdminToken);
    config = Config()..appFlavor = Flavor.mock;
    aupTcRepository = MockAupTcRepository();
    aupTcRepository = MockAupTcRepository();
    tncDate = TncDate.empty();
    tokenStorage = MockTokenStorage();
    when(() => tokenStorage.get())
        .thenAnswer((invocation) async => JWTDto(access: rootAdminToken));
    user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
    await UserLocalDataSource(tokenStorage: tokenStorage)
        .updateUserNotificationAndLanguagePreference();
    await UserLocalDataSource(tokenStorage: tokenStorage).updateUserTC();

    settingTc = SettingTc(
        acceptPrivacyPolicy: false,
        acceptPrivacyPolicyTime: tncDate.date,
        privacyPolicyAcceptedPlatform: 'Mobile');
    // tncDate = TncDate(date: DateTime.parse('1970-01-01 00:00:00'));
    // role = Role.empty().copyWith(type: RoleType('internal_sales_rep'));
  });

  group(
    'UserLogin Accept Updated Privacy Policy',
    () {
      setUpAll(() async {
        salesOrganisation = user.userSalesOrganisations.first
            .copyWith(salesOrg: SalesOrg('2500'));
        when(() => MockTokenStorage().get())
            .thenAnswer((invocation) async => JWTDto(access: ''));
        user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
      });

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false,
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              salesOrganisation.salesOrg));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCENUrl,
              initialFile: config.getTCENFile)
        ],
      );
      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - true,
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                  acceptPrivacyPolicy: true,
                ),
              ),
              salesOrganisation.salesOrg));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: false,
              url: config.getTCENUrl,
              initialFile: config.getTCENFile)
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is VN
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              SalesOrg('3070')));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCVNUrl,
              initialFile: config.getTCVNFile)
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is TW
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              SalesOrg('2800')));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCTWUrl,
              initialFile: config.getTCTWFile)
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is TH
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              SalesOrg('2902')));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCTHUrl,
              initialFile: config.getTCTHFile)
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is MM
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              SalesOrg('2201')));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCMMUrl,
              initialFile: config.getTCMMFile)
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is KH
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(AupTcEvent.show(
              user.copyWith(
                settingTc: settingTc.copyWith(
                    acceptPrivacyPolicy: false,
                    acceptPrivacyPolicyTime: tncDate.date,
                    privacyPolicyAcceptedPlatform: 'Mobile'),
              ),
              SalesOrg('1500')));
        },
        expect: () => [
          AupTcState(
              showTermsAndConditon: true,
              url: config.getTCKHUrl,
              initialFile: config.getTCKHFile)
        ],
      );
    },
  );
}
