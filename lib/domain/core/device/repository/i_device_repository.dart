import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IDeviceRepository {
  Future<Either<ApiFailure, bool>> getDeviceData();

  Future<Either<ApiFailure, Unit>> setDeviceData({
    required bool isAppFirstLaunch,
  });

  Future<Either<ApiFailure, Unit>> initDeviceStorage();

  Future<Either<ApiFailure, String>> getCurrentMarket();

  Future<Either<ApiFailure, Unit>> setCurrentMarket({
    required String currentMarket,
  });
}
