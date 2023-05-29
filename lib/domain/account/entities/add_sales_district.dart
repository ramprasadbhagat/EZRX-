import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_sales_district.freezed.dart';

@freezed
class AddSalesDistrict with _$AddSalesDistrict {
  const AddSalesDistrict._();

  const factory AddSalesDistrict({
    required SalesDistrictMessage message,
  }) = _AddSalesDistrict;

  factory AddSalesDistrict.empty() => AddSalesDistrict(
        message: SalesDistrictMessage(''),
      );
}
