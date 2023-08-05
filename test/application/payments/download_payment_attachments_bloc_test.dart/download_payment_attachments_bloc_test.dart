import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

class DownloadPaymentAttachmentRepositoryMock extends Mock
    implements DownloadPaymentAttachmentRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;

  final salesOrganization =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-salesOrg'));

  final customerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customerCode');

  final file = File('fake-url');
  group('Download Payment Attachment', () {
    setUp(() async {
      downloadPaymentAttachmentRepository =
          DownloadPaymentAttachmentRepositoryMock();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          customerCodeInfo: customerCodeInfo,
          queryObject: AllInvoicesFilter.empty(),
          salesOrganization: salesOrganization,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          queryObject: AllInvoicesFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          queryObject: AllCreditsFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          queryObject: AllCreditsFilter.empty(),
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download permission failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isDownloadInProgress: false,
        )
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download file failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isDownloadInProgress: false,
        )
      ],
    );
  });
}
