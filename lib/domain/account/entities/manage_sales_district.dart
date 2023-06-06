import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_sales_district.freezed.dart';

@freezed
class SalesDistrictResponseMessage with _$SalesDistrictResponseMessage {
  const SalesDistrictResponseMessage._();

  const factory SalesDistrictResponseMessage({
    required StringValue message,
  }) = _SalesDistrictResponseMessage;

  factory SalesDistrictResponseMessage.empty() => SalesDistrictResponseMessage(
        message: StringValue(''),
      );
}
