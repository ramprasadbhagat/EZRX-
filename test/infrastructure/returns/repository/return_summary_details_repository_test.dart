import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnSummaryLocalDataSourceMock extends Mock
    implements ReturnSummaryDetailsRequestInformationLocal {}

class ReturnSummaryRemoteDataSourceMock extends Mock
    implements ReturnSummaryDetailsRequestInformationRemote {}

class ConfigMock extends Mock implements Config {}

void main() {
  late ReturnSummaryDetailsRequestInformationLocal
      returnSummaryDetailsRequestInformationLocal;
  late ReturnSummaryDetailsRequestInformationRemote
      returnSummaryDetailsRequestInformationRemote;
  late Config config;
  late ReturnSummaryDetailsRepository returnSummaryDetailsRepository;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    returnSummaryDetailsRequestInformationLocal =
        ReturnSummaryLocalDataSourceMock();
    returnSummaryDetailsRequestInformationRemote =
        ReturnSummaryRemoteDataSourceMock();
    config = ConfigMock();
    returnSummaryDetailsRepository = ReturnSummaryDetailsRepository(
      config: config,
      returnSummaryDetailsRequestInformationLocal:
          returnSummaryDetailsRequestInformationLocal,
      returnSummaryDetailsRequestInformationRemote:
          returnSummaryDetailsRequestInformationRemote,
    );
  });

  group('Return Summary Details Repository Test', () {
    test('=> getReturnInformation locally success', () async {
      when(() => config.appFlavor).thenReturn(Flavor.mock);
      when(
        () =>
            returnSummaryDetailsRequestInformationLocal.getRequestInformation(),
      ).thenAnswer(
        (invocation) async => RequestInformation.empty(),
      );

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnInformation locally failed', () async {
      when(() => config.appFlavor).thenReturn(Flavor.mock);
      when(
        () =>
            returnSummaryDetailsRequestInformationLocal.getRequestInformation(),
      ).thenThrow((invocation) async => MockException());

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
      );
      expect(result.isLeft(), true);
    });

    test('=> getReturnInformation remote success', () async {
      when(() => config.appFlavor).thenReturn(Flavor.uat);
      when(
        () =>
            returnSummaryDetailsRequestInformationRemote.getRequestInformation(
          returnRequestId: 'mock_id',
        ),
      ).thenAnswer(
        (invocation) async => RequestInformation.empty(),
      );

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnInformation remote failure', () async {
      when(() => config.appFlavor).thenReturn(Flavor.uat);
      when(
        () =>
            returnSummaryDetailsRequestInformationRemote.getRequestInformation(
          returnRequestId: 'mock_id',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await returnSummaryDetailsRepository.getReturnInformation(
        returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
      );
      expect(result.isLeft(), true);
    });
  });
}
