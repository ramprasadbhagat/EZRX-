import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnSummaryLocalDataSourceMock extends Mock
    implements ReturnSummaryLocalDataSource {}

class ReturnSummaryRemoteDataSourceMock extends Mock
    implements ReturnSummaryRemoteDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late ReturnSummaryLocalDataSource returnSummaryLocalDataSourceMock;
  late ReturnSummaryRemoteDataSource returnSummaryRemoteDataSourceMock;
  late Config configMock;
  late ReturnSummaryRepository returnSummaryRepository;
  late ReturnSummaryRequestByUser mockReturnSummary;
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

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockReturnSummary = ReturnSummaryRequestByUser.empty();
    configMock = ConfigMock();
    returnSummaryLocalDataSourceMock = ReturnSummaryLocalDataSourceMock();
    returnSummaryRemoteDataSourceMock = ReturnSummaryRemoteDataSourceMock();
    returnSummaryRepository = ReturnSummaryRepository(
      config: configMock,
      returnSummaryLocalDataSource: returnSummaryLocalDataSourceMock,
      returnSummaryRemoteDataSource: returnSummaryRemoteDataSourceMock,
    );
  });

  group('Return Summary Repository Test', () {
    test('=> getReturnSummaryRequestByUser locally success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() =>
              returnSummaryLocalDataSourceMock.getReturnSummaryRequestByUser())
          .thenAnswer(
        (invocation) async => mockReturnSummary,
      );

      final result =
          await returnSummaryRepository.getReturnSummaryRequestByUser(
        soldTo: CustomerCodeInfo.empty(),
        shipTo: ShipToInfo.empty(),
        user: User.empty(),
        pageSize: 1,
        offset: 0,
        returnSummaryFilter: ReturnSummaryFilter.empty(),
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnSummaryRequestByUser locally failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() =>
              returnSummaryLocalDataSourceMock.getReturnSummaryRequestByUser())
          .thenThrow((invocation) async => MockException());

      final result =
          await returnSummaryRepository.getReturnSummaryRequestByUser(
        soldTo: CustomerCodeInfo.empty(),
        shipTo: ShipToInfo.empty(),
        user: User.empty().copyWith(username: Username('mock-username')),
        pageSize: 1,
        offset: 0,
        returnSummaryFilter: ReturnSummaryFilter.empty(),
      );
      expect(result.isLeft(), true);
    });

    test('=> getReturnSummaryRequestByUser remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() =>
          returnSummaryRemoteDataSourceMock.getReturnSummaryRequestByUser(
            soldTo: '',
            shipTo: '',
            pageSize: 1,
            offset: 0,
            username: 'mock_username',
            filterQuery: ReturnSummaryFilterDto.fromDomain(
                ReturnSummaryFilter.empty().copyWith(
              dateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dateTo: DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              sortBy: ReturnSummaryStatus('Active'),
              requestId: SearchKey.searchFilter('mock_id'),
              refundTotalTo: DoubleValue('100'),
              refundTotalFrom: DoubleValue('1000'),
            )).toJson(),
          )).thenAnswer((invocation) async => mockReturnSummary);

      final result =
          await returnSummaryRepository.getReturnSummaryRequestByUser(
        soldTo: CustomerCodeInfo.empty(),
        shipTo: ShipToInfo.empty(),
        user: User.empty().copyWith(username: Username('mock_username')),
        pageSize: 1,
        offset: 0,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          dateFrom: DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
          dateTo: DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
          sortBy: ReturnSummaryStatus('Active'),
          requestId: SearchKey.searchFilter('mock_id'),
          refundTotalTo: DoubleValue('100'),
          refundTotalFrom: DoubleValue('1000'),
        ),
      );
      expect(result.isRight(), true);
    });

    test('=> getReturnSummaryRequestByUser remote failure', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() =>
          returnSummaryRemoteDataSourceMock.getReturnSummaryRequestByUser(
            soldTo: '',
            shipTo: '',
            pageSize: 1,
            offset: 0,
            username: 'mock_username',
            filterQuery: ReturnSummaryFilterDto.fromDomain(
                ReturnSummaryFilter.empty().copyWith(
              dateFrom:
                  DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
              dateTo: DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
              sortBy: ReturnSummaryStatus('Active'),
              requestId: SearchKey.searchFilter('mock_id'),
              refundTotalTo: DoubleValue('100'),
              refundTotalFrom: DoubleValue('1000'),
            )).toJson(),
          )).thenThrow((invocation) async => MockException());

      final result =
          await returnSummaryRepository.getReturnSummaryRequestByUser(
        soldTo: CustomerCodeInfo.empty(),
        shipTo: ShipToInfo.empty(),
        user: User.empty().copyWith(username: Username('mock_username')),
        pageSize: 1,
        offset: 0,
        returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
          dateFrom: DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
          dateTo: DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
          sortBy: ReturnSummaryStatus('Active'),
          requestId: SearchKey.searchFilter('mock_id'),
          refundTotalTo: DoubleValue('100'),
          refundTotalFrom: DoubleValue('1000'),
        ),
      );
      expect(result.isLeft(), true);
    });
  });
}
