import 'dart:convert';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_material_list_dto.dart';
import 'package:flutter/services.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_request_attachment_dto.dart';

class ReturnRequestLocalDataSource {
  ReturnRequestLocalDataSource();

  Future<ReturnMaterialList> searchReturnMaterials() async {
    final data = json.decode(
      await rootBundle
          .loadString('assets/json/searchReturnMaterialsV2Response.json'),
    );

    return ReturnMaterialListDto.fromJson(
      data['data']['searchReturnMaterialsV2'],
    ).toDomain();
  }

  Future<ReturnMaterialList> searchReturnMaterialsForSalesRep() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/searchReturnMaterialSalesRepV2Response.json',
      ),
    );

    return ReturnMaterialListDto.fromJson(
      data['data']['searchReturnMaterialsForSalesRepV2'],
    ).toDomain();
  }

  Future<ReturnRequestAttachment> uploadFile() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/addFileRequestResponse.json'),
    );

    return ReturnRequestAttachmentDto.fromJson(
      data['data']['addRequestFileUpload'][0],
    ).toDomain();
  }

  Future<bool> deleteFile() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/deleteFileQueryResponse.json'),
    );

    return data['data']['deleteFile']['isDeleted'] as bool;
  }

  Future<AttachmentFileBuffer> downloadFile() async {
    final data = await rootBundle.load('assets/images/splash.png');

    return AttachmentFileBuffer(
      name: 'returnRequestAttachments',
      buffer: data.buffer.asUint8List(),
    );
  }

  Future<String> addRequest() async {
    final data = json.decode(
      await rootBundle.loadString('assets/json/addRequestV2Response.json'),
    );

    return data['data']['addRequestV2']['requestID'] as String;
  }
}
