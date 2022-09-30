import 'package:freezed_annotation/freezed_annotation.dart';

part 'principal_data.freezed.dart';

@freezed
class PrincipalData with _$PrincipalData {
  const PrincipalData._();

  const factory PrincipalData({
    required String principalName,
    required String principalCode,
  }) = _PrincipalData;

  factory PrincipalData.empty() => const PrincipalData(
    principalName: '',
    principalCode: '',
  );
}