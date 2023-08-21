import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_attachment_dto.dart';

class ReturnRequestRemoteDataSource {
  HttpService httpService;
  ReturnRequestQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ReturnRequestRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<ReturnMaterialList> searchReturnMaterials({
    required String salesOrg,
    required String shipTo,
    required String soldTo,
    required int pageSize,
    required int offset,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterials();
      final variables = {
        'searchReturnMaterialsRequestV2': {
          'soldTo': soldTo,
          'shipTo': shipTo,
          'salesOrg': salesOrg,
          'first': pageSize,
          'after': offset,
          //TODO: cover dateFrom & dateTo in filter ticket
          'dateFrom': '20230125',
          'dateTo': '20230725',
        },
      };
      variables['searchReturnMaterialsRequestV2']!
          .removeWhere((key, value) => value.toString().isEmpty);

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _exceptionChecker(response: res, property: 'searchReturnMaterialsV2');

      return ReturnMaterialListDto.fromJson(
        res.data['data']['searchReturnMaterialsV2'],
      ).toDomain();
    });
  }

  Future<ReturnRequestAttachment> uploadFile({
    required String folder,
    required PlatformFile file,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.addFileRequest();

      final variables = {
        'folder': folder,
        'req': [
          {
            'id': 10,
            'file': null,
          },
        ],
      };

      final operations = {
        'query': queryData,
        'variables': variables,
      };

      final map = {
        '0': ['variables.req.0.file'],
      };

      final fileFieldKeys = map.keys.toList();
      final fileName = file.path!.split('/').last;
      final data = {
        fileFieldKeys.first: await MultipartFile.fromFile(
          file.path!,
          filename: fileName,
        ),
        'operations': jsonEncode(operations),
        'map': jsonEncode(map),
      };
      final response = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: FormData.fromMap(data),
      );

      _exceptionChecker(response: response, property: 'addRequestFileUpload');

      final uploadedFiles = response.data['data']['addRequestFileUpload'];

      return uploadedFiles.isNotEmpty
          ? ReturnRequestAttachmentDto.fromJson(
              {
                ...uploadedFiles[0],
                'name': fileName,
                'size': file.size,
              },
            ).toDomain()
          : ReturnRequestAttachment.empty();
    });
  }

  Future<bool> deleteFile({
    required String filePath,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.deleteFile();
      final variables = {
        'filePath': filePath,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _exceptionChecker(response: res, property: 'deleteFile');

      return res.data['data']['deleteFile']['isDeleted'] as bool;
    });
  }

  void _exceptionChecker({
    required String property,
    required Response<dynamic> response,
  }) {
    final data = response.data;
    if (data['errors'] != null && data['errors'].isNotEmpty) {
      throw ServerException(message: data['errors'][0]['message']);
    } else if (response.statusCode != 200) {
      throw ServerException(
        code: response.statusCode ?? 0,
        message: response.statusMessage ?? '',
      );
    } else if (data['data'] == null || data['data'][property] == null) {
      throw ServerException(message: 'Some thing went wrong');
    }
  }
}
