import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_data.freezed.dart';

@freezed
class PrincipalData with _$PrincipalData {
  const PrincipalData._();

  const factory PrincipalData({
    required String principalName,
    required PrincipleCode principalCode,
  }) = _PrincipalData;

  factory PrincipalData.empty() => PrincipalData(
        principalName: '',
        principalCode: PrincipleCode(''),
      );
}
