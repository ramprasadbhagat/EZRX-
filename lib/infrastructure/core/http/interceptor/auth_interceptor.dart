import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/auth_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/login_dto.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:flutter/foundation.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final PackageInfoService packageInfoService;
  final OktaLoginServices oktaLoginServices;
  final Config config;
  final AuthQueryMutation authQueryMutation;
  final PushNotificationService pushNotificationService;
  final CountlyService countlyService;
  AuthInterceptor({
    required this.tokenStorage,
    required this.packageInfoService,
    required this.oktaLoginServices,
    required this.config,
    required this.authQueryMutation,
    required this.pushNotificationService,
    required this.countlyService,
  });
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await tokenStorage.get();
      if (token.access.isNotEmpty) {
        final isTokenExpired = token.toDomain().isExpired;
        final isNotMockflavor = config.appFlavor != Flavor.mock;
        if (isTokenExpired && isNotMockflavor) await _refreshToken();
        options.headers['Authorization'] = 'Bearer V2 ${token.access}';
      }
      options.headers['package'] = await packageInfoService.getPackageName();
      options.headers['version'] = await packageInfoService.getVersion();
      options.headers['build'] = await packageInfoService.getBuildNumber();
    } on CacheException catch (e) {
      debugPrint('load token failure: ${e.message}');
    }
    options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    options.headers['Accept-Language'] = tr('en');

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    debugPrint('onResponse ${response.statusCode} ${response.data}');

    try {
      if (response.data['errors'] != null &&
          response.data['errors'][0]['message'] == 'authentication failed') {
        final newJwt = await _refreshToken();
        if (newJwt != null) {
          final newResponse = await _retry(response.requestOptions);
          await _callCountly(
            newResponse, 
            response.requestOptions.headers['apiEndpoint'],
          );

          return handler.next(newResponse);
        }
      }

      return super.onResponse(response, handler);
    } catch (e) {
      return super.onResponse(response, handler);
    }
  }

  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    // debugPrint('onError ${error.response?.statusCode} ${error.response?.data}');
    final apiEndpoint = err.requestOptions.headers['apiEndpoint'].toString();
    if (apiEndpoint.isNotEmpty) {
      if (err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.receiveTimeout ||
          err.type == DioErrorType.sendTimeout) {
        await countlyService
            .addCountlyEvent('API Timeout', segmentation: {'API': apiEndpoint});
      } else {
        await countlyService.addCountlyEvent('API Failure', segmentation: {
          'API': apiEndpoint,
          'message': err.message,
        });
      }
    }
    
    return super.onError(err, handler);
  }

  Future<JWTDto?> _refreshToken() async {
    try {
      // Get okta access token
      final result = await oktaLoginServices.getAccessToken();
      final jwt = JWT(result?['message']);

      // Exchange for eZRxJWT with okta access token
      final dio = Dio(
        BaseOptions(
          baseUrl: config.baseUrl,
          method: 'POST',
        ),
      );
      final response = await dio.request(
        '${config.urlConstants}loginV3',
        data: jsonEncode(
          {
            'query': authQueryMutation.getLoginQuery(),
            'variables': {
              'input': {
                'isOktaAuthenticated': true,
                'accessToken': jwt.getOrCrash(),
                'mobileToken': {
                  'mobileTokens': [
                    {
                      'token': await pushNotificationService.getFCMToken(),
                      'provider': 'firebase',
                    },
                  ],
                },
              },
            },
          },
        ),
      );
      await _callCountly(response, 'loginV3');
      final login =
          LoginDto.fromJson(response.data['data']['loginV3']).toDomain();
      final newJwt = JWTDto.fromDomain(login.jwt);
      await tokenStorage.set(newJwt);

      return newJwt;
    } catch (e) {
      debugPrint('Refresh token failed : $e');

      return null;
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: config.baseUrl,
        sendTimeout: config.httpSendTimeout,
        connectTimeout: config.httpConnectTimeout,
        receiveTimeout: config.httpReceiveTimeout,
      ),
    );

    final token = await tokenStorage.get();
    if (token.access.isNotEmpty) {
      requestOptions.headers['Authorization'] = 'Bearer V2 ${token.access}1';
    }

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }

  Future<void> _callCountly(Response response, String endPoint) async {
    if (endPoint.isNotEmpty && response.data['errors'] != null) {
      await countlyService.addCountlyEvent('API Failure', segmentation: {
        'API': endPoint,
        'message': response.data['errors'][0]['message'],
      });
    }
  }
}
