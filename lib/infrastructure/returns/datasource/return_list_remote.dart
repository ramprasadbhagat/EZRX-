import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:flutter/foundation.dart';

class ReturnListRemoteDataSource {
  HttpService httpService;
  ReturnQuery queryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnListRemoteDataSource({
    required this.httpService,
    required this.queryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ReturnItem>> fetchReturnByItems({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByItems();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'request': requestParams,
            },
          },
        ),
        apiEndpoint: 'requestsByItems',
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByItems']['returnRequestsByItems'],
      )
          .map(
            (returnRequestsByItem) => List<Map<String, dynamic>>.from(
              returnRequestsByItem['requestByItems'],
            )
                .map(
                  (requestByItem) =>
                      ReturnItemDto.fromJson(requestByItem).toDomain(),
                )
                .toList(),
          )
          .toList()
          .expand((element) => element)
          .toList();
    });
  }

  Future<List<ReturnItem>> fetchReturnByRequest({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = queryMutation.getRequestsByRequest();

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode(
          {
            'query': queryData,
            'variables': {
              'requestsByUserRequest': requestParams,
            },
          },
        ),
        apiEndpoint: 'requestsByUserV3',
      );
      _returnRequestTypeCodeExceptionChecker(res: res);

      return List<Map<String, dynamic>>.from(
        res.data['data']['requestsByUserV3']['returnRequests'],
      ).map((e) => ReturnItemDto.fromJson(e).toDomain()).toList();
    });
  }

  Future<String> getFileUrl({
    required String soldTo,
    required String shipTo,
    required String username,
    required String salesOrg,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}ereturn',
          data: jsonEncode(
            {
              'query': queryMutation.getRequestsByItemsExcel(),
              'variables': {
                'input': {
                  'soldTo': soldTo,
                  'shipTo': shipTo,
                  'username': username,
                },
              },
            },
          ),
          salesOrg: salesOrg,
        );
        _returnRequestTypeCodeExceptionChecker(res: res);

        return res.data['data']['requestsByItemsExcel']['url'];
      },
    );
  }

  Future<AttachmentFileBuffer> downloadFile({required String url}) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final fileResponse = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ),
        );

        return AttachmentFileBuffer(
          name: Uri.parse(url).pathSegments.last,
          buffer: Uint8List.fromList(fileResponse.data),
        );
      },
    );
  }

  void _returnRequestTypeCodeExceptionChecker({
    required Response<dynamic> res,
  }) {
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
