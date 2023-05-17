import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_org_id.freezed.dart';

@freezed
class SalesOrgId with _$SalesOrgId {
  const SalesOrgId._();

  const factory SalesOrgId({
    required int id,
  }) = _SalesOrgId;
  
  factory SalesOrgId.empty() => const SalesOrgId(
    id: 0,
  );
}