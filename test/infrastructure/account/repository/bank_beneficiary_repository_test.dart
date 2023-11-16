import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/bank_beneficiary_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bank_beneficiary_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/bank_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class BankBeneficiaryLocalDataSourceMock extends Mock
    implements BankBeneficiaryLocalDataSource {}

class BankBeneficiaryRemoteDataSourceMock extends Mock
    implements BankBeneficiaryRemoteDataSource {}

void main() {
  late BankBeneficiaryRepository bankBeneficiaryRepo;
  late Config mockConfig;
  late BankBeneficiaryLocalDataSource localDataSource;
  late BankBeneficiaryRemoteDataSource remoteDataSource;

  final bankBeneficiaryMockList = [
    BankBeneficiary.empty(),
    BankBeneficiary.empty(),
  ];

  final salesDistrictMockList = [SalesDistrict.empty()];

  final bankBeneficiaryResponseMock = BankBeneficiaryResponse.empty();

  final saleOrgMock = SalesOrg('3050');

  final beneficiaryDataMock = BankBeneficiary.empty().copyWith(
    salesOrg: saleOrgMock,
    salesDistrict: 'HCM',
  );

  final bankInAccountsMockList = [
    BankBeneficiary.empty(),
    BankBeneficiary.empty(),
  ];

  setUpAll(() {
    mockConfig = MockConfig();
    localDataSource = BankBeneficiaryLocalDataSourceMock();
    remoteDataSource = BankBeneficiaryRemoteDataSourceMock();

    bankBeneficiaryRepo = BankBeneficiaryRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });

  group('BankBeneficiaryRepository => getBankBeneficiaries', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiaries())
          .thenAnswer((invocation) async => bankBeneficiaryMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiaries();
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiaries())
          .thenThrow(MockException());

      final result = await bankBeneficiaryRepo.getBankBeneficiaries();
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => remoteDataSource.getBankBeneficiaries())
          .thenAnswer((invocation) async => bankBeneficiaryMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiaries();
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => remoteDataSource.getBankBeneficiaries()).thenThrow(Error());

      final result = await bankBeneficiaryRepo.getBankBeneficiaries();
      expect(result.isLeft(), true);
    });
  });

  group('BankBeneficiaryRepository => getSalesDistrict', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getSalesDistrict())
          .thenAnswer((invocation) async => salesDistrictMockList);

      final result = await bankBeneficiaryRepo.getSalesDistrict(
        salesOrg: SalesOrg('3050'),
      );
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getSalesDistrict()).thenThrow(MockException());

      final result = await bankBeneficiaryRepo.getSalesDistrict(
        salesOrg: SalesOrg('3050'),
      );
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => remoteDataSource.getSalesDistrict(salesOrg: '3050'))
          .thenAnswer((invocation) async => salesDistrictMockList);

      final result = await bankBeneficiaryRepo.getSalesDistrict(
        salesOrg: SalesOrg('3050'),
      );
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => remoteDataSource.getSalesDistrict(salesOrg: '3050'))
          .thenThrow(Error());

      final result = await bankBeneficiaryRepo.getSalesDistrict(
        salesOrg: SalesOrg('3050'),
      );
      expect(result.isLeft(), true);
    });
  });

  group('BankBeneficiaryRepository => addOrUpdateBeneficiary', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.addOrUpdateBeneficiary())
          .thenAnswer((invocation) async => bankBeneficiaryResponseMock);

      final result = await bankBeneficiaryRepo.addOrUpdateBeneficiary(
        beneficiaryData: beneficiaryDataMock,
      );
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.addOrUpdateBeneficiary())
          .thenThrow(MockException());

      final result = await bankBeneficiaryRepo.addOrUpdateBeneficiary(
        beneficiaryData: beneficiaryDataMock,
      );
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.addOrUpdateBeneficiary(
          beneficiaryData:
              BankBeneficiaryDto.fromDomain(beneficiaryDataMock).toJson(),
        ),
      ).thenAnswer((invocation) async => bankBeneficiaryResponseMock);

      final result = await bankBeneficiaryRepo.addOrUpdateBeneficiary(
        beneficiaryData: beneficiaryDataMock,
      );
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.addOrUpdateBeneficiary(
          beneficiaryData:
              BankBeneficiaryDto.fromDomain(beneficiaryDataMock).toJson(),
        ),
      ).thenThrow(Error());

      final result = await bankBeneficiaryRepo.addOrUpdateBeneficiary(
        beneficiaryData: beneficiaryDataMock,
      );
      expect(result.isLeft(), true);
    });
  });

  group('BankBeneficiaryRepository => deleteBeneficiary', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.deleteBeneficiary())
          .thenAnswer((invocation) async => bankBeneficiaryResponseMock);

      final result = await bankBeneficiaryRepo.deleteBeneficiary(
        salesOrg: beneficiaryDataMock.salesOrg,
        salesDistrict: beneficiaryDataMock.salesDistrict,
      );
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.deleteBeneficiary())
          .thenThrow(MockException());

      final result = await bankBeneficiaryRepo.deleteBeneficiary(
        salesOrg: beneficiaryDataMock.salesOrg,
        salesDistrict: beneficiaryDataMock.salesDistrict,
      );
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.deleteBeneficiary(
          salesOrg: '3050',
          salesDistrict: 'HCM',
        ),
      ).thenAnswer((invocation) async => bankBeneficiaryResponseMock);

      final result = await bankBeneficiaryRepo.deleteBeneficiary(
        salesOrg: beneficiaryDataMock.salesOrg,
        salesDistrict: beneficiaryDataMock.salesDistrict,
      );
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.deleteBeneficiary(
          salesOrg: '3050',
          salesDistrict: 'HCM',
        ),
      ).thenThrow(Error());

      final result = await bankBeneficiaryRepo.deleteBeneficiary(
        salesOrg: beneficiaryDataMock.salesOrg,
        salesDistrict: beneficiaryDataMock.salesDistrict,
      );
      expect(result.isLeft(), true);
    });
  });

  group('BankBeneficiaryRepository => getBankBeneficiariesBySaleOrg', () {
    test('successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiariesBySaleOrg())
          .thenAnswer((invocation) async => bankInAccountsMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isRight(), true);
    });

    test('fails locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSource.getBankBeneficiariesBySaleOrg())
          .thenThrow(MockException());

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isLeft(), true);
    });

    test('successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.getBankBeneficiariesBySaleOrg(
          salesOrg: saleOrgMock.getOrDefaultValue(''),
        ),
      ).thenAnswer((invocation) async => bankInAccountsMockList);

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isRight(), true);
    });

    test('fails remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => remoteDataSource.getBankBeneficiariesBySaleOrg(
          salesOrg: saleOrgMock.getOrDefaultValue(''),
        ),
      ).thenThrow(Error());

      final result = await bankBeneficiaryRepo.getBankBeneficiariesBySaleOrg(
        salesOrg: saleOrgMock,
      );
      expect(result.isLeft(), true);
    });
  });
}
