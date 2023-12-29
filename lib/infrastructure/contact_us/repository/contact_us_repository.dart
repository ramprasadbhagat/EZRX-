import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/contact_us/repository/i_contact_us_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';

class ContactUsDetailsRepository extends IContactUsDetailsRepository {
  final ContactUsDetailsRemoteDataSource remoteDataSource;
  final ContactUsDetailsLocalDataSource localDataSource;
  final Config config;

  ContactUsDetailsRepository({
    required this.remoteDataSource,
    required this.config,
    required this.localDataSource,
  });
  @override
  Future<Either<ApiFailure, ContactUsDetails>> getContactUsDetails({
    required SalesOrg salesOrg,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final contactUsDetails = await localDataSource.getContactUsDetails();

        return Right(contactUsDetails);
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final contactUsDetails = await remoteDataSource.getContactUsDetails(
        announcementUrlPath: config.announcementApiUrlPath,
        lang: salesOrg.announcementLocale.languageCode,
        contactUsId: salesOrg.contactUsItemId,
        token: config.xGQLToken,
      );

      return Right(contactUsDetails);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}
