import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class ReturnRequestRepositoryMock extends Mock
    implements ReturnRequestRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ReturnRequestRepository returnRequestRepository;
  Config().appFlavor = Flavor.mock;
  late ReturnRequestAttachment fakeUploadedFiles;
  const fakeReturnUUID = 'fake-return_uuid';
  const fakeAssignmentNumber = 'fake-assignment_number';
  const fakeUploadOptionType = UploadOptionType.file;
  const fakeApiFailure = ApiFailure.other('fake-error');
  final fakePlatformFile = PlatformFile(
    name: 'fake-file-name',
    size: 10,
  );
  final fakeFile = File('fake-path');
  late List<ReturnRequestAttachment> fakeListFile;

  group(
    'Return Request Attachment',
    () {
      setUp(() async {
        returnRequestRepository = ReturnRequestRepositoryMock();
        fakeUploadedFiles = await ReturnRequestLocalDataSource().uploadFile();
        fakeUploadedFiles = fakeUploadedFiles.copyWith(
          name: fakeUploadedFiles.path,
        );
        fakeListFile = [fakeUploadedFiles];
        WidgetsFlutterBinding.ensureInitialized();
      });

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "initialized" event',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.initialized(),
        ),
        expect: () => [
          ReturnRequestAttachmentState.initial(),
        ],
      );

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "uploadFile" success happy case',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.uploadFile(
            assignmentNumber: fakeAssignmentNumber,
            returnUuid: fakeReturnUUID,
            uploadOptionType: fakeUploadOptionType,
          ),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getPermission(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Right(PermissionStatus.granted),
          );
          when(
            () => returnRequestRepository.pickFiles(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => Right([fakePlatformFile]),
          );
          when(
            () => returnRequestRepository.uploadFiles(
              assignmentNumber: fakeAssignmentNumber,
              files: [fakePlatformFile],
            ),
          ).thenAnswer(
            (invocation) async => Right(fakeListFile),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            returnUuid: fakeReturnUUID,
            failureOrSuccessOption: optionOf(Right(fakeListFile)),
            uploadedFiles: fakeListFile,
          ),
        ],
      );
      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "uploadFile" permission failed',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.uploadFile(
            assignmentNumber: fakeAssignmentNumber,
            returnUuid: fakeReturnUUID,
            uploadOptionType: fakeUploadOptionType,
          ),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getPermission(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeApiFailure),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
        ],
      );
      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "uploadFile" pick file failure',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.uploadFile(
            assignmentNumber: fakeAssignmentNumber,
            returnUuid: fakeReturnUUID,
            uploadOptionType: fakeUploadOptionType,
          ),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getPermission(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Right(PermissionStatus.granted),
          );
          when(
            () => returnRequestRepository.pickFiles(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => Right([fakePlatformFile]),
          );
          when(
            () => returnRequestRepository.uploadFiles(
              assignmentNumber: fakeAssignmentNumber,
              files: [fakePlatformFile],
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeApiFailure),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            returnUuid: fakeReturnUUID,
            failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
          ),
        ],
      );

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "uploadFile" upload failure',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.uploadFile(
            assignmentNumber: fakeAssignmentNumber,
            returnUuid: fakeReturnUUID,
            uploadOptionType: fakeUploadOptionType,
          ),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getPermission(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Right(PermissionStatus.granted),
          );
          when(
            () => returnRequestRepository.pickFiles(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Left(fakeApiFailure),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
        ],
      );

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "uploadFile" pick file success but return empty',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          const ReturnRequestAttachmentEvent.uploadFile(
            assignmentNumber: fakeAssignmentNumber,
            returnUuid: fakeReturnUUID,
            uploadOptionType: fakeUploadOptionType,
          ),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getPermission(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Right(PermissionStatus.granted),
          );
          when(
            () => returnRequestRepository.pickFiles(
              uploadOptionType: fakeUploadOptionType,
            ),
          ).thenAnswer(
            (invocation) async => const Right(<PlatformFile>[]),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            returnUuid: fakeReturnUUID,
            fileOperationMode: FileOperationMode.upload,
          ),
        ],
      );
      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "deleteFile" event',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          ReturnRequestAttachmentEvent.deleteFile(file: fakeUploadedFiles),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.deleteFile(
              filePath: fakeUploadedFiles.path,
            ),
          ).thenAnswer(
            (invocation) async => const Right(true),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.delete,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(true)),
          ),
        ],
      );

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "downloadFile" event success',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          ReturnRequestAttachmentEvent.downloadFile(file: fakeUploadedFiles),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getDownloadPermission(),
          ).thenAnswer(
            (invocation) async => const Right(PermissionStatus.granted),
          );
          when(
            () => returnRequestRepository.downloadFile(file: fakeUploadedFiles),
          ).thenAnswer(
            (invocation) async => Right(fakeFile),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.download,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(Right(fakeFile)),
            fileOperationMode: FileOperationMode.none,
          ),
        ],
      );

      blocTest<ReturnRequestAttachmentBloc, ReturnRequestAttachmentState>(
        'Test "downloadFile" event failure',
        build: () => ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        ),
        act: (bloc) => bloc.add(
          ReturnRequestAttachmentEvent.downloadFile(file: fakeUploadedFiles),
        ),
        setUp: () {
          when(
            () => returnRequestRepository.getDownloadPermission(),
          ).thenAnswer(
            (invocation) async => const Left(fakeApiFailure),
          );
        },
        expect: () => [
          ReturnRequestAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.download,
          ),
          ReturnRequestAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
            fileOperationMode: FileOperationMode.download,
          ),
        ],
      );

      test('Test moreThanOneUploaded', () {
        final bloc = ReturnRequestAttachmentBloc(
          returnRequestRepository: returnRequestRepository,
        );
        bloc.emit(
          ReturnRequestAttachmentState.initial().copyWith(
            uploadedFiles: [
              fakeUploadedFiles,
              fakeUploadedFiles,
            ],
          ),
        );
        expect(bloc.state.moreThanOneUploaded, true);
      });
    },
  );
}
