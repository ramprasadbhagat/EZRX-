import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';

@freezed
class Role with _$Role {
  const Role._();

  const factory Role({
    required String id,
    required String name,
    required String description,
  }) = _Role;

  factory Role.empty() => const Role(
        id: '',
        name: '',
        description: '',
      );
}
