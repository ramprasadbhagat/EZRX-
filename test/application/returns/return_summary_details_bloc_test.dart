import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReturnSummaryDetailsRepository extends Mock
    implements ReturnSummaryDetailsRepository {}

void main() {
  late MockReturnSummaryDetailsRepository mockReturnSummaryDetailsRepository;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockReturnSummaryDetailsRepository = MockReturnSummaryDetailsRepository();
  });

  group('Return Summary Details Test', () {
    blocTest(
      'Initialize',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
      ),
      act: (ReturnSummaryDetailsBloc bloc) =>
          bloc.add(const ReturnSummaryDetailsEvent.initialized()),
      expect: () => [ReturnSummaryDetailsState.initial()],
    );

    blocTest(
      'Fetch success',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
      ),
      setUp: () {
        when(
          () => mockReturnSummaryDetailsRepository.getReturnInformation(
            returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
          ),
        ).thenAnswer(
          (invocation) async => Right(RequestInformation.empty()),
        );
      },
      act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
        ReturnSummaryDetailsEvent.fetch(
          returnId: ReturnRequestsId(requestId: 'mock_id'),
        ),
      ),
      expect: () => [
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: false,
          requestInformation: ReturnRequestInformation.empty(),
          requestInformationHeader: ReturnRequestInformationHeader.empty(),
        ),
      ],
    );

    blocTest(
      'Fetch failure',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
      ),
      setUp: () {
        when(
          () => mockReturnSummaryDetailsRepository.getReturnInformation(
            returnRequestId: ReturnRequestsId(requestId: 'mock_id'),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock-error'),
          ),
        );
      },
      act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
        ReturnSummaryDetailsEvent.fetch(
          returnId: ReturnRequestsId(requestId: 'mock_id'),
        ),
      ),
      expect: () => [
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );
  });
}
