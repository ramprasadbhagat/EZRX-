import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnSummaryLocalDataSource localDataSource;

  setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ReturnSummaryLocalDataSource();
    },
  );

  group('Return Summary Local Datasource Test', () {
      test('=> getReturnSummaryRequestByUser', () async {
          final result = await localDataSource.getReturnSummaryRequestByUser();
          expect(
            result.requestIds.length,
            11,
          );
        },
      );
    },
  );

}
