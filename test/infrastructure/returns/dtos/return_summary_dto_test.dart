import 'dart:convert';
import 'package:ezrxmobile/infrastructure/returns/dtos/requests_by_user_return_summary_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> Return Summary dto ', () {
    setUp(() async {
      data = json.decode(await rootBundle.loadString('assets/json/requestsByUserV2Response.json'),);
    });


    test('=> Return request fromDomain', () {
      final returnSummaryDto = ReturnSummaryRequestByUserDto.fromDomain(
        ReturnSummaryRequestByUserDto.fromJson(
          data['data']['requestsByUserV2'],
        ).toDomain(),
      );
      expect(returnSummaryDto.requestIds.length, 11);
    });
    test('=> Return Summary fromDomain', () {
      final returnSummaryDto = ReturnSummaryRequestDto.fromDomain(
        ReturnSummaryRequestDto.fromJson(
          data['data']['requestsByUserV2']['requests'][0],
        ).toDomain(),
      );
      expect(returnSummaryDto.returnId,'EZRE-260122000367');
    });

    test('=> Return Summary toJson', () {
      final returnSummaryMap = ReturnSummaryRequestDto.fromDomain(
        ReturnSummaryRequestDto.fromJson(
          data['data']['requestsByUserV2']['requests'][0],
        ).toDomain(),
      ).toJson();
      expect(returnSummaryMap['returnId'], 'EZRE-260122000367');
    });

  });
}
