import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/submit_return_response.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/submit_return_request_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/submit_return_request_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class SubmitReturnRequestLocalDataSourceMock extends Mock
    implements SubmitReturnRequestLocalDataSource {}

class SubmitReturnRequestRemoteDataSourceMock extends Mock
    implements SubmitReturnRequestRemoteDataSource {}

void main() {
  late SubmitRequestReturnRepository submitReturnRepository;
  late Config mockConfig;
  late SubmitReturnRequestLocalDataSource submitReturnRequestLocalDataSource;
  late SubmitReturnRequestRemoteDataSource submitReturnRequestRemoteDataSource;

  final submitReturnResponse = SubmitReturnResponse.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    submitReturnRequestLocalDataSource =
        SubmitReturnRequestLocalDataSourceMock();
    submitReturnRequestRemoteDataSource =
        SubmitReturnRequestRemoteDataSourceMock();

    submitReturnRepository = SubmitRequestReturnRepository(
      config: mockConfig,
      localDataSource: submitReturnRequestLocalDataSource,
      remoteDataSource: submitReturnRequestRemoteDataSource,
    );
  });

  group(
    'Submit return Repository =>',
    () {
      test(
        'submit return Success locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => submitReturnRequestLocalDataSource.submitReturnRequest())
              .thenAnswer((invocation) async => submitReturnResponse);

          final result = await submitReturnRepository.submitRequestReturn(
              customerCodeInfo: CustomerCodeInfo.empty(),
              returnReferenceNumber: '',
              specialInstructions: '',
              user: User.empty(),
              returnItemsList: [],
              salesOrg: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('fake-salesOrg')));
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test('submit return fail locally', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => submitReturnRequestLocalDataSource.submitReturnRequest())
            .thenThrow(const ApiFailure.serverTimeout());

        final result = await submitReturnRepository.submitRequestReturn(
            customerCodeInfo: CustomerCodeInfo.empty(),
            returnReferenceNumber: '',
            specialInstructions: '',
            user: User.empty(),
            returnItemsList: [],
            salesOrg: SalesOrganisation.empty()
                .copyWith(salesOrg: SalesOrg('fake-salesOrg')));
        expect(
          result.isLeft(),
          true,
        );
      });

      test('submit return success remote', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => submitReturnRequestRemoteDataSource
                .submitReturnRequest(returnInput: {
              'soldToCustomer': 'fake-sold-to',
              'username': 'fake-name',
              'orderSource': '',
              'subscribeStatusChange': false,
              'specialInstruction': '',
              'purchaseNumberC': '',
              'invoiceDetails': []
            })).thenAnswer((invocation) async => submitReturnResponse);

        final result = await submitReturnRepository.submitRequestReturn(
            returnReferenceNumber: '',
            specialInstructions: '',
            user: User.empty().copyWith(username: Username('fake-name')),
            customerCodeInfo: CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-sold-to'),
            returnItemsList: [],
            salesOrg: SalesOrganisation.empty()
                .copyWith(salesOrg: SalesOrg('fake-salesOrg')));
        expect(
          result.isRight(),
          true,
        );
      });
    },
  );
}
