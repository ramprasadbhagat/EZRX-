import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
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
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterials();
      final variables = {
        'searchReturnMaterialsRequestV2': requestParams,
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

  Future<ReturnMaterialList> searchReturnMaterialsForSalesRep({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterialsForSalesRep();
      final variables = {
        'searchReturnMaterialsForSalesRepRequest': requestParams,
      };

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );
      _exceptionChecker(
        response: res,
        property: 'searchReturnMaterialsForSalesRepV2',
      );

      return ReturnMaterialListDto.fromJson(
        res.data['data']['searchReturnMaterialsForSalesRepV2'],
      ).toDomain();
    });
  }

  Future<ReturnRequestAttachment> uploadFile({
    required String folder,
    required PlatformFile file,
    required String salesOrg,
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
        url: '${config.urlConstants}upload-ereturn',
        data: FormData.fromMap(data),
        headers: {'salesorg': salesOrg},
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

  Future<String> addRequest({
    required Map<String, dynamic> requestParams,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.addRequest();
      final variables = {
        'returnInput': requestParams,
      };
      variables['returnInput']!
          .removeWhere((key, value) => value.toString().isEmpty);

      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}ereturn',
        data: jsonEncode({
          'query': queryData,
          'variables': variables,
        }),
      );

      _exceptionChecker(response: res, property: 'addRequestV2');

      return res.data['data']['addRequestV2']['requestID'] is String
          ? res.data['data']['addRequestV2']['requestID']
          : '';
    });
  }

  Future<AttachmentFileBuffer> downloadFile(
    ReturnRequestAttachment file,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'GET',
        url:
            '${config.urlConstants}ereturn/downloads?encryptedURL=${file.path}',
        responseType: ResponseType.bytes,
      );
      _fileDownloadExceptionChecker(res: res);

      return AttachmentFileBuffer(
        name: file.name,
        buffer: res.data,
      );
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

  void _fileDownloadExceptionChecker({required Response<dynamic> res}) {
    if (res.data is List && res.data.isEmpty) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
