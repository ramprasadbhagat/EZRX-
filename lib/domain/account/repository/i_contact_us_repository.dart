import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IContactUsRepository {
  Future<Either<ApiFailure, bool>> submit({
    required ContactUs contactUs,
    required String customerCode,
    required String clinicName,
    required String language,
  });
}
