import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOrderHistoryDetailsPoDocumentRepository extends Mock
    implements PoAttachmentRepository {}

void main() {
  group('OrderHistoryDetailsBloc should - ', () {
    late PoAttachmentBloc downloadAttachmentBloc;
    late PoAttachmentRepository downloadAttachmentRepository;
    final emptyFile =
        OrderHistoryDetails.empty().orderHistoryDetailsPoDocuments;
    final emptyFileMap = PoDocuments.empty();
    final emptyResponseData = [PoDocumentsBuffer.empty()];
    const emptyFetchMode = FileOperationMode.none;
    const apiServerTimeOut = ApiFailure.serverTimeout();
    PoAttachmentBloc getDownloadAttachmentBloc() {
      return PoAttachmentBloc(
        poAttachmentRepository: downloadAttachmentRepository,
      );
    }

    setUpAll(() {
      downloadAttachmentRepository =
          MockOrderHistoryDetailsPoDocumentRepository();
      downloadAttachmentBloc = getDownloadAttachmentBloc();
    });
    test('have initial state as DownloadAttachmentState.initial()', () {
      expect(
        downloadAttachmentBloc.state,
        PoAttachmentState.initial(),
      );
    });
    blocTest<PoAttachmentBloc, PoAttachmentState>(
      'emit correct data on initialized() event',
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        const PoAttachmentEvent.initialized(),
      ),
      expect: () => [
        PoAttachmentState.initial(),
      ],
    );
    blocTest<PoAttachmentBloc, PoAttachmentState>(
      'emit correct data on successful downloadFile() event',
      setUp: () {
        when(
          () => downloadAttachmentRepository.downloadFiles(emptyFile,AttachmentType.downloadPOAttachment),
        ).thenAnswer((invocation) async => Right(emptyResponseData));
      },
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        PoAttachmentEvent.downloadFile(
            files: emptyFile, fetchMode: emptyFetchMode),
      ),
      expect: () => [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
          fileOperationMode: emptyFetchMode,
        ),
        PoAttachmentState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(emptyResponseData)),
          fileData: emptyResponseData,
          
        ),
      ],
    );
    blocTest<PoAttachmentBloc, PoAttachmentState>(
      'emit correct data on unsuccessful downloadFile() event',
      setUp: () {
        when(
          () => downloadAttachmentRepository.downloadFiles([emptyFileMap],AttachmentType.downloadPOAttachment),
        ).thenAnswer((invocation) async => const Left(apiServerTimeOut));
      },
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        PoAttachmentEvent.downloadFile(
            files: [emptyFileMap], fetchMode: emptyFetchMode),
      ),
      expect: () => [
        PoAttachmentState.initial().copyWith(
          isFetching: true,
          fileUrl: [PoDocuments.empty()],
          fileOperationMode: emptyFetchMode,
        ),
        PoAttachmentState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(apiServerTimeOut)),
        ),
      ],
    );
  });
}
