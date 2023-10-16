import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_details_by_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_details_by_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_details_by_request_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ConfigMock extends Mock implements Config {}

class ReturnSummaryDetailsByRequestLocalMock extends Mock
    implements ReturnSummaryDetailsByRequestLocal {}

class ReturnSummaryDetailsByRequestRemoteMock extends Mock
    implements ReturnSummaryDetailsByRequestRemote {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReturnDetailsByRequestRepository repository;
  late Config configMock;
  late ReturnSummaryDetailsByRequestLocal
      returnSummaryDetailsByRequestLocalMock;

  late ReturnSummaryDetailsByRequestRemote
      returnSummaryDetailsByRequestRemoteMock;
  late RequestInformation successResult;
  final errorMock = Exception('fake-error');
  const fakeId = 'mock-id';

  setUpAll(
    () async {
      configMock = ConfigMock();
      returnSummaryDetailsByRequestLocalMock =
          ReturnSummaryDetailsByRequestLocalMock();
      returnSummaryDetailsByRequestRemoteMock =
          ReturnSummaryDetailsByRequestRemoteMock();
      repository = ReturnDetailsByRequestRepository(
        config: configMock,
        returnSummaryDetailsByRequestLocal:
            returnSummaryDetailsByRequestLocalMock,
        returnSummaryDetailsByRequestRemote:
            returnSummaryDetailsByRequestRemoteMock,
      );
      successResult = await ReturnSummaryDetailsByRequestLocal()
          .getReturnSummaryDetailsByRequest();
    },
  );

  group(
    'Test Return Details By Request Repository',
    () {
      test(
        'Get Return Summary Details By Request Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnSummaryDetailsByRequestLocalMock
                .getReturnSummaryDetailsByRequest(),
          ).thenAnswer(
            (_) async => successResult,
          );
          final result = await repository.getReturnSummaryDetailsByRequest(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(() => RequestInformation.empty()),
            successResult,
          );
        },
      );

      test(
        'Get Return Summary Details By Request Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnSummaryDetailsByRequestLocalMock
                .getReturnSummaryDetailsByRequest(),
          ).thenThrow(errorMock);
          final result = await repository.getReturnSummaryDetailsByRequest(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Return Summary Details By Request Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnSummaryDetailsByRequestRemoteMock
                .getReturnSummaryDetailsByRequest(returnRequestId: fakeId),
          ).thenAnswer(
            (_) async => successResult,
          );
          final result = await repository.getReturnSummaryDetailsByRequest(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(() => RequestInformation.empty()),
            successResult,
          );
        },
      );

      test(
        'Get Return Summary Details By Request Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnSummaryDetailsByRequestRemoteMock
                .getReturnSummaryDetailsByRequest(returnRequestId: fakeId),
          ).thenThrow(errorMock);
          final result = await repository.getReturnSummaryDetailsByRequest(
            returnRequestId: ReturnRequestsId(requestId: fakeId),
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}
