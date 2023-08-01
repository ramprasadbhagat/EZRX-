import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_approver_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ApproverReturnRequestsLocalMock extends Mock
    implements ApproverReturnRequestsLocal {}

class ApproverReturnRequestsRemoteMock extends Mock
    implements ApproverReturnRequestsRemote {}

class ApproverReturnRequestInformationLocalMock extends Mock
    implements ApproverReturnRequestInformationLocal {}

class ApproverReturnRequestInformationRemoteMock extends Mock
    implements ApproverReturnRequestInformationRemote {}

void main() {
  late ReturnApproverRepository returnApproverRepository;
  late Config mockConfig;
  late ApproverReturnRequestsLocal approverReturnRequestsLocalMock;
  late ApproverReturnRequestsRemote approverReturnRequestsRemoteMock;
  late ApproverReturnRequestInformationLocal
      approverReturnRequestInformationLocalMock;

  late ApproverReturnRequestInformationRemote
      approverReturnRequestInformationRemoteMock;

  late ReturnApproverFilter returnApproverFilter;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    approverReturnRequestsLocalMock = ApproverReturnRequestsLocalMock();
    approverReturnRequestsRemoteMock = ApproverReturnRequestsRemoteMock();
    approverReturnRequestInformationLocalMock =
        ApproverReturnRequestInformationLocalMock();
    approverReturnRequestInformationRemoteMock =
        ApproverReturnRequestInformationRemoteMock();

    returnApproverRepository = ReturnApproverRepository(
      config: mockConfig,
      returnRequestInformationLocalDataSource:
          approverReturnRequestInformationLocalMock,
      returnRequestInformationRemoteDataSource:
          approverReturnRequestInformationRemoteMock,
      returnRequestLocalDataSource: approverReturnRequestsLocalMock,
      returnRequestRemoteDataSource: approverReturnRequestsRemoteMock,
    );
    returnApproverFilter = ReturnApproverFilter.empty().copyWith(
      toInvoiceDate: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      fromInvoiceDate: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
    );
  });

  group(
    'Request return Approver => getReturnRequests',
    () {
      test(
        'Local success getReturnRequests',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => approverReturnRequestsLocalMock.getReturns()).thenAnswer(
            (invocation) async =>
                [ReturnRequestsId(requestId: 'fake-requestId')],
          );

          final result = await returnApproverRepository.getReturnRequests(
            approverReturnFilter: ReturnApproverFilter.empty(),
            offset: 0,
            pageSize: 11,
            user: User.empty().copyWith(
              username: Username('Fake-username'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'Local fail getReturnRequests',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => approverReturnRequestsLocalMock.getReturns())
              .thenThrow(const ApiFailure.serverTimeout());

          final result = await returnApproverRepository.getReturnRequests(
            approverReturnFilter: ReturnApproverFilter.empty(),
            offset: 0,
            pageSize: 11,
            user: User.empty().copyWith(
              username: Username('Fake-username'),
            ),
          );
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Remote Success getReturnRequests',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
          when(() => approverReturnRequestsRemoteMock.getReturns(filterQuery: {
                    'status': 'PENDING',
                    'dateTo':
                        DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                            .apiDateTimeFormat,
                    'dateFrom': DateTimeStringValue(
                            getDateStringByDateTime(fakeFromDate))
                        .apiDateTimeFormat,
                  }, offset: 0, pageSize: 11, username: 'fake-username'))
              .thenAnswer(
            (invocation) async => [
              ReturnRequestsId(requestId: 'fake-requestId'),
            ],
          );

          final result = await returnApproverRepository.getReturnRequests(
            approverReturnFilter: returnApproverFilter,
            offset: 0,
            pageSize: 11,
            user: User.empty().copyWith(
              username: Username('fake-username'),
            ),
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'Remote fail getReturnRequests',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
          when(() => approverReturnRequestsRemoteMock.getReturns(filterQuery: {
                    'status': 'PENDING',
                    'dateTo':
                        DateTimeStringValue(getDateStringByDateTime(fakeToDate))
                            .apiDateTimeFormat,
                    'dateFrom': DateTimeStringValue(
                            getDateStringByDateTime(fakeFromDate))
                        .apiDateTimeFormat,
                  }, offset: 0, pageSize: 11, username: 'Fake-username'))
              .thenThrow(const ApiFailure.serverTimeout());

          final result = await returnApproverRepository.getReturnRequests(
            approverReturnFilter: ReturnApproverFilter.empty(),
            offset: 0,
            pageSize: 11,
            user: User.empty().copyWith(
              username: Username('Fake-username'),
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
    'Request return Approver => getReturnInformation',
    () {
      test(
        'Local success getReturnInformation',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => approverReturnRequestInformationLocalMock
              .getApproverReturnRequestInformation()).thenAnswer(
            (invocation) async => RequestInformation.empty(),
          );

          final result = await returnApproverRepository
              .getReturnInformation(returnRequestIds: [
            ReturnRequestsId(requestId: 'fake-requestId'),
          ]);
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'Local fail getReturnInformation',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => approverReturnRequestInformationLocalMock
                  .getApproverReturnRequestInformation())
              .thenThrow(const ApiFailure.serverTimeout());

          final result = await returnApproverRepository
              .getReturnInformation(returnRequestIds: [
            ReturnRequestsId(requestId: 'fake-requestId'),
          ]);
          expect(
            result.isLeft(),
            true,
          );
        },
      );

      test(
        'Remote success getReturnInformation',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
          when(() => approverReturnRequestInformationRemoteMock
              .getApproverReturnRequestInformation(
                  returnRequestId: 'fake-requestId')).thenAnswer(
            (invocation) async => RequestInformation.empty(),
          );

          final result = await returnApproverRepository
              .getReturnInformation(returnRequestIds: [
            ReturnRequestsId(requestId: 'fake-requestId'),
          ]);
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test(
        'Remote fail getReturnInformation',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
          when(() => approverReturnRequestInformationRemoteMock
                  .getApproverReturnRequestInformation(
                      returnRequestId: 'fake-requestId'))
              .thenThrow(const ApiFailure.serverTimeout());

          final result = await returnApproverRepository
              .getReturnInformation(returnRequestIds: [
            ReturnRequestsId(requestId: 'fake-requestId'),
          ]);
          expect(
            result.isLeft(),
            true,
          );
        },
      );
    },
  );
}
