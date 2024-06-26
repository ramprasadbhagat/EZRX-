import 'dart:convert';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
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
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final finalData = res.data['data']['getPOAttachment'];

      return List.from(finalData)
          .map((e) => AdminPoAttachmentDto.fromJson(e).toDomain())
          .toList();
    });
  }
}
