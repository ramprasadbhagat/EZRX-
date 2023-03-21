import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:file_picker/file_picker.dart';

const int _fileSizeLimitMB = 5;
const int _maxUpload = 10;

class PoAttachmentRepository implements IpoAttachmentRepository {
  final Config config;
  final PoDocumentRemote remoteDataSource;
  final PoDocumentLocalDataSource localDataSource;

  PoAttachmentRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<PoDocumentsBuffer>>> downloadFiles(
    List<PoDocuments> files,
    AttachmentType attachmentType,

  ) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = Future.wait(files
            .map(
              (e) async => await localDataSource.fileDownload(e.name, e.url),
            )
            .toList());

        return Right(await localFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = Future.wait(files
          .map(
            (e) async => await remoteDataSource.fileDownload(e.name, e.url, attachmentType),
          )
          .toList());

      return Right(await localFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, List<PoDocuments>>> uploadFiles({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<PlatformFile> files,
    required User user,
    required List<PoDocuments> uploadedPODocument,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = await localDataSource.fileUpload();

        return Right([localFile]);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      if ((uploadedPODocument.length + files.length) > _maxUpload) {
        return const Left(
          ApiFailure.other('Number of files exceeds the criteria'),
        );
      }
      final biggerfile = files.where(
        (PlatformFile element) =>
            element.size > (_fileSizeLimitMB * pow(1024, 2)),
      );
      if (biggerfile.isNotEmpty) {
        return Left(ApiFailure.other(
          'The file ${biggerfile.first.name} uploaded is greater than 5 MB',
        ));
      }
      final upLoadedFiles = Future.wait(
        files.map(
          (e) async => await remoteDataSource.fileUpload(
            countryName: salesOrg.country,
            currentYear: DateTime.now().year.toString(),
            file: MultipartFile.fromFileSync(
              e.path ?? '',
              filename: e.name,
            ),
            userName: user.username.getOrCrash(),
          ),
        ),
      );

      return Right(await upLoadedFiles);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
