import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_name.freezed.dart';

@freezed
class FullName with _$FullName {
  const FullName._();

  const factory FullName({
    required String firstName,
    required String lastName,
  }) = _FullName;

  factory FullName.empty() => const FullName(
        firstName: '',
        lastName: '',
      );
}
