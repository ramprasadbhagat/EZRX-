import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/requests_by_user_return_summary.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReturnSummaryRepository extends Mock
    implements ReturnSummaryRepository {}

const _pageSize = 20;

void main() {
  late MockReturnSummaryRepository mockReturnSummaryRepository;
  late ReturnSummaryFilter returnSummaryFilter;
  final fakeToDate = DateTime.now();
  late List<ReturnSummaryRequest> requests;

  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 7),
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    requests = [
      ReturnSummaryRequest(
          returnId: 'fakeApproverReturnRequestId',
          items: [],
          refundTotal: 12.0,
          requestStatus: StatusType('PENDING'),
          submitDate: DateTimeStringValue('20230327')),
    ];
    mockReturnSummaryRepository = MockReturnSummaryRepository();
    returnSummaryFilter = ReturnSummaryFilter.empty().copyWith(
      dateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      dateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      sortBy: StatusType('Active'),
      requestId: SearchKey.searchFilter('mock_id'),
      refundTotalTo: RangeValue('100'),
      refundTotalFrom: RangeValue('1000'),
    );
  });

  group(
    'Return Summary Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => ReturnSummaryBloc(
            returnSummaryRepository: mockReturnSummaryRepository),
        act: (ReturnSummaryBloc bloc) =>
            bloc.add(const ReturnSummaryEvent.initialized()),
        expect: () => [ReturnSummaryState.initial()],
      );

      blocTest(
        'Fetch success',
        build: () => ReturnSummaryBloc(
            returnSummaryRepository: mockReturnSummaryRepository),
        setUp: () {
          when(() => mockReturnSummaryRepository.getReturnSummaryRequestByUser(
                soldTo: CustomerCodeInfo.empty(),
                shipTo: ShipToInfo.empty(),
                user:
                    User.empty().copyWith(username: Username('mock-username')),
                pageSize: _pageSize,
                offset: 0,
                returnSummaryFilter: returnSummaryFilter,
              )).thenAnswer(
            (invocation) async => Right(ReturnSummaryRequestByUser(
                requestIds: [requests.first.returnId], requests: requests)),
          );
        },
        act: (ReturnSummaryBloc bloc) => bloc.add(ReturnSummaryEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: User.empty().copyWith(username: Username('mock-username')),
          returnSummaryFilter: returnSummaryFilter,
        )),
        expect: () => [
          ReturnSummaryState.initial().copyWith(
            isLoading: true,
          ),
          ReturnSummaryState.initial().copyWith(
            isLoading: false,
            returnSummaryList: requests,
          ),
        ],
      );

      blocTest(
        'Fetch failure',
        build: () => ReturnSummaryBloc(
            returnSummaryRepository: mockReturnSummaryRepository),
        setUp: () {
          when(() => mockReturnSummaryRepository.getReturnSummaryRequestByUser(
                soldTo: CustomerCodeInfo.empty(),
                shipTo: ShipToInfo.empty(),
                user:
                    User.empty().copyWith(username: Username('mock-username')),
                pageSize: _pageSize,
                offset: 0,
                returnSummaryFilter: returnSummaryFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (ReturnSummaryBloc bloc) => bloc.add(ReturnSummaryEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: User.empty().copyWith(username: Username('mock-username')),
          returnSummaryFilter: returnSummaryFilter,
        )),
        expect: () => [
          ReturnSummaryState.initial().copyWith(
            isLoading: true,
          ),
          ReturnSummaryState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'Load More success',
        build: () => ReturnSummaryBloc(
            returnSummaryRepository: mockReturnSummaryRepository),
        setUp: () {
          when(() => mockReturnSummaryRepository.getReturnSummaryRequestByUser(
                soldTo: CustomerCodeInfo.empty(),
                shipTo: ShipToInfo.empty(),
                user:
                    User.empty().copyWith(username: Username('mock-username')),
                pageSize: _pageSize,
                offset: 0,
                returnSummaryFilter: returnSummaryFilter,
              )).thenAnswer(
            (invocation) async => Right(ReturnSummaryRequestByUser(
                requestIds: [requests.first.returnId], requests: requests)),
          );
        },
        act: (ReturnSummaryBloc bloc) => bloc.add(ReturnSummaryEvent.loadMore(
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: User.empty().copyWith(username: Username('mock-username')),
          returnSummaryFilter: returnSummaryFilter,
        )),
        expect: () => [
          ReturnSummaryState.initial().copyWith(
            isLoading: true,
          ),
          ReturnSummaryState.initial().copyWith(
            isLoading: false,
            canLoadMore: false,
            returnSummaryList: requests,
          ),
        ],
      );

      blocTest(
        'LoadMore failure',
        build: () => ReturnSummaryBloc(
            returnSummaryRepository: mockReturnSummaryRepository),
        setUp: () {
          when(() => mockReturnSummaryRepository.getReturnSummaryRequestByUser(
                soldTo: CustomerCodeInfo.empty(),
                shipTo: ShipToInfo.empty(),
                user:
                    User.empty().copyWith(username: Username('mock-username')),
                pageSize: _pageSize,
                offset: 0,
                returnSummaryFilter: returnSummaryFilter,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (ReturnSummaryBloc bloc) => bloc.add(ReturnSummaryEvent.loadMore(
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          user: User.empty().copyWith(username: Username('mock-username')),
          returnSummaryFilter: returnSummaryFilter,
        )),
        expect: () => [
          ReturnSummaryState.initial().copyWith(
            isLoading: true,
          ),
          ReturnSummaryState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );
    },
  );
}
