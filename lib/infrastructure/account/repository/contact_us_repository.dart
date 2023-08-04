import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/account/repository/i_contact_us_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/contact_us_dto.dart';

class ContactUsRepository implements IContactUsRepository {
  final Config config;
  final ContactUsRemoteDataSource remoteDataSource;
  final ContactUsLocalDataSource localDataSource;

  ContactUsRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<ApiFailure, bool>> submit({
    required ContactUs contactUs,
    required String customerCode,
    required String clinicName,
    required String language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final isSuccess = await localDataSource.submit();

        return Right(isSuccess);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final isSuccess = await remoteDataSource.submit(
        contactUsMap: ContactUsDto.fromDomain(contactUs).toJson(),
        clinicName: clinicName,
        customerCode: customerCode,
        language: language,
      );

      return Right(isSuccess);
    } catch (e) {
      return Left(
        FailureHandler.handleFailure(e),
      );
    }
  }
}
