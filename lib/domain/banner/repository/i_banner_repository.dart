import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';

abstract class IBannerRepository {
  Future<Either<BannerFailure, List<BannerItem>>> getBanner(
    bool isPreSalesOrg,
    SalesOrganisation salesOrganisation,
  );
}
