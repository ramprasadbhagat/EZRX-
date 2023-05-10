import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/admin_po_attachment_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/admin_po_attachment_dto.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class AdminPoAttachmentRemoteDataSource {
  final Config config;
  final HttpService httpService;
  final AdminPoAttachmentQueryMutation adminPoAttachmentQueryMutation;
  final DataSourceExceptionHandler dataSourceExceptionHandler;

  AdminPoAttachmentRemoteDataSource({
    required this.config,
    required this.httpService,
    required this.adminPoAttachmentQueryMutation,
    required this.dataSourceExceptionHandler,
  });
  
  Future<List<AdminPoAttachment>> getAdminPoAttachment({
    required int pageSize,
    required int offset,
    required Map<String, dynamic> filterQuery,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = adminPoAttachmentQueryMutation.adminPoAttachmentQuery();

      final variables = {
        'first': pageSize,
        'after': offset,
        ...filterQuery,
      };
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}order',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
        apiEndpoint: 'getPOAttachmentQuery',
      );
      _getPoAttachmentExceptionChecker(res: res);
      final finalData = res.data['data']['getPOAttachment'];
      
      return List.from(finalData)
          .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
          .toList();
    });
  }

  void _getPoAttachmentExceptionChecker({
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
