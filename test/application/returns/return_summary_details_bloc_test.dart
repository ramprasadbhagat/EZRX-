import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class MockReturnSummaryDetailsRepository extends Mock
    implements ReturnSummaryDetailsRepository {}

class MockReturnRequestRepository extends Mock
    implements ReturnRequestRepository {}

class FakeFile extends Fake implements File {}

void main() {
  late MockReturnSummaryDetailsRepository mockReturnSummaryDetailsRepository;
  late ReturnRequestRepository mockReturnRequestRepository;
  final fakeFile = FakeFile();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockReturnSummaryDetailsRepository = MockReturnSummaryDetailsRepository();
    mockReturnRequestRepository = MockReturnRequestRepository();
  });

  group('Return Summary Details Test -', () {
    blocTest(
      'Initialize',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
      ),
      act: (ReturnSummaryDetailsBloc bloc) =>
          bloc.add(const ReturnSummaryDetailsEvent.initialized()),
      expect: () => [ReturnSummaryDetailsState.initial()],
    );

    blocTest(
      'Fetch success',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
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
        returnRequestRepository: mockReturnRequestRepository,
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

    group('Download -', () {
      final attachment1 =
          ReturnRequestAttachment.empty().copyWith(path: 'fake-url-1');
      final attachment2 =
          ReturnRequestAttachment.empty().copyWith(path: 'fake-url-2');

      blocTest(
        'Get permission failed',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
        ),
        setUp: () {
          when(
            () => mockReturnRequestRepository.getDownloadPermission(),
          ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
        },
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment1],
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'Download failed',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
        ),
        setUp: () {
          when(
            () => mockReturnRequestRepository.getDownloadPermission(),
          ).thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(
            () => mockReturnRequestRepository.downloadFile(file: attachment1),
          ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
        },
        seed: () => ReturnSummaryDetailsState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment2,
          downloadFailureOrSuccessOption: optionOf(const Right('')),
        ),
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2, attachment1],
            downloadedAttachment: ReturnRequestAttachment.empty(),
            downloadFailureOrSuccessOption: none(),
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'Download success',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
        ),
        setUp: () {
          when(
            () => mockReturnRequestRepository.getDownloadPermission(),
          ).thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(
            () => mockReturnRequestRepository.downloadFile(file: attachment1),
          ).thenAnswer((_) async => Right(fakeFile));
        },
        seed: () => ReturnSummaryDetailsState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment2,
          downloadFailureOrSuccessOption: optionOf(const Right('')),
        ),
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2, attachment1],
            downloadedAttachment: ReturnRequestAttachment.empty(),
            downloadFailureOrSuccessOption: none(),
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption: optionOf(Right(fakeFile)),
          ),
        ],
      );
    });
  });
}
