import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PoAttachmentRepositoryMock extends Mock
    implements PoAttachmentRepository {}

void main() {
  late PoAttachmentRepository poAttachmentRepository;
  group(
    'PoAttachmentBloc Bloc Test',
    () {
      final poDocumentsList = <PoDocuments>[
        PoDocuments(
          name: 'fake-file-1',
          url: 'fake-url-1',
        )
      ];

      final downLoadedPoDocumentsList = poDocumentsList
          .map(
            (e) => PoDocumentsBuffer.empty().copyWith(
              name: e.name,
            ),
          )
          .toList();

      final user = User.empty().copyWith(
        username: Username('fake-username'),
      );
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadFiles(poDocumentsList))
              .thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        build: () => PoAttachmentBloc(
            downloadAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.downloadFile(
          fetchMode: FileOperationhMode.download,
          files: poDocumentsList,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.download,
            isFetching: true,
            fileUrl: poDocumentsList,
          ),
          PoAttachmentState.initial().copyWith(
              fileOperationhMode: FileOperationhMode.download,
              isFetching: false,
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error')))),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file success',
        setUp: () {
          when(() => poAttachmentRepository.downloadFiles(poDocumentsList))
              .thenAnswer(
            (invocation) async => Right(
              downLoadedPoDocumentsList,
            ),
          );
        },
        build: () => PoAttachmentBloc(
            downloadAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(PoAttachmentEvent.downloadFile(
          fetchMode: FileOperationhMode.download,
          files: poDocumentsList,
        )),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.download,
            isFetching: true,
            fileUrl: poDocumentsList,
          ),
          PoAttachmentState.initial().copyWith(
              fileOperationhMode: FileOperationhMode.download,
              isFetching: false,
              fileData: downLoadedPoDocumentsList,
              failureOrSuccessOption: optionOf(
                Right(
                  downLoadedPoDocumentsList,
                ),
              ))
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file fail',
        setUp: () {
          when(() => poAttachmentRepository.uploadFiles(
                customerCodeInfo: CustomerCodeInfo.empty(),
                files: [],
                salesOrg: SalesOrg(''),
                shipToInfo: ShipToInfo.empty(),
                uploadedPODocument: [],
                user: user,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-error'),
            ),
          );
        },
        build: () => PoAttachmentBloc(
            downloadAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            files: [],
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: user,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.upload,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.upload,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file Success',
        setUp: () {
          when(() => poAttachmentRepository.uploadFiles(
                customerCodeInfo: CustomerCodeInfo.empty(),
                files: [],
                salesOrg: SalesOrg(''),
                shipToInfo: ShipToInfo.empty(),
                uploadedPODocument: [],
                user: user,
              )).thenAnswer(
            (invocation) async => const Right([]),
          );
        },
        build: () => PoAttachmentBloc(
            downloadAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            customerCodeInfo: CustomerCodeInfo.empty(),
            files: [],
            salesOrg: SalesOrg(''),
            shipToInfo: ShipToInfo.empty(),
            uploadedPODocument: [],
            user: user,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.upload,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: FileOperationhMode.upload,
          ),
        ],
      );
    },
  );
}
