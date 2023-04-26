import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

class PoAttachmentRepositoryMock extends Mock
    implements PoAttachmentRepository {}

class MockFile extends Mock implements File {}

void main() {
  late PoAttachmentRepository poAttachmentRepository;
  final poDocumentsList = <PoDocuments>[
        PoDocuments(
          name: 'fake-file-1',
          url: 'fake-url-1',
        )
      ];


  group(
    'PoAttachmentBloc Bloc Download Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download Permission fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.downloadFile(
            files: poDocumentsList,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.download,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(() => poAttachmentRepository.downloadFiles(
              poDocumentsList, AttachmentType.downloadPOAttachment)).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.downloadFile(
          files: poDocumentsList,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
              fileOperationMode: FileOperationMode.download,
              isFetching: false,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error')))),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file success',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(() => poAttachmentRepository.downloadFiles(
              poDocumentsList, AttachmentType.downloadPOAttachment)).thenAnswer(
            (invocation) async => const Right(
              [],
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.downloadFile(
          files: poDocumentsList,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
              fileOperationMode: FileOperationMode.download,
            isFetching: false,
          ),
        ],
      );
    },
  );

  group(
    'PoAttachmentBloc Bloc Open File Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open Permission fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.openFile(
            files: poDocumentsList.first,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.view,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open file fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(() => poAttachmentRepository.openFile(
                files: poDocumentsList.first,
                attachmentType: AttachmentType.downloadPOAttachment,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.openFile(
          files: poDocumentsList.first,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
              fileOperationMode: FileOperationMode.view,
              isFetching: false,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error')))),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open file success',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(() => poAttachmentRepository.openFile(
                files: poDocumentsList.first,
                attachmentType: AttachmentType.downloadPOAttachment,
              )).thenAnswer(
            (invocation) async => Right(
              OpenResult(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.openFile(
          files: poDocumentsList.first,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            isFetching: false,
          ),
        ],
      );

    },
  );

  

  group(
    'PoAttachmentBloc Bloc Upload Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload Permission fail',
        setUp: () {
          when(() => poAttachmentRepository.getPermission(
                uploadOptionType: UploadOptionType.file,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: User.empty(),
            uploadOptionType: UploadOptionType.file,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload Invalid format choose',
        setUp: () {
          when(() => poAttachmentRepository.pickFiles(
                uploadOptionType: UploadOptionType.file,
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.invalidFileFormat(),
            ),
          );
          when(() => poAttachmentRepository.getPermission(
                uploadOptionType: UploadOptionType.file,
              )).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: User.empty(),
            uploadOptionType: UploadOptionType.file,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.invalidFileFormat(),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload no file selected',
        setUp: () {
          when(() => poAttachmentRepository.pickFiles(
                uploadOptionType: UploadOptionType.file,
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(() => poAttachmentRepository.getPermission(
                uploadOptionType: UploadOptionType.file,
              )).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: User.empty(),
            uploadOptionType: UploadOptionType.file,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file upload fail',
        setUp: () {
          when(() => poAttachmentRepository.uploadFiles(
                customerCodeInfo: CustomerCodeInfo.empty(),
                files: [
                  PlatformFile(
                    name: 'fake-file',
                    size: 0,
                  ),
                ],
                salesOrg: SalesOrg(''),
                shipToInfo: ShipToInfo.empty(),
                uploadedPODocument: [],
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-error'),
            ),
          );
          when(() => poAttachmentRepository.pickFiles(
                uploadOptionType: UploadOptionType.file,
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => Right(
              [
                PlatformFile(
                  name: 'fake-file',
                  size: 0,
                ),
              ],
            ),
          );
          when(() => poAttachmentRepository.getPermission(
                uploadOptionType: UploadOptionType.file,
              )).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: User.empty(),
            uploadOptionType: UploadOptionType.file,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(name: 'fake-file'),
            ],
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file upload success',
        setUp: () {
          when(() => poAttachmentRepository.uploadFiles(
                customerCodeInfo: CustomerCodeInfo.empty(),
                files: [
                  PlatformFile(
                    name: 'fake-file',
                    size: 0,
                  ),
                ],
                salesOrg: SalesOrg(''),
                shipToInfo: ShipToInfo.empty(),
                uploadedPODocument: [],
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => Right(
              [
                PoDocuments.empty().copyWith(
                  name: 'fake-file',
                  url: 'fake-url',
                ),
              ],
            ),
          );
          when(() => poAttachmentRepository.pickFiles(
                uploadOptionType: UploadOptionType.file,
                customerCodeInfo: CustomerCodeInfo.empty(),
                shipToInfo: ShipToInfo.empty(),
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => Right(
              [
                PlatformFile(
                  name: 'fake-file',
                  size: 0,
                ),
              ],
            ),
          );
          when(() => poAttachmentRepository.getPermission(
                uploadOptionType: UploadOptionType.file,
              )).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: User.empty(),
            uploadOptionType: UploadOptionType.file,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
          ),
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(name: 'fake-file'),
            ],
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [
              PoDocuments.empty().copyWith(
                name: 'fake-file',
                url: 'fake-url',
              ),
            ],
          ),
        ],
      );
    },
  );
}
