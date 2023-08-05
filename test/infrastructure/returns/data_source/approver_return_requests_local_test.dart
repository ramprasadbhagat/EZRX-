import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_requests_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_requests_id_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApproverReturnRequestsLocal localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ApproverReturnRequestsLocal();
    },
  );

  group(
    'Return Approver Local Datasource',
    () {
      test(
        'getReturns',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/returnRequestsForApproverV2Response.json',
            ),
          );

          final result = await localDataSource.getReturns();

          expect(
            result,
            List.from(res['data']['requestsForApproverV2']['requestID'])
                .map(
                  (e) =>
                      ReturnRequestsIdDto.fromJson({'requestId': e}).toDomain(),
                )
                .toList()
              ..retainWhere((element) => element.isValidRequestId),
          );
        },
      );
    },
  );
}
