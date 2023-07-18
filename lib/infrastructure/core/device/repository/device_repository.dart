import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';

class DeviceRepository implements IDeviceRepository {
  final DeviceStorage deviceStorage;

  DeviceRepository({
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, Unit>> setDeviceData({
    required bool isAppFirstLaunch,
  }) async {
    try {
      await deviceStorage.setAppFirstLaunch(
        isAppFirstLaunch: isAppFirstLaunch,
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> initDeviceStorage() async {
    try {
      await deviceStorage.init();

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> getDeviceData() async {
    try {
      final isAppFirstLaunch = deviceStorage.isAppFirstLaunch();

      return Right(isAppFirstLaunch);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> setCurrentMarket({
    required String currentMarket,
  }) async {
    try {
      await deviceStorage.putCurrentMarket(
        currentMarket: currentMarket,
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, String>> getCurrentMarket() async {
    try {
      final currentMarket = deviceStorage.currentMarket();

      return Right(currentMarket);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
