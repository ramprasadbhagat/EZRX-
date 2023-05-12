import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_local.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AdminPoAttachmentLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AdminPoAttachmentLocalDataSource();
    },
  );

  group(
    'AdminPoAttachmentLocalDataSource',
    () {
      test(
        'Get Admin Po Attachment',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getPOAttachmentResponse.json'),
          );

          final result = await localDataSource.getAdminPoAttachment();

          final finalData = res['data']['getPOAttachment'];

          expect(
            result,
            List.from(finalData)
                .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
                .toList(),
          );
        },
      );
    },
  );
}
