import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_rights_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_and_approver_rights.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approval_limit_details.dart';
import 'package:ezrxmobile/domain/returns/entities/user_restriction_status.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/user_restriction_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/user_restrictions_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/user_restriction_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UserRestrictionLocalDataSourceMock extends Mock
    implements UserRestrictionLocalDataSource {}

class UserRestrictionRemoteDataSourceMock extends Mock
    implements UserRestrictionRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late SalesOrg salesOrg;
  late Config configMock;
  late UserRestrictionListDto mockUserRestrictionListDto;
  late UserRestrictions mockUserRestrictions;
  late UserRestrictionRepository userRestrictionRepository;
  late UserRestrictionLocalDataSource userRestrictionLocalDataSource;
  late UserRestrictionRemoteDataSource userRestrictionRemoteDataSource;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    final data = json.decode(
      await rootBundle.loadString('assets/json/userRestrictionResponse.json'),
    );
    final userRestrictionDetailsRes = json.decode(
      await rootBundle
          .loadString('assets/json/getReturnApprovalAndApproverRights.json'),
    );
    final finalData = data['data']['approverRights'];

    configMock = ConfigMock();
    mockUserRestrictionListDto = UserRestrictionListDto.fromJson(finalData);
    mockUserRestrictions =
        UserRestrictionsDto.fromJson(userRestrictionDetailsRes['data'])
            .toDomain();
    userRestrictionLocalDataSource = UserRestrictionLocalDataSourceMock();
    userRestrictionRemoteDataSource = UserRestrictionRemoteDataSourceMock();
    salesOrg = SalesOrg('2601');

    userRestrictionRepository = UserRestrictionRepository(
      config: configMock,
      localDataSource: userRestrictionLocalDataSource,
      remoteDataSource: userRestrictionRemoteDataSource,
    );
  });

  group('User Restriction Repository Test', () {
    test('Fetch restriction list from local data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => userRestrictionLocalDataSource.fetch()).thenAnswer(
        (invocation) async => mockUserRestrictionListDto,
      );

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isRight(), true);
    });

    test('Fetch restriction list from local data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => userRestrictionLocalDataSource.fetch())
          .thenThrow((invocation) async => MockException());

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isLeft(), true);
    });

    test('Fetch restriction list from remote data source successfully',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => userRestrictionRemoteDataSource.fetch(
            salesOrg: salesOrg.getOrCrash(),
          )).thenAnswer((invocation) async => mockUserRestrictionListDto);

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isRight(), true);
    });

    test('Fetch restriction list from remote data source failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => userRestrictionRemoteDataSource.fetch(
            salesOrg: salesOrg.getOrCrash(),
          )).thenThrow((invocation) async => MockException());

      final result =
          await userRestrictionRepository.getUserRestrictionsList(salesOrg);

      expect(result.isLeft(), true);
    });
  });

  test('Fetch restriction Details from remote data source successfully',
      () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.getUserRestrictions(
          userName: 'fake-username',
          salesOrg: salesOrg.getOrCrash(),
        )).thenAnswer((invocation) async => mockUserRestrictions);

    final result = await userRestrictionRepository.getUserRestrictions(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        userName: Username('fake-username'));

    expect(result.isRight(), true);
  });

  test('Fetch restriction Details from remote data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.getUserRestrictions(
          userName: 'fake-username',
          salesOrg: salesOrg.getOrCrash(),
        )).thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.getUserRestrictions(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        userName: Username('fake-username'));

    expect(result.isLeft(), true);
  });

  test('Fetch restriction Details from local data source successfully',
      () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.getUserRestrictions()).thenAnswer(
      (invocation) async => UserRestrictions(
          approverLimits: [], approverRights: ApproverRights.empty()),
    );

    final result = await userRestrictionRepository.getUserRestrictions(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        userName: Username('fake-username'));

    expect(result.isRight(), true);
  });

  test('Fetch restriction Details from local data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.getUserRestrictions()).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await userRestrictionRepository.getUserRestrictions(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        userName: Username('fake-username'));

    expect(result.isLeft(), true);
  });

  test('addApprovalLimit remote data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.addApprovalLimit(
            userName: 'fake-username',
            salesOrg: salesOrg.getOrCrash(),
            valueLowerLimit: 0,
            valueUpperLimit: 10))
        .thenAnswer(
            (invocation) async => UserRestrictionStatus.empty().copyWith(
                  approvalLimitStatus: true,
                ));

    final result = await userRestrictionRepository.addApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: '',
    ));

    expect(result.isRight(), true);
  });

  test('addApprovalLimit remote data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.addApprovalLimit(
        userName: 'fake-username',
        salesOrg: salesOrg.getOrCrash(),
        valueLowerLimit: 0,
        valueUpperLimit: 10)).thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.addApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: '',
    ));

    expect(result.isLeft(), true);
  });

  test('addApprovalLimit local data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.addApprovalLimit()).thenAnswer(
        (invocation) async => UserRestrictionStatus.empty().copyWith(
              approvalLimitStatus: true,
            ));

    final result = await userRestrictionRepository.addApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: '',
    ));

    expect(result.isRight(), true);
  });

  test('addApprovalLimit local data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.addApprovalLimit())
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.addApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: '',
    ));

    expect(result.isLeft(), true);
  });

  test('addApproverRights remote data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.configureUserRestriction(
            approverRightsList: <Map<String, dynamic>>[
              {
                'salesOrg': salesOrg.getOrCrash(),
                'principal': 'principal',
                'industryCode1': 'industryCode1',
                'industryCode2': 'industryCode2',
                'industryCode3': 'industryCode3',
                'industryCode4': 'industryCode4',
                'industryCode5': 'industryCode5',
                'plant': 'plant',
                'materialNumber': 'materialNumber',
              }
            ],
            userName: 'fake-username')).thenAnswer((invocation) async =>
        UserRestrictionStatus.empty()
            .copyWith(approverRightsStatus: 'fake-status'));

    final result = await userRestrictionRepository.configureUserRestriction(
        approverRights: ApproverRights.empty()
            .copyWith(userName: Username('fake-username'), approverRightsList: [
      ApproverRightsDetails(
          salesOrg: salesOrg,
          principal: 'principal',
          industryCode1: 'industryCode1',
          industryCode2: 'industryCode2',
          industryCode3: 'industryCode3',
          industryCode4: 'industryCode4',
          industryCode5: 'industryCode5',
          plant: 'plant',
          materialNumber: MaterialNumber('materialNumber'),
          uuid: 'uuid')
    ]));

    expect(result.isRight(), true);
  });

  test('addApproverRights remote data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.configureUserRestriction(
                approverRightsList: <Map<String, dynamic>>[
                  {
                    'salesOrg': salesOrg.getOrCrash(),
                    'principal': 'principal',
                    'industryCode1': 'industryCode1',
                    'industryCode2': 'industryCode2',
                    'industryCode3': 'industryCode3',
                    'industryCode4': 'industryCode4',
                    'industryCode5': 'industryCode5',
                    'plant': 'plant',
                    'materialNumber': 'materialNumber',
                  }
                ],
                userName: 'fake-username'))
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.configureUserRestriction(
        approverRights: ApproverRights.empty()
            .copyWith(userName: Username('fake-username'), approverRightsList: [
      ApproverRightsDetails(
          salesOrg: salesOrg,
          principal: 'principal',
          industryCode1: 'industryCode1',
          industryCode2: 'industryCode2',
          industryCode3: 'industryCode3',
          industryCode4: 'industryCode4',
          industryCode5: 'industryCode5',
          plant: 'plant',
          materialNumber: MaterialNumber('materialNumber'),
          uuid: 'uuid')
    ]));

    expect(result.isLeft(), true);
  });

  test('addApproverRights local data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.configureUserRestriction())
        .thenAnswer((invocation) async => UserRestrictionStatus.empty()
            .copyWith(approverRightsStatus: 'fake-status'));

    final result = await userRestrictionRepository.configureUserRestriction(
        approverRights: ApproverRights.empty()
            .copyWith(userName: Username('fake-username'), approverRightsList: [
      ApproverRightsDetails(
          salesOrg: salesOrg,
          principal: 'principal',
          industryCode1: 'industryCode1',
          industryCode2: 'industryCode2',
          industryCode3: 'industryCode3',
          industryCode4: 'industryCode4',
          industryCode5: 'industryCode5',
          plant: 'plant',
          materialNumber: MaterialNumber('materialNumber'),
          uuid: 'uuid')
    ]));

    expect(result.isRight(), true);
  });

  test('addApproverRights local data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.configureUserRestriction())
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.configureUserRestriction(
        approverRights: ApproverRights.empty()
            .copyWith(userName: Username('fake-username'), approverRightsList: [
      ApproverRightsDetails(
          salesOrg: salesOrg,
          principal: 'principal',
          industryCode1: 'industryCode1',
          industryCode2: 'industryCode2',
          industryCode3: 'industryCode3',
          industryCode4: 'industryCode4',
          industryCode5: 'industryCode5',
          plant: 'plant',
          materialNumber: MaterialNumber('materialNumber'),
          uuid: 'uuid')
    ]));

    expect(result.isLeft(), true);
  });

  test('deleteApprovalLimit remote data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() =>
            userRestrictionRemoteDataSource.deleteApprovalLimit(uuid: 'uuid'))
        .thenAnswer(
            (invocation) async => UserRestrictionStatus.empty().copyWith(
                  approvalLimitStatus: true,
                ));

    final result = await userRestrictionRepository.deleteApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: 'uuid',
    ));

    expect(result.isRight(), true);
  });

  test('deleteApprovalLimit remote data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() =>
            userRestrictionRemoteDataSource.deleteApprovalLimit(uuid: 'uuid'))
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.deleteApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: 'uuid',
    ));

    expect(result.isLeft(), true);
  });

  test('deleteApprovalLimit local data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.deleteApprovalLimit()).thenAnswer(
        (invocation) async => UserRestrictionStatus.empty().copyWith(
              approvalLimitStatus: true,
            ));

    final result = await userRestrictionRepository.deleteApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: 'uuid',
    ));

    expect(result.isRight(), true);
  });

  test('deleteApprovalLimit local data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionLocalDataSource.deleteApprovalLimit())
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.deleteApprovalLimit(
        approverLimits: ApprovalLimits(
      userName: Username('fake-username'),
      salesOrg: salesOrg,
      valueLowerLimit: ApprovalLimit(0),
      valueUpperLimit: ApprovalLimit(10),
      uuid: 'uuid',
    ));

    expect(result.isLeft(), true);
  });

  test('deleteApproverRights remote data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.deleteApprovalRight(
            salesOrg: salesOrg.getOrCrash(), uuid: 'uuid'))
        .thenAnswer((invocation) async => UserRestrictionStatus.empty()
            .copyWith(approverRightsStatus: 'fake-status'));

    final result = await userRestrictionRepository.deleteApprovalRights(
        approverRights: ApproverRights.empty().copyWith(approverRightsList: [
      ApproverRightsDetails.empty().copyWith(
        salesOrg: salesOrg,
        uuid: 'uuid',
      )
    ]));

    expect(result.isRight(), true);
  });

  test('deleteApproverRights remote data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionRemoteDataSource.deleteApprovalRight(
        salesOrg: salesOrg.getOrCrash(),
        uuid: 'uuid')).thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.deleteApprovalRights(
        approverRights: ApproverRights.empty().copyWith(approverRightsList: [
      ApproverRightsDetails.empty().copyWith(
        salesOrg: salesOrg,
        uuid: 'uuid',
      )
    ]));

    expect(result.isLeft(), true);
  });

  test('deleteApproverRights local data source success', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.mock);
    when(() => userRestrictionLocalDataSource.deleteApprovalRights())
        .thenAnswer((invocation) async => UserRestrictionStatus.empty()
            .copyWith(approverRightsStatus: 'fake-status'));

    final result = await userRestrictionRepository.deleteApprovalRights(
        approverRights: ApproverRights.empty().copyWith(approverRightsList: [
      ApproverRightsDetails.empty().copyWith(
        salesOrg: salesOrg,
        uuid: 'uuid',
      )
    ]));

    expect(result.isRight(), true);
  });

  test('deleteApproverRights local data source fail', () async {
    when(() => configMock.appFlavor).thenReturn(Flavor.uat);
    when(() => userRestrictionLocalDataSource.deleteApprovalRights())
        .thenThrow((invocation) async => MockException());

    final result = await userRestrictionRepository.deleteApprovalRights(
        approverRights: ApproverRights.empty().copyWith(approverRightsList: [
      ApproverRightsDetails.empty().copyWith(
        salesOrg: salesOrg,
        uuid: 'uuid',
      )
    ]));

    expect(result.isLeft(), true);
  });
}
