import 'dart:convert';

import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_dto.dart';
import 'package:flutter/services.dart';

class AdminPoAttachmentLocalDataSource {
  AdminPoAttachmentLocalDataSource();

  Future<List<AdminPoAttachment>> getAdminPoAttachment() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/getPOAttachmentResponse.json'),
    );

    final finalData = data['data']['getPOAttachment'];

    return List.from(finalData)
        .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
        .toList();
  }
}
