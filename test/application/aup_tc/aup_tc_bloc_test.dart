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
        privacyPolicyAcceptedPlatform: 'Mobile'
    );
    tncDate = TncDate(date: DateTime.parse('1970-01-01 00:00:00'));
    role = Role.empty().copyWith(type: RoleType('internal_sales_rep'));
  });

  group(
    'UserLogin Accept Updated Privacy Policy',
    () {
      setUpAll(() {
        salesOrganisation = user.userSalesOrganisations.first
            .copyWith(salesOrg: SalesOrg('2500'));
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
                    acceptPrivacyPolicyTime: DateTime.parse('1970-01-01 00:00:00'),
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
