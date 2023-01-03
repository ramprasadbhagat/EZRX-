import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_po_document_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class OrderTemplateMock extends Mock implements OrderTemplate {}

void main() {
  late OrderHistoryDetailsPoDocumentDownloadLocal localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = OrderHistoryDetailsPoDocumentDownloadLocal();
    },
  );

  group(
    'Order History Details Po Doc',
    () {
      test(
        'Get Order History Details Po Doc',
        () async {
          final res = await rootBundle.load('assets/images/splash.png');

          final result =
              await localDataSource.fileDownload('fake-name', 'fake-url');

          expect(
            result,
            OrderHistoryDetailsPoDocumentsBuffer(
              name: 'fake-name',
              buffer: res.buffer.asUint8List(),
            ),
          );
        },
      );
    },
  );
}
