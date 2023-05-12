import 'dart:convert';

import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order history details shipping info ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString('assets/json/getPOAttachmentResponse.json'),
      );
    });

    test('Test fromDomain', () {
      final adminPoAttachmentDto = List.from(data['data']['getPOAttachment'])
          .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
          .toList();

      expect(adminPoAttachmentDto.length, 5);
    });

    test('Test toJson', () {
      final adminPoAttachment = List.from(data['data']['getPOAttachment'])
          .map((e) => AdminPoAttachmentDto.fromJson(e).toJson())
          .toList();

      expect(adminPoAttachment.length, 5);
    });
  });
}
