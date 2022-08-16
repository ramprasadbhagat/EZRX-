import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';

abstract class BannerRepository {
  Future<Either<BannerFailure, List<BannerItem>>> getBanner();
}