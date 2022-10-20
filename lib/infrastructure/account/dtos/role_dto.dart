import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_dto.freezed.dart';
part 'role_dto.g.dart';

@freezed
class RoleDto with _$RoleDto {
  const RoleDto._();

  const factory RoleDto({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'description', defaultValue: '') required String description,
  }) = _RoleDto;

  factory RoleDto.fromDomain(Role role) {
    return RoleDto(
      id: role.id,
      name: role.name,
      type: role.type.getOrCrash(),
      description: role.description,
    );
  }

  Role toDomain() {
    return Role(
      id: id,
      name: name,
      type: RoleType(type),
      description: description,
    );
  }

  factory RoleDto.fromJson(Map<String, dynamic> json) =>
      _$RoleDtoFromJson(json);
}
