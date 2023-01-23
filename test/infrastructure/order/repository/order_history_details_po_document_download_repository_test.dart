import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryDetailsPoDocumentDownloadLocalMock extends Mock
    implements PoDocumentLocalDataSource {}

class OrderHistoryDetailsPoDocumentDownloadRemoteMock extends Mock
    implements PoDocumentRemote {}


void main() {
  late PoAttachmentRepository
      orderHistoryDetailsPoDocumentRepository;
  late Config mockConfig;
  late PoDocumentLocalDataSource
      orderHistoryDetailsPoDocumentDownloadLocal;
  late PoDocumentRemote
      orderHistoryDetailsPoDocumentDownloadRemote;
  final emptyFile = OrderHistoryDetails.empty().orderHistoryDetailsPoDocuments;
  final emptyFileMap = PoDocuments.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    orderHistoryDetailsPoDocumentDownloadLocal =
        OrderHistoryDetailsPoDocumentDownloadLocalMock();
    orderHistoryDetailsPoDocumentDownloadRemote =
        OrderHistoryDetailsPoDocumentDownloadRemoteMock();

    orderHistoryDetailsPoDocumentRepository =
        PoAttachmentRepository(
      config: mockConfig,
      localDataSource: orderHistoryDetailsPoDocumentDownloadLocal,
      remoteDataSource: orderHistoryDetailsPoDocumentDownloadRemote,
    );
  });

  group('orderHistoryDetailsPoDocumentRepository should - ', () {
    test('get orderHistoryDetailsPoDocument successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadLocal.fileDownload('', ''))
          .thenAnswer((invocation) async =>
              PoDocumentsBuffer.empty());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles(emptyFile);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadLocal.fileDownload('', ''))
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles([emptyFileMap]);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument successfully remote', () async {
       when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadRemote.fileDownload('', ''))
          .thenAnswer((invocation) async =>
              PoDocumentsBuffer.empty());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles(emptyFile);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument fail remote', () async {
       when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadRemote.fileDownload('', ''))
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles([emptyFileMap]);
      expect(
        result.isLeft(),
        true,
      );
    });

    
  });
}
