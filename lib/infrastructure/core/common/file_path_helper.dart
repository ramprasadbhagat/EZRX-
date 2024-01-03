import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class FileSystemHelper {
  Future<File> getDownloadedFile(
    AttachmentFileBuffer file,
    bool isAndroidSdk33,
  ) async {
    final downloadFile = File(
      '${await _getDownloadedFilePath(isAndroidSdk33)}/${file.name}',
    );
    await downloadFile.writeAsBytes(file.buffer);

    return downloadFile;
  }

  Future<String> _getDownloadedFilePath(bool isAndroidSdk33) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final directory = isAndroidSdk33
          ? await getDownloadsDirectory()
          : await getExternalStorageDirectory();

      return isAndroidSdk33
          ? '${directory?.path}'
          : '${directory?.path.split('Android').first}Download';
    } else {
      final directory = await getApplicationDocumentsDirectory();

      return await directory.exists()
          ? directory.path
          : (await directory.create(recursive: true)).path;
    }
  }

  Future<OpenResult> openFile(AttachmentFileBuffer file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final openFile = File('${appStorage.path}/${file.name}');
    await openFile.writeAsBytes(file.buffer);

    return await OpenFile.open(openFile.path);
  }

  MultipartFile toMultipartFile({
    required String name,
    required String path,
  }) =>
      MultipartFile.fromFileSync(
        path,
        filename: name,
      );
}
