import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/approver_return_request_information_local.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ApproverReturnRequestInformationLocal localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ApproverReturnRequestInformationLocal();
    },
  );

  group(
    'Return Approver request information Local Datasource',
    () {
      test(
        'getApproverReturnRequestInformation',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/returnRequestInformationV2Response.json',
            ),
          );

          final result =
              await localDataSource.getApproverReturnRequestInformation();

          expect(
            result,
            RequestInformationDto.fromJson(res['data']['requestInformationV2'])
                .toDomain(),
          );
        },
      );
    },
  );
}
