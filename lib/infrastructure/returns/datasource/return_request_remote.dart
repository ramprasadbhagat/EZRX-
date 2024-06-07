import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_query.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_attachment_dto.dart';

class ReturnRequestRemoteDataSource {
  HttpService httpService;
  ReturnRequestQuery query;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  final RemoteConfigService remoteConfigService;

  ReturnRequestRemoteDataSource({
    required this.httpService,
    required this.query,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<ReturnMaterialList> searchReturnMaterials({
    required Map<String, dynamic> requestParams,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterials(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );
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
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final queryData = query.searchReturnMaterialsForSalesRep(
        remoteConfigService.enableMarketPlaceMarkets.contains(market),
      );
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
    required MultipartFile file,
    required String userName,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final response = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}po-upload',
        data: FormData.fromMap({
          'files': file,
          'userName': userName,
        }),
      );

      _fileUploadExceptionChecker(
        res: response,
      );

      return ReturnRequestAttachmentDto.fromJson(response.data)
          .toDomain()
          .copyWith(size: FileSize(file.length));
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

  void _fileUploadExceptionChecker({required Response<dynamic> res}) {
    if (dataSourceExceptionHandler.isServerResponseError(res: res)) {
      throw ServerException(message: res.data['errors'][0]['message']);
    } else if (res.statusCode != 200) {
      throw ServerException(
        code: res.statusCode ?? 0,
        message: res.statusMessage ?? '',
      );
    }
  }
}
