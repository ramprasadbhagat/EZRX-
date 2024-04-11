import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_information_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_dto.dart';

class ReturnSummaryDetailsByRequestRemote {
  final HttpService httpService;
  final RequestInformationQuery requestInformationQuery;
  final DataSourceExceptionHandler dataSourceExceptionHandler;
  final Config config;
  final RemoteConfigService remoteConfigService;

  ReturnSummaryDetailsByRequestRemote({
    required this.httpService,
    required this.requestInformationQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<RequestInformation> getReturnSummaryDetailsByRequest({
    required String returnRequestId,
    required String market,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ereturn',
      data: jsonEncode(
        {
          'query': requestInformationQuery.getReturnInformationQuery(
            remoteConfigService.enableMarketPlaceMarkets.contains(market),
          ),
          'variables': {
            'request': {
              'requestID': returnRequestId,
            },
          },
        },
      ),
    );
    _returnSummaryDetailsRequestInformationChecker(res: res);
    final data = res.data['data']['requestInformationV2'];

    return RequestInformationDto.fromJson(data).toDomain();
  }

  void _returnSummaryDetailsRequestInformationChecker({
    required Response<dynamic> res,
  }) {
    final data = res.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    } else if (data['data'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    } else if (data['data']['requestInformationV2'] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
