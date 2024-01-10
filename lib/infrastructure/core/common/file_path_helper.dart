import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class FileSystemHelper {
  Future<File> getDownloadedFile(
    AttachmentFileBuffer file,
  ) async {
    final downloadFile = File(
      '${await _getDownloadedFilePath()}/${file.name.split('.').first}_${DateTime.now().millisecondsSinceEpoch}.${file.name.split('.').last}',
    );
    await downloadFile.writeAsBytes(file.buffer);

    return downloadFile;
  }

  Future<String> _getDownloadedFilePath() async {
    if (defaultTargetPlatform == TargetPlatform.android) {

      ///Android/data/ this path is restricted from sdk 31
      ///reference: https://developer.android.com/training/data-storage/manage-all-files#:~:text=Write%20access%20to%20all%20internal,data/%20on%20a%20storage%20volume.
      ///so we are not able to create Android/data/com.zuelligpharma.ezrxplus.uat/files/downloads

      return 'storage/emulated/0/Download';
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
