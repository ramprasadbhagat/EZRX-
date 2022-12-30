import 'package:dio/dio.dart';
import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/tncdate_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AcceptanceDateRemoteDataSource {
  final HttpService httpService;
  final DataSourceExceptionHandler exceptionHandler;

  AcceptanceDateRemoteDataSource({
    required this.httpService,
    required this.exceptionHandler,
  });

  Future<TncDate> getAcceptanceDate() async {
    return await exceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'GET',
        url: '/api/tncdate',
        data: {},
      );
      _tncExceptionChecker(res: res);
      if (res.data['date'].isEmpty) {
        throw OtherException(message: '');
      }

      return TncDateDto.fromJson(res.data).toDomain();
    });
  }

  void _tncExceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['date'] == null) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
