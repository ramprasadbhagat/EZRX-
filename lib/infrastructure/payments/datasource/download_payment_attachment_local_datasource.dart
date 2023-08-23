import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';

class DownloadPaymentAttachmentLocalDataSource {
  DownloadPaymentAttachmentLocalDataSource();

  Future<DownloadPaymentAttachment> getFileDownloadUrl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentAttachment.json',
      ),
    );

    return DownloadPaymentAttachmentDto.fromJson(
      data['data']['customerDocumentHeaderExcel'],
    ).toDomain();
  }

  Future<DownloadPaymentAttachment> getPaymentSummaryFileDownloadUrl() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/paymentSummaryAttachment.json',
      ),
    );

    return DownloadPaymentAttachmentDto.fromJson(
      data['data']['customerPaymentExcel'],
    ).toDomain();
  }

  Future<AttachmentFileBuffer> fileDownload() async {
    final data = await rootBundle.load('assets/images/splash.png');

    return AttachmentFileBuffer(
      name: 'paymentAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<AttachmentFileBuffer> soaDownload() async {
    final data = await rootBundle.load('assets/images/splash.png');

    return AttachmentFileBuffer(
      name: 'paymentAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }
}
