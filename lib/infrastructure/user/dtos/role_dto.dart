import 'package:ezrxmobile/domain/user/entities/role.dart';
import 'package:ezrxmobile/domain/user/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_dto.freezed.dart';
part 'role_dto.g.dart';

@freezed
class RoleDto with _$RoleDto {
  const RoleDto._();

  const factory RoleDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') required String description,
  }) = _RoleDto;

  factory RoleDto.fromDomain(Role role) {
    return RoleDto(
      id: role.id,
      name: role.name.getOrCrash(),
      description: role.description,
    );
  }

  Role toDomain() {
    return Role(id: id, name: RoleName(name), description: description);
  }

  factory RoleDto.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoFromJson(json);
}
