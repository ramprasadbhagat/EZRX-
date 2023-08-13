import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IBannerRepository {
  Future<Either<ApiFailure, List<BannerItem>>> getEZReachBanner({
    required SalesOrganisation salesOrganisation,
    required String country,
    required String role,
    required String bannerType,
  });
}
