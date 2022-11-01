import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IShipToCodeRepository {
  Future<Either<ApiFailure, Unit>> storeShipToCode({
    required String shipToCode,
  });

  Future<Either<ApiFailure, String>> getShipToCode();
}
