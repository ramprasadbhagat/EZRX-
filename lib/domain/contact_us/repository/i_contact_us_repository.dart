import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IContactUsDetailsRepository {
  Future<Either<ApiFailure, ContactUsDetails>> getContactUsDetails({
    required SalesOrg salesOrg,
  });
}
