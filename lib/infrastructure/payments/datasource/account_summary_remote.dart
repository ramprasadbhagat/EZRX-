import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/account_summary_query.dart';

class AccountSummaryRemoteDataSource {
  HttpService httpService;
  AccountSummaryQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  AccountSummaryRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
  });
}
