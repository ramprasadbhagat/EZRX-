import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_entities.freezed.dart';

@freezed
class ResetPasswordEntities with _$ResetPasswordEntities {
  const ResetPasswordEntities._();

  const factory ResetPasswordEntities({
    required bool success,
    required String status,
  }) = _ResetPasswordEntities;

  
}
