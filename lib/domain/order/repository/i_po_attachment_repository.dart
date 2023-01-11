import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:file_picker/file_picker.dart';

abstract class IpoAttachmentRepository {
  Future<Either<ApiFailure, List<PoDocumentsBuffer>>> downloadFiles(
    Map<String, String> files,
  );
  Future<Either<ApiFailure, List<PoDocuments>>> uploadFiles({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required List<PlatformFile> files,
    required User user,
    required List<PoDocuments> uploadedPODocument,
  });
}
