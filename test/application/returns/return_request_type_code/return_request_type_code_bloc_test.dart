import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_type_code_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnRequestTypeCodeRepoMock extends Mock
    implements ReturnRequestTypeCodeRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReturnRequestTypeCodeRepository returnRequestTypeCodeRepositoryMock;
  late List<ReturnRequestTypeCodeDetails> returnRequestTypeCodeDetailsMockData;

  late SalesOrganisation fakeSaleOrganisation;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    returnRequestTypeCodeRepositoryMock = ReturnRequestTypeCodeRepoMock();

    fakeSaleOrganisation = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('fake-1234'),
    );
  });

  group('Return Request Type Code', () {
    setUp(() async {
      returnRequestTypeCodeDetailsMockData =
          await ReturnRequestTypeCodeLocalDataSource()
              .getReturnRequestTypeCodeList();
    });
    blocTest<ReturnRequestTypeCodeBloc, ReturnRequestTypeCodeState>(
      'For Return Request Code Initialized Event',
      build: () => ReturnRequestTypeCodeBloc(
        returnRequestTypeCodeRepository: returnRequestTypeCodeRepositoryMock,
      ),
      act: (bloc) => bloc.add(const ReturnRequestTypeCodeEvent.initialized()),
      expect: () => [ReturnRequestTypeCodeState.initial()],
    );

    blocTest<ReturnRequestTypeCodeBloc, ReturnRequestTypeCodeState>(
      'Return Request Type Code Fetch fail',
      build: () => ReturnRequestTypeCodeBloc(
        returnRequestTypeCodeRepository: returnRequestTypeCodeRepositoryMock,
      ),
      setUp: () {
        when(
          () =>
              returnRequestTypeCodeRepositoryMock.getReturnRequestTypeCodeList(
            salesOrganisation: fakeSaleOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        ReturnRequestTypeCodeEvent.fetch(
          salesOrganisation: fakeSaleOrganisation,
        ),
      ),
      expect: () => [
        ReturnRequestTypeCodeState.initial().copyWith(
          returnRequestTypeCodeDetailsList: <ReturnRequestTypeCodeDetails>[],
          returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        ReturnRequestTypeCodeState.initial().copyWith(
          returnRequestTypeCodeDetailsList: <ReturnRequestTypeCodeDetails>[],
          isFetching: false,
          returnRequestTypeCodeDetailsFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        )
      ],
    );

    blocTest<ReturnRequestTypeCodeBloc, ReturnRequestTypeCodeState>(
      'Return Request Type Code Fetch Success',
      build: () => ReturnRequestTypeCodeBloc(
        returnRequestTypeCodeRepository: returnRequestTypeCodeRepositoryMock,
      ),
      setUp: () {
        when(
          () =>
              returnRequestTypeCodeRepositoryMock.getReturnRequestTypeCodeList(
            salesOrganisation: fakeSaleOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(returnRequestTypeCodeDetailsMockData),
        );
      },
      act: (bloc) => bloc.add(
        ReturnRequestTypeCodeEvent.fetch(
          salesOrganisation: fakeSaleOrganisation,
        ),
      ),
      expect: () => [
        ReturnRequestTypeCodeState.initial().copyWith(
          returnRequestTypeCodeDetailsList: <ReturnRequestTypeCodeDetails>[],
          returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        ReturnRequestTypeCodeState.initial().copyWith(
          returnRequestTypeCodeDetailsList:
              returnRequestTypeCodeDetailsMockData,
          isFetching: false,
          returnRequestTypeCodeDetailsFailureOrSuccessOption: none(),
        )
      ],
    );
  });
}
