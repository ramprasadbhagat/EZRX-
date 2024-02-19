import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_details_by_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class ReturnDetailsByRequestRepositoryMock extends Mock
    implements ReturnDetailsByRequestRepository {}

class MockReturnRequestRepository extends Mock
    implements ReturnRequestRepository {}

class FakeFile extends Fake implements File {}

void main() {
  late ReturnDetailsByRequestRepository returnDetailsByRequestRepository;
  late ReturnRequestRepository mockReturnRequestRepository;
  late ReturnRequestsId fakeReturnRequestsId;
  late RequestInformation fakeRequestInformation;
  late FakeFile fakeFile;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnDetailsByRequestRepository = ReturnDetailsByRequestRepositoryMock();
    mockReturnRequestRepository = MockReturnRequestRepository();
    fakeFile = FakeFile();
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
          returnRequestRepository: mockReturnRequestRepository,
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
        returnRequestRepository: mockReturnRequestRepository,
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
        returnRequestRepository: mockReturnRequestRepository,
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

  group('Download -', () {
    final attachment1 =
        ReturnRequestAttachment.empty().copyWith(path: 'fake-url-1');
    final attachment2 =
        ReturnRequestAttachment.empty().copyWith(path: 'fake-url-2');

    blocTest(
      'Get permission failed',
      build: () => ReturnDetailsByRequestBloc(
        returnDetailsByRequestRepository: returnDetailsByRequestRepository,
        returnRequestRepository: mockReturnRequestRepository,
      ),
      setUp: () {
        when(
          () => mockReturnRequestRepository.getDownloadPermission(),
        ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
      },
      act: (ReturnDetailsByRequestBloc bloc) => bloc.add(
        ReturnDetailsByRequestEvent.downloadFile(file: attachment1),
      ),
      expect: () => [
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [attachment1],
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [],
          downloadedAttachment: attachment1,
          downloadFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest(
      'Download failed',
      build: () => ReturnDetailsByRequestBloc(
        returnDetailsByRequestRepository: returnDetailsByRequestRepository,
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
      seed: () => ReturnDetailsByRequestState.initial().copyWith(
        downloadingAttachments: [attachment2],
        downloadedAttachment: attachment2,
        downloadFailureOrSuccessOption: optionOf(const Right('')),
      ),
      act: (ReturnDetailsByRequestBloc bloc) => bloc.add(
        ReturnDetailsByRequestEvent.downloadFile(file: attachment1),
      ),
      expect: () => [
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [attachment2, attachment1],
          downloadedAttachment: ReturnRequestAttachment.empty(),
          downloadFailureOrSuccessOption: none(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment1,
          downloadFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest(
      'Download success',
      build: () => ReturnDetailsByRequestBloc(
        returnDetailsByRequestRepository: returnDetailsByRequestRepository,
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
      seed: () => ReturnDetailsByRequestState.initial().copyWith(
        downloadingAttachments: [attachment2],
        downloadedAttachment: attachment2,
        downloadFailureOrSuccessOption: optionOf(const Right('')),
      ),
      act: (ReturnDetailsByRequestBloc bloc) => bloc.add(
        ReturnDetailsByRequestEvent.downloadFile(file: attachment1),
      ),
      expect: () => [
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [attachment2, attachment1],
          downloadedAttachment: ReturnRequestAttachment.empty(),
          downloadFailureOrSuccessOption: none(),
        ),
        ReturnDetailsByRequestState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment1,
          downloadFailureOrSuccessOption: optionOf(Right(fakeFile)),
        ),
      ],
    );
  });
}
