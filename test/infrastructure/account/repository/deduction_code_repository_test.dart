import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/deduction_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class DeductionCodeLocalDataSourceMock extends Mock
    implements DeductionCodeLocalDataSource {}

class DeductionCodeRemoteDataSourceMock extends Mock
    implements DeductionCodeRemoteDataSource {}

void main() {
  late DeductionCodeRepository deductionCodeRepo;
  late Config mockConfig;
  late DeductionCodeLocalDataSource deductionLocalSource;
  late DeductionCodeRemoteDataSource deductionRemoteSource;

  final deductionCodeMockList = [
    DeductionCode.empty(),
    DeductionCode.empty(),
  ];

  final addDeductionCodeMock = AddDeductionCode.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    deductionLocalSource = DeductionCodeLocalDataSourceMock();
    deductionRemoteSource = DeductionCodeRemoteDataSourceMock();

    deductionCodeRepo = DeductionCodeRepository(
      config: mockConfig,
      localDataSource: deductionLocalSource,
      remoteDataSource: deductionRemoteSource,
    );
  });

  group(
    'DeductionCodeRepository=>getDeductionCodes - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.getDeductionCodes())
              .thenAnswer((invocation) async => deductionCodeMockList);

          final result = await deductionCodeRepo.getDeductionCodes();
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.getDeductionCodes())
              .thenThrow(MockException());

          final result = await deductionCodeRepo.getDeductionCodes();
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.getDeductionCodes())
              .thenAnswer((invocation) async => deductionCodeMockList);

          final result = await deductionCodeRepo.getDeductionCodes();
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.getDeductionCodes())
              .thenThrow(MockException());

          final result = await deductionCodeRepo.getDeductionCodes();
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );

  group(
    'DeductionCodeRepository=>addDeductionCodes - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.addDeductionCode())
              .thenAnswer((invocation) async => addDeductionCodeMock);

          final result = await deductionCodeRepo.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.addDeductionCode())
              .thenThrow(MockException());

          final result = await deductionCodeRepo.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.addDeductionCode(
                salesOrg: '3050',
                salesDistrict: 'HNO',
                amountType: 'Return',
                deductionCode: 'R4',
                deductionDescription: 'Test',
              )).thenAnswer((invocation) async => addDeductionCodeMock);

          final result = await deductionCodeRepo.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.addDeductionCode(
                salesOrg: '3050',
                salesDistrict: 'HNO',
                amountType: 'Return',
                deductionCode: 'R4',
                deductionDescription: 'Test',
              )).thenThrow(MockException());

          final result = await deductionCodeRepo.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );

  group(
    'DeductionCodeRepository=>deleteDeductionCode - ',
    () {
      test(
        'successfully locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.deleteDeductionCode())
              .thenAnswer((invocation) async => addDeductionCodeMock);

          final result = await deductionCodeRepo.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => deductionLocalSource.deleteDeductionCode())
              .thenThrow(MockException());

          final result = await deductionCodeRepo.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'successfully remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.deleteDeductionCode(
                deductionCode: 'R4',
                salesDistrict: 'HNO',
                salesOrg: '3050',
              )).thenAnswer((invocation) async => addDeductionCodeMock);

          final result = await deductionCodeRepo.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'fails remotely',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(() => deductionRemoteSource.deleteDeductionCode(
                deductionCode: 'R4',
                salesDistrict: 'HNO',
                salesOrg: '3050',
              )).thenThrow(MockException());

          final result = await deductionCodeRepo.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('3050'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );
}
