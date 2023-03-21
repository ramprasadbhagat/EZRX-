import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderHistoryDetailsPoDocumentDownloadLocalMock extends Mock
    implements PoDocumentLocalDataSource {}

class OrderHistoryDetailsPoDocumentDownloadRemoteMock extends Mock
    implements PoDocumentRemote {}

void main() {
  late PoAttachmentRepository orderHistoryDetailsPoDocumentRepository;
  late Config mockConfig;
  late PoDocumentLocalDataSource orderHistoryDetailsPoDocumentDownloadLocal;
  late PoDocumentRemote orderHistoryDetailsPoDocumentDownloadRemote;
  final emptyFile = OrderHistoryDetails.empty().orderHistoryDetailsPoDocuments;
  final emptyFileMap = PoDocuments.empty();
  final user = User.empty().copyWith(username: Username('fake-username'));

  setUpAll(() {
    mockConfig = MockConfig();
    orderHistoryDetailsPoDocumentDownloadLocal =
        OrderHistoryDetailsPoDocumentDownloadLocalMock();
    orderHistoryDetailsPoDocumentDownloadRemote =
        OrderHistoryDetailsPoDocumentDownloadRemoteMock();

    orderHistoryDetailsPoDocumentRepository = PoAttachmentRepository(
      config: mockConfig,
      localDataSource: orderHistoryDetailsPoDocumentDownloadLocal,
      remoteDataSource: orderHistoryDetailsPoDocumentDownloadRemote,
    );
  });

  group('PoAttachmentRepository should Download tests- ', () {
    test('get orderHistoryDetailsPoDocument successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadLocal.fileDownload('', ''))
          .thenAnswer((invocation) async => PoDocumentsBuffer.empty());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles(emptyFile, AttachmentType.downloadPOAttachment);
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
          .downloadFiles([emptyFileMap], AttachmentType.downloadPOAttachment);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadRemote.fileDownload('', '',AttachmentType.downloadPOAttachment))
          .thenAnswer((invocation) async => PoDocumentsBuffer.empty());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles(emptyFile, AttachmentType.downloadPOAttachment);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() =>
              orderHistoryDetailsPoDocumentDownloadRemote.fileDownload('', '', AttachmentType.downloadPOAttachment))
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsPoDocumentRepository
          .downloadFiles([emptyFileMap], AttachmentType.downloadPOAttachment);
      expect(
        result.isLeft(),
        true,
      );
    });
  });

  group('PoAttachmentRepository Upload test- ', () {
    test('get orderHistoryDetailsPoDocument successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsPoDocumentDownloadLocal.fileUpload())
          .thenAnswer((invocation) async => PoDocuments.empty());

      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        files: [],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderHistoryDetailsPoDocument fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderHistoryDetailsPoDocumentDownloadLocal.fileUpload())
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        files: [],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('PoDocument Downlaod fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      when(() => orderHistoryDetailsPoDocumentDownloadRemote.fileUpload(
          countryName: SalesOrg('1500').country,
          currentYear: DateTime.now().year.toString(),
          file: MultipartFile.fromFileSync('assets/images/splash.png',
              filename: 'fake-file'),
          userName: user.username.getOrCrash())).thenThrow((invocation) async {
        return MockException();
      });

      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg('1500'),
        files: [
          PlatformFile(
              name: 'fake-file', size: 1, path: 'assets/images/splash.png')
        ],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('PoDocument Upload fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderHistoryDetailsPoDocumentDownloadRemote.fileUpload(
              countryName: '',
              currentYear: DateTime.now().year.toString(),
              file: MultipartFile.fromFileSync('assets/images/splash.png',
                  filename: 'fake-file'),
              userName: user.username.getOrDefaultValue('')))
          .thenThrow((invocation) async => MockException());

      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        files: [
          PlatformFile(
              name: 'fake-file', size: 1, path: 'assets/images/splash.png')
        ],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('PoDocument Downlaod success remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg('1500'),
        files: [PlatformFile(name: '', path: '', size: 1)],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isRight(),
        false,
      );
    });

    test('PoDocument exceed max upload count', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        files: List.filled(
          11,
          PlatformFile(
              name: 'fake-file', size: 1, path: 'assets/images/splash.png'),
        ),
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('PoDocument Upload big file remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderHistoryDetailsPoDocumentDownloadRemote.fileUpload(
          countryName: SalesOrg('1500').country,
          currentYear: DateTime.now().year.toString(),
          file: MultipartFile.fromFileSync('assets/images/splash.png',
              filename: 'fake-file'),
          userName: user.username.getOrCrash())).thenThrow((invocation) async {
        return MockException();
      });

      final result = await orderHistoryDetailsPoDocumentRepository.uploadFiles(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesOrg: SalesOrg(''),
        files: [
          PlatformFile(
              name: 'fake-file',
              size: ((pow(1024, 2)) * 7).toInt(),
              path: 'assets/images/splash.png')
        ],
        shipToInfo: ShipToInfo.empty(),
        uploadedPODocument: [],
        user: user,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}
