import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/repository/i_ship_to_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';


class ShipToCodeRepository extends IShipToCodeRepository {
  AccountSelectorStorage accountSelectorStorage;
  

  ShipToCodeRepository({
    required this.accountSelectorStorage,
    
  });

  @override
  Future<Either<ApiFailure, String>> getShipToCode() async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();

      return Right(accountSelectorStorageDto.shippingAddress);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> storeShipToCode({
    required String shipToCode,
  }) async {
    try {
      final accountSelectorStorageDto = await accountSelectorStorage.get();
      final accountSelector = accountSelectorStorageDto.toDomain();
      await accountSelectorStorage.set(
        accountSelectorStorageDto: AccountSelectorStorageDto.fromDomain(
          accountSelector: accountSelector.copyWith(
            shippingAddress: shipToCode,
          ),
        ),
      );

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
