import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa.freezed.dart';

@freezed
class Soa with _$Soa {
  factory Soa({
    required SoaData soaData,
  }) = _Soa;
}
