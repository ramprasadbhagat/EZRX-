import 'dart:io';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter/foundation.dart';

class AnnouncementAttachmentDownloadRemoteDataSource {
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final HttpService httpService;

  AnnouncementAttachmentDownloadRemoteDataSource({
    required this.dataSourceExceptionHandler,
    required this.httpService,
  });

  Future<AttachmentFileBuffer> fileDownload(
    String imgUrl,
    String name,
  ) async {
    final httpClient = HttpClient();

    return await dataSourceExceptionHandler.handle(() async {
      final request = await httpClient.getUrl(Uri.parse(imgUrl));
      final response = await request.close();
      _fileDownloadExceptionChecker(response: response);
      final buffer = await consolidateHttpClientResponseBytes(response);

      return AttachmentFileBuffer(
        name: name,
        buffer: buffer,
      );
    });
  }
}

void _fileDownloadExceptionChecker({required HttpClientResponse response}) {
  if (response.statusCode != 200) {
    throw const ApiFailure.attachmentDownloadError();
  }
}
