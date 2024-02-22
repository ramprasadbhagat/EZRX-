import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure(
    String message, {
    @Default(<String, String>{}) Map<String, String> arguments,
  }) = _Failure;
}
