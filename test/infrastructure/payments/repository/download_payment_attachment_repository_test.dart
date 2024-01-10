import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_invoices_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/full_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../order/repository/po_attachment_repository_test.dart';

class MockConfig extends Mock implements Config {}

class DownloadPaymentAttachmentLocalDataSourceMock extends Mock
    implements DownloadPaymentAttachmentLocalDataSource {}

class DownloadPaymentAttachmentRemoteDataSourceMock extends Mock
    implements DownloadPaymentAttachmentRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

void main() {
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late Config mockConfig;
  late DownloadPaymentAttachmentLocalDataSource localDataSource;
  late DownloadPaymentAttachmentRemoteDataSource remoteDataSource;
  late DeviceInfo deviceInfo;
  late PermissionService permissionService;
  late FileSystemHelper fileSystemHelper;
  late DownloadPaymentAttachment downloadPaymentAttachment;
  late AttachmentFileBuffer attachmentFileBuffer;
  final filterListForInvoice =
      AllInvoicesFilterDto.fromDomain(AllInvoicesFilter.empty()).toMapList;
  final filterListForCredits =
      AllCreditsFilterDto.fromDomain(AllCreditsFilter.empty()).toMapList;
  final filterListForFullSummary =
      FullSummaryFilterDto.fromDomain(FullSummaryFilter.empty()).toMapList;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockConfig = Config()..appFlavor = Flavor.mock;
      localDataSource = DownloadPaymentAttachmentLocalDataSourceMock();
      remoteDataSource = DownloadPaymentAttachmentRemoteDataSourceMock();
      deviceInfo = DeviceInfoMock();
      permissionService = PermissionServiceMock();
      fileSystemHelper = FileSystemHelperMock();
      downloadPaymentAttachmentRepository = DownloadPaymentAttachmentRepository(
        config: mockConfig,
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        deviceInfo: deviceInfo,
        fileSystemHelper: fileSystemHelper,
        permissionService: permissionService,
      );
      downloadPaymentAttachment =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      attachmentFileBuffer =
          await DownloadPaymentAttachmentLocalDataSource().fileDownload();
    },
  );

  group('DownloadPaymentAttachmentRepository tests', () {
    group('fetch AllInvoice Url tests', () {
      test('fetch AllInvoice Url successfully local', () async {
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.empty(),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch AllInvoice Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl())
            .thenThrow((invocation) async => MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.empty(),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('fetch AllInvoice Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Debit',
            queryObject: filterListForInvoice,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.empty(),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch AllInvoice Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Debit',
            queryObject: filterListForInvoice,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.empty(),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('fetch AllCredit Url tests', () {
      test('fetch AllCredit Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllCreditsFilter.empty(),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch AllCredit Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl())
            .thenThrow((invocation) async => MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllCreditsFilter.empty(),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('fetch AllCredit Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Credit',
            queryObject: filterListForCredits,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllCreditsFilter.empty(),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch AllCredit Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Credit',
            queryObject: filterListForCredits,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenThrow((invocation) async => MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllCreditsFilter.empty(),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('fetch FullSummary Url tests', () {
      test('fetch FullSummary Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: FullSummaryFilter.empty(),
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch FullSummary Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl())
            .thenThrow(MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: FullSummaryFilter.empty(),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(MockException())),
        );
      });

      test('fetch FullSummary Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'AccountSummary',
            queryObject: filterListForFullSummary,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: FullSummaryFilter.empty(),
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch FullSummary Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'AccountSummary',
            queryObject: filterListForFullSummary,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenThrow(MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: FullSummaryFilter.empty(),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(MockException())),
        );
      });
    });
    group('fetch Payment Summary Url tests', () {
      test('fetch Payment Summary Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getPaymentSummaryFileDownloadUrl())
            .thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch Payment Summary Url failure local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getPaymentSummaryFileDownloadUrl())
            .thenThrow(
          (invocation) async => MockException(),
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('fetch Payment Summary Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('fetch Payment Summary Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          ),
        ).thenThrow(
          (invocation) async => MockException(),
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('Download Permission tests', () {
      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is true',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => true,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result.isRight(),
          true,
        );
      });

      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is granted',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => false,
        );
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.granted,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result.isRight(),
          true,
        );
      });

      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is limited',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => false,
        );
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.limited,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result.isRight(),
          true,
        );
      });

      test(
          'Download Permission failed when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is other than granted & limited',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => false,
        );
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.denied,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('Download Files tests', () {
      test('Download Files successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.fileDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenAnswer(
          (_) async => FileMock(),
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Download Files failure local', () async {
        when(() => localDataSource.fileDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenThrow(
          (_) async => MockException(),
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Download Files successfully remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.fileDownload(downloadPaymentAttachment.url))
            .thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenAnswer(
          (_) async => FileMock(),
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Download Files failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.fileDownload('')).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenThrow(
          (_) async => MockException(),
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });

    group('Soa Download tests', () {
      test('Soa Download successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.soaDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenAnswer(
          (_) async => FileMock(),
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData(''),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Soa Download failure local', () async {
        when(() => localDataSource.soaDownload()).thenThrow(
          (_) async => MockException(),
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenThrow(
          (_) async => MockException(),
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData(''),
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('Soa Download successfully remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.soaDownload('fake_Data')).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenAnswer(
          (_) async => FileMock(),
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData('fake_Data'),
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('Soa Download failure remote', () async {
        when(() => remoteDataSource.soaDownload('')).thenThrow(
          (_) async => MockException(),
        );
        when(
          () => fileSystemHelper.getDownloadedFile(attachmentFileBuffer,),
        ).thenThrow(
          (_) async => MockException(),
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData(''),
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    });
  });
}
