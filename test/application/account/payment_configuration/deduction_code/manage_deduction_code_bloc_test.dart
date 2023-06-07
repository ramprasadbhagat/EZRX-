import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/deduction_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/deduction_code_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeductionCodeRepositoryMock extends Mock
    implements DeductionCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late DeductionCodeRepository deductionCodeRepositoryMock;
  late AddDeductionCode addDeductionCode, deleteDeductionCode;
  late List<DeductionCode> deductionCodeList;

  group(
    'Manage DeductionCode Bloc Testing',
    () {
      setUp(() async {
        deductionCodeRepositoryMock = DeductionCodeRepositoryMock();
        deductionCodeList =
            await DeductionCodeLocalDataSource().getDeductionCodes();
        addDeductionCode =
            await DeductionCodeLocalDataSource().addDeductionCode();
        deleteDeductionCode =
            await DeductionCodeLocalDataSource().deleteDeductionCode();
      });
      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "fetch" Event with Success',
        setUp: () => when(() => deductionCodeRepositoryMock.getDeductionCodes())
            .thenAnswer(
          (invocation) async => Right(deductionCodeList),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ManageDeductionCodeEvent.fetch()),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isFetching: true,
          ),
          ManageDeductionCodeState.initial().copyWith(
            isFetching: false,
            deductionCodeList: deductionCodeList,
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "fetch" Event with Failure',
        setUp: () => when(() => deductionCodeRepositoryMock.getDeductionCodes())
            .thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake Error'),
          ),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(const ManageDeductionCodeEvent.fetch()),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isFetching: true,
          ),
          ManageDeductionCodeState.initial().copyWith(
            isFetching: false,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake Error'),
              ),
            ),
          ),
        ],
      );
      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "onValueChange" Event',
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc
          ..add(
            const ManageDeductionCodeEvent.onValueChange(
              label: DeductionCodeLabel.salesOrg,
              newValue: '2601',
            ),
          )
          ..add(
            const ManageDeductionCodeEvent.onValueChange(
              label: DeductionCodeLabel.salesDistrict,
              newValue: 'HNO',
            ),
          )
          ..add(
            const ManageDeductionCodeEvent.onValueChange(
              label: DeductionCodeLabel.deductionCode,
              newValue: 'R4',
            ),
          )
          ..add(
            const ManageDeductionCodeEvent.onValueChange(
              label: DeductionCodeLabel.amountType,
              newValue: 'Return',
            ),
          )
          ..add(
            const ManageDeductionCodeEvent.onValueChange(
              label: DeductionCodeLabel.deductionDescription,
              newValue: 'Test',
            ),
          ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ],
      );
      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "setDeductionCodeData" Event',
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageDeductionCodeEvent.setDeductionCodeData(
            data: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ],
      );
      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "deleteDeductionCode" Event with SUCCESS',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeList: [
            DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ],
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(deleteDeductionCode),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageDeductionCodeEvent.deleteDeductionCode(
            data: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeList: [
              DeductionCode.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrict: StringValue('HNO'),
                deductionCode: StringValue('R4'),
                amountType: StringValue('Return'),
                deductionDescription: StringValue('Test'),
                isDeleteInProgress: true,
              ),
            ],
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            response: deleteDeductionCode,
          ),
        ],
      );
      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "deleteDeductionCode" Event with FAILURE',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeList: [
            DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ],
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.deleteDeductionCode(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          ManageDeductionCodeEvent.deleteDeductionCode(
            data: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeList: [
              DeductionCode.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrict: StringValue('HNO'),
                deductionCode: StringValue('R4'),
                amountType: StringValue('Return'),
                deductionDescription: StringValue('Test'),
                isDeleteInProgress: true,
              ),
            ],
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            response: AddDeductionCode.empty(),
            deductionCodeList: [
              DeductionCode.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrict: StringValue('HNO'),
                deductionCode: StringValue('R4'),
                amountType: StringValue('Return'),
                deductionDescription: StringValue('Test'),
              ),
            ],
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for add Event with SUCCESS',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            deductionCode: StringValue('R4'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test'),
          ),
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(addDeductionCode),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: false,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            deductionCodeData: DeductionCode.empty(),
            deductionCodeList: [
              DeductionCodeDto.fromDomain(
                DeductionCode.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: StringValue('HNO'),
                  deductionCode: StringValue('R4'),
                  amountType: StringValue('Return'),
                  deductionDescription: StringValue('Test'),
                ),
              ).toDomain(),
            ],
            response: addDeductionCode,
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for edit Event with SUCCESS',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            deductionCode: StringValue('R4'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test1'),
          ),
          deductionCodeList: <DeductionCode>[
            DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test1'),
            ),
          ],
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test1'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(addDeductionCode),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: true,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test1'),
            ),
            deductionCodeList: [
              DeductionCode.empty().copyWith(
                salesOrg: SalesOrg('2601'),
                salesDistrict: StringValue('HNO'),
                deductionCode: StringValue('R4'),
                amountType: StringValue('Return'),
                deductionDescription: StringValue('Test1'),
              ),
            ],
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            deductionCodeData: DeductionCode.empty(),
            deductionCodeList: [
              DeductionCodeDto.fromDomain(
                DeductionCode.empty().copyWith(
                  salesOrg: SalesOrg('2601'),
                  salesDistrict: StringValue('HNO'),
                  deductionCode: StringValue('R4'),
                  amountType: StringValue('Return'),
                  deductionDescription: StringValue('Test1'),
                ),
              ).toDomain(),
            ],
            response: addDeductionCode,
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for add Event with ERROR',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            deductionCode: StringValue('R4'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test'),
          ),
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: false,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for edit Event with ERROR',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            deductionCode: StringValue('R4'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test'),
          ),
        ),
        setUp: () => when(
          () => deductionCodeRepositoryMock.addDeductionCodes(
            deductionCode: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('FAKE-ERROR')),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: true,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: true,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
          ),
          ManageDeductionCodeState.initial().copyWith(
            isSubmitting: false,
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              deductionCode: StringValue('R4'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('FAKE-ERROR'),
              ),
            ),
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for add Event with Validation ERROR',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test'),
          ),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: false,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
            showErrorMessages: true,
          ),
        ],
      );

      blocTest<ManageDeductionCodeBloc, ManageDeductionCodeState>(
        'For "addOrEditDeductionCode" for edit Event with Validation ERROR',
        seed: () => ManageDeductionCodeState.initial().copyWith(
          deductionCodeData: DeductionCode.empty().copyWith(
            salesOrg: SalesOrg('2601'),
            salesDistrict: StringValue('HNO'),
            amountType: StringValue('Return'),
            deductionDescription: StringValue('Test'),
          ),
        ),
        build: () => ManageDeductionCodeBloc(
          deductionCodeRepository: deductionCodeRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const ManageDeductionCodeEvent.addOrEditDeductionCode(
            isEdit: true,
          ),
        ),
        expect: () => [
          ManageDeductionCodeState.initial().copyWith(
            deductionCodeData: DeductionCode.empty().copyWith(
              salesOrg: SalesOrg('2601'),
              salesDistrict: StringValue('HNO'),
              amountType: StringValue('Return'),
              deductionDescription: StringValue('Test'),
            ),
            showErrorMessages: true,
          ),
        ],
      );
    },
  );
}
