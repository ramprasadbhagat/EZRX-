import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_org_failure.freezed.dart';

@freezed
class SalesOrgFailure with _$SalesOrgFailure {
  const factory SalesOrgFailure.other(String message) = _Other;
  const factory SalesOrgFailure.serverError(String message) = _ServerError;
  const factory SalesOrgFailure.poorConnection() = _PoorConnection;
  const factory SalesOrgFailure.serverTimeout() = _ServerTimeout;
}
