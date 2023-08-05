import 'dart:io';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';

class FileSystemHelper {
  Future<File> getDownloadedFile(PoDocumentsBuffer file) async {
    final downloadFile = File(
      '${await _getDownloadedFilePath()}/${file.name}',
    );
    await downloadFile.writeAsBytes(file.buffer);

    return downloadFile;
  }

  Future<String> _getDownloadedFilePath() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final directory = await getExternalStorageDirectory();

      return '${directory?.path.split('Android').first}Download';
    } else {
      final directory = await getApplicationDocumentsDirectory();

      return await directory.exists()
          ? directory.path
          : (await directory.create(recursive: true)).path;
    }
  }

  Future<OpenResult> openFile(PoDocumentsBuffer file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final openFile = File('${appStorage.path}/${file.name}');
    await openFile.writeAsBytes(file.buffer);

    return await OpenFile.open(openFile.path);
  }
}
