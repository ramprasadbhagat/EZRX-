import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_details_by_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ReturnDetailsByRequestRepositoryMock extends Mock
    implements ReturnDetailsByRequestRepository {}

void main() {
  late ReturnDetailsByRequestRepository returnDetailsByRequestRepository;
  late ReturnRequestsId fakeReturnRequestsId;
  late RequestInformation fakeRequestInformation;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnDetailsByRequestRepository = ReturnDetailsByRequestRepositoryMock();
  });
  setUp(() {
    fakeReturnRequestsId = ReturnRequestsId(requestId: '12345');
    fakeRequestInformation = RequestInformation.empty().copyWith(
      requestInformationHeader: ReturnRequestInformationHeader.empty(),
      returnRequestInformationList: <ReturnRequestInformation>[],
    );
  });

  group(
    'Return Details By Request Bloc Initialize',
    () {
      blocTest(
        'Initialize',
        build: () => ReturnDetailsByRequestBloc(
          returnDetailsByRequestRepository: returnDetailsByRequestRepository,
        ),
        act: (ReturnDetailsByRequestBloc bloc) =>
            bloc.add(const ReturnDetailsByRequestEvent.initialized()),
        expect: () => [ReturnDetailsByRequestState.initial()],
      );
    },
  );

  group('Return Details By Request Bloc Fetch', () {
    blocTest(
      'fetch -> Return Details By Request Bloc fail',
      build: () => ReturnDetailsByRequestBloc(
        returnDetailsByRequestRepository: returnDetailsByRequestRepository,
      ),
      setUp: () {
        when(
          () =>
              returnDetailsByRequestRepository.getReturnSummaryDetailsByRequest(
            returnRequestId: fakeReturnRequestsId,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (ReturnDetailsByRequestBloc bloc) => bloc.add(
        ReturnDetailsByRequestEvent.fetch(
          returnId: fakeReturnRequestsId.requestId,
        ),
      ),
      expect: () => [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'fetch -> Return Details By Request Bloc Success',
      build: () => ReturnDetailsByRequestBloc(
        returnDetailsByRequestRepository: returnDetailsByRequestRepository,
      ),
      setUp: () {
        when(
          () =>
              returnDetailsByRequestRepository.getReturnSummaryDetailsByRequest(
            returnRequestId: fakeReturnRequestsId,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakeRequestInformation,
          ),
        );
      },
      act: (ReturnDetailsByRequestBloc bloc) => bloc.add(
        ReturnDetailsByRequestEvent.fetch(
          returnId: fakeReturnRequestsId.requestId,
        ),
      ),
      expect: () => [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation:
              fakeRequestInformation.returnRequestInformationList,
          requestInformationHeader:
              fakeRequestInformation.requestInformationHeader,
        ),
      ],
    );
  });
}
