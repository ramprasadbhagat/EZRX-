import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';

abstract class IReturnListRepository {
  Future<Either<ApiFailure, List<ReturnItemGroup>>> fetchReturnListByItem({
    required SalesOrg salesOrg,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToInfo,
    required User user,
    required int pageSize,
    required int offset,
  });
}
