import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/update_language_response_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class LanguageRemoteDataSource {
  final LanguageMutation languageMutation;
  final HttpService httpService;
  final Config config;
  LanguageRemoteDataSource({
    required this.languageMutation,
    required this.httpService,
    required this.config,
  });

  Future<UpdateLanguageResponse> changeLanguage(String language) async {
    final queryData = languageMutation.changeLanguage();

    final variables = {
      'input': {
        'Language': language,
        'Holiday': {
          'monday': false,
          'tuesday': false,
          'wednesday': false,
          'thursday': false,
          'friday': false,
          'saturday': false,
          'sunday': true,
        },
      },
    };

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode({
        'query': queryData,
        'variables': variables,
      }),
      apiEndpoint: 'updateLanguageAndHoliday',
    );
    _exceptionChecker(res: res);

    final finalData = res.data['data']['updateLanguageAndHoliday'];

    return UpdateLanguageResponseDto.fromJson(finalData).toDomain;
  }

  void _exceptionChecker({required Response<dynamic> res}) {
    if (res.data['errors'] != null && res.data['errors'].isNotEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
