import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_approver_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnApproverRepositoryMock extends Mock
    implements ReturnApproverRepository {}

void main() {
  late ReturnApproverRepository repository;
  late List<ApproverReturnRequestsId> approverReturnRequestsIdList;
  late ReturnApproverFilter returnApproverFilter;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFormDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
  );
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = ReturnApproverRepositoryMock();
  });

  setUp(() {
    approverReturnRequestsIdList = [
      ApproverReturnRequestsId(requestId: 'fakeApproverReturnRequestId'),
    ];
    returnApproverFilter = ReturnApproverFilter.empty().copyWith(
      toInvoiceDate: InvoiceDate(
        fakeToDate.toIso8601String(),
      ),
      fromInvoiceDate: InvoiceDate(
        fakeFormDate.toIso8601String(),
      ),
    );
  });

  group(
    'Approver Return Bloc Initialize',
    () {
      blocTest('Initialize',
          build: () => ReturnApproverBloc(returnApproverRepository: repository),
          act: (ReturnApproverBloc bloc) =>
              bloc.add(const ReturnApproverEvent.initialized()),
          expect: () => [ReturnApproverState.initial()]);
    },
  );

  group(
    'Approver Return Bloc Fetch',
    () {
      blocTest(
        'fetch -> returnIds fetch fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: 11,
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
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: 11,
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
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 0,
              pageSize: 11,
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
                ApproverReturnRequest.empty(),
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
              ApproverReturnRequest.empty(),
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
    'Approver Return Bloc loadmore',
    () {
      blocTest(
        'fetch -> returnIds loadmore fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            11,
            ApproverReturnRequest.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 11,
              pageSize: 11,
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
                11,
                ApproverReturnRequest.empty(),
              ),
              isFetching: true,
              nextPageIndex: 1),
          ReturnApproverState.initial().copyWith(
              approverReturnRequestList: List.filled(
                11,
                ApproverReturnRequest.empty(),
              ),
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
              nextPageIndex: 1),
        ],
      );

      blocTest(
        'fetch -> return details loadmore fail',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            11,
            ApproverReturnRequest.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 11,
              pageSize: 11,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                11,
                approverReturnRequestsIdList.first,
              ),
            ),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: List.filled(
                11,
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
                11,
                ApproverReturnRequest.empty(),
              ),
              isFetching: true,
              nextPageIndex: 1),
          ReturnApproverState.initial().copyWith(
            approverReturnRequestList: List.filled(
              11,
              ApproverReturnRequest.empty(),
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
        'fetch -> return details loadmore success',
        build: () => ReturnApproverBloc(
          returnApproverRepository: repository,
        ),
        seed: () => ReturnApproverState.initial().copyWith(
          isFetching: false,
          approverReturnRequestList: List.filled(
            11,
            ApproverReturnRequest.empty(),
          ),
          nextPageIndex: 1,
        ),
        setUp: () {
          when(
            () => repository.getReturnRequests(
              user: User.empty(),
              approverReturnFilter: returnApproverFilter,
              offset: 11,
              pageSize: 11,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                11,
                approverReturnRequestsIdList.first,
              ),
            ),
          );
          when(
            () => repository.getReturnInformation(
              returnRequestIds: List.filled(
                11,
                approverReturnRequestsIdList.first,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              List.filled(
                11,
                ApproverReturnRequest.empty(),
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
              11,
              ApproverReturnRequest.empty(),
            ),
            isFetching: true,
            nextPageIndex: 1,
          ),
          ReturnApproverState.initial().copyWith(
              approverReturnRequestList: List.filled(
                22,
                ApproverReturnRequest.empty(),
              ),
              nextPageIndex: 2),
        ],
      );
    },
  );
}
