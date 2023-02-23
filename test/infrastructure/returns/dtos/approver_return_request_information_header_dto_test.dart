import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/approver_return_request_information_header.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/approver_return_request_information_header_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Approver return request information header dto ', () {
    setUp(() async {
      data = json.decode(await rootBundle.loadString(
          'assets/json/returnRequestInformationV2Response.json'));
    });
    test('=> Approver return request information header', () {
      final approverReturnRequestInformationHeader =
          ApproverReturnRequestInformationHeaderDto.fromJson(data).toDomain();
      expect(approverReturnRequestInformationHeader,
          isA<ApproverReturnRequestInformationHeader>());
    });

    test('=> Approver return request information header ReturnInvoicesDto', () {
      final approverReturnRequestInformationHeader =
          ReturnInvoicesDto.fromJson({}).toDomain();
      expect(approverReturnRequestInformationHeader, isA<ReturnInvoices>());
    });

    test('=> Approver return request information header RetrunSalesDocDto', () {
      final approverReturnRequestInformationHeader =
          RetrunSalesDocDto.fromJson({}).toDomain();
      expect(approverReturnRequestInformationHeader, isA<ReturnSalesDoc>());
    });

    test('=> Approver return request information header ReturnCreditNotesDto',
        () {
      final approverReturnRequestInformationHeader =
          ReturnCreditNotesDto.fromJson({}).toDomain();
      expect(approverReturnRequestInformationHeader, isA<ReturnCreditNotes>());
    });
    test('=> Approver return request information header ReturnMaterialDto', () {
      final approverReturnRequestInformationHeader =
          ReturnMaterialDto.fromJson({}).toDomain();
      expect(approverReturnRequestInformationHeader, isA<ReturnMaterial>());
    });
  });
}
