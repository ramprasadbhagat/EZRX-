import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_history_details/download_attachment/bloc/download_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_po_document_download_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOrderHistoryDetailsPoDocumentRepository extends Mock
    implements OrderHistoryDetailsPoDocumentRepository {}

void main() {
  group('OrderHistoryDetailsBloc should - ', () {
    late DownloadAttachmentBloc downloadAttachmentBloc;
    late OrderHistoryDetailsPoDocumentRepository downloadAttachmentRepository;
    final emptyFile = OrderHistoryDetails.empty().getAllPoAsMap;
    final emptyFileMap = OrderHistoryDetailsPODocuments.empty().getNameUrlAsMap;
    final emptyResponseData = [OrderHistoryDetailsPoDocumentsBuffer.empty()];
    const emptyFetchMode = FileFetchMode.none;
    const apiServerTimeOut = ApiFailure.serverTimeout();
    DownloadAttachmentBloc getDownloadAttachmentBloc() {
      return DownloadAttachmentBloc(
        downloadAttachmentRepository: downloadAttachmentRepository,
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
        DownloadAttachmentState.initial(),
      );
    });
    blocTest<DownloadAttachmentBloc, DownloadAttachmentState>(
      'emit correct data on initialized() event',
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        const DownloadAttachmentEvent.initialized(),
      ),
      expect: () => [
        DownloadAttachmentState.initial(),
      ],
    );
    blocTest<DownloadAttachmentBloc, DownloadAttachmentState>(
      'emit correct data on successful downloadFile() event',
      setUp: () {
        when(
          () => downloadAttachmentRepository.downloadFiles(emptyFile),
        ).thenAnswer((invocation) async => Right(emptyResponseData));
      },
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        DownloadAttachmentEvent.downloadFile(
            files: emptyFile, fetchMode: emptyFetchMode),
      ),
      expect: () => [
        DownloadAttachmentState.initial().copyWith(
          fileFetchMode: emptyFetchMode,
        ),
        DownloadAttachmentState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(emptyResponseData)),
          fileData: emptyResponseData,
        ),
      ],
    );
    blocTest<DownloadAttachmentBloc, DownloadAttachmentState>(
      'emit correct data on unsuccessful downloadFile() event',
      setUp: () {
        when(
          () => downloadAttachmentRepository.downloadFiles(emptyFileMap),
        ).thenAnswer((invocation) async => const Left(apiServerTimeOut));
      },
      build: () => getDownloadAttachmentBloc(),
      act: (bloc) => bloc.add(
        DownloadAttachmentEvent.downloadFile(
            files: emptyFileMap, fetchMode: emptyFetchMode),
      ),
      expect: () => [
        DownloadAttachmentState.initial().copyWith(
          fileFetchMode: emptyFetchMode,
        ),
        DownloadAttachmentState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(apiServerTimeOut)),
        ),
      ],
    );
  });
}
