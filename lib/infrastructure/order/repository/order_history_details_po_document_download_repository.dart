import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_po_document_download_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_history_details_po_document_remote.dart';

class OrderHistoryDetailsPoDocumentRepository
    implements IOrderHistoryDetailsPoDocumentRepository {
  final Config config;
  final OrderHistoryDetailsPoDocumentDownloadRemote remoteDataSource;
  final OrderHistoryDetailsPoDocumentDownloadLocal localDataSource;

  OrderHistoryDetailsPoDocumentRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, List<OrderHistoryDetailsPoDocumentsBuffer>>>
      downloadFiles(Map<String, String> files) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final localFile = Future.wait(files.entries
            .map(
              (e) async => await localDataSource.fileDownload(e.key, e.value),
            )
            .toList());

        return Right(await localFile);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final localFile = Future.wait(files.entries
          .map(
            (e) async => await remoteDataSource.fileDownload(e.key, e.value),
          )
          .toList());

      return Right(await localFile);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
