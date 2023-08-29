import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_approver_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

class ReturnApproverRepositoryMock extends Mock
    implements ReturnApproverRepository {}

void main() {
  late ReturnApproverRepository repository;
  late List<ReturnRequestsId> approverReturnRequestsIdList;
  late ReturnApproverFilter returnApproverFilter;
  final fakeToDate = DateTime.now();
  late Config config;
  final fakeFromDate = DateTime.now().subtract(
    const Duration(days: 7),
  );
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ReturnApproverRepositoryMock();
    config = Config()..appFlavor = Flavor.mock;
  });

  setUp(() {
    approverReturnRequestsIdList = [
      ReturnRequestsId(requestId: 'fakeApproverReturnRequestId'),
    ];
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
    'Approver Return Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        act: (ReturnApproverBloc bloc) =>
            bloc.add(const ReturnApproverEvent.initialized()),
        expect: () => [ReturnApproverState.initial()],
      );
    },
  );

  group(
    'Approver Return Bloc Fetch',
    () {
      blocTest(
        'fetch -> returnIds fetch fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.fetch(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            isFetching: true,
          ),
          ReturnApproverState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'fetch -> return details fetch fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(approverReturnRequestsIdList),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: approverReturnRequestsIdList,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.fetch(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            isFetching: true,
          ),
          ReturnApproverState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
      blocTest(
        'fetch -> return details fetch success',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(approverReturnRequestsIdList),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: approverReturnRequestsIdList,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                RequestInformation.empty(),
              ],
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.fetch(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            isFetching: true,
          ),
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: [
              RequestInformation.empty(),
            ],
            failureOrSuccessOption: none(),
            canLoadMore: false,
            nextPageIndex: 1,
          ),
        ],
      );
    },
  );

  group(
    'Approver Return Bloc load more',
    () {
      blocTest(
        'fetch -> returnIds load more fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            config.pageSize,
            RequestInformation.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: config.pageSize,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.loadMore(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize,
              RequestInformation.empty(),
            ),
            isFetching: true,
            nextPageIndex: 1,
          ),
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize,
              RequestInformation.empty(),
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            nextPageIndex: 1,
          ),
        ],
      );

      blocTest(
        'fetch -> return details load more fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            config.pageSize,
            RequestInformation.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: config.pageSize,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                config.pageSize,
                approverReturnRequestsIdList.first,
              ),
            ),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: List.filled(
                config.pageSize,
                approverReturnRequestsIdList.first,
              ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.loadMore(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize,
              RequestInformation.empty(),
            ),
            isFetching: true,
            nextPageIndex: 1,
          ),
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize,
              RequestInformation.empty(),
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            nextPageIndex: 1,
          ),
        ],
      );

      blocTest(
        'fetch -> return details load more success',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
          config: config,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            config.pageSize,
            RequestInformation.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: config.pageSize,
              pageSize: config.pageSize,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                config.pageSize,
                approverReturnRequestsIdList.first,
              ),
            ),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: List.filled(
                config.pageSize,
                approverReturnRequestsIdList.first,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                config.pageSize,
                RequestInformation.empty(),
              ),
            ),
          );
        },
        act: (ReturnApproverBloc bloc) => bloc.add(
          ReturnApproverEvent.loadMore(
            user: User.empty(),
            approverReturnFilter: returnApproverFilter,
          ),
        ),
        expect: () => [
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize,
              RequestInformation.empty(),
            ),
            isFetching: true,
            nextPageIndex: 1,
          ),
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              config.pageSize * 2,
              RequestInformation.empty(),
            ),
            nextPageIndex: 2,
          ),
        ],
      );
    },
  );
}
