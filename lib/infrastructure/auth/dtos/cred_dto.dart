import 'package:ezrxmobile/domain/auth/entities/cred.dart';
import 'package:hive/hive.dart';

part 'cred_dto.g.dart';

@HiveType(typeId: 0)
class CredDto {
  CredDto({required this.username, required this.password});

  @HiveField(0)
  final String username;
  @HiveField(1)
  final String password;

  factory CredDto.fromDomain(Cred cred) {
    return CredDto(
      username: cred.username,
      password: cred.password,
    );
  }

  Cred toDomain() {
    return Cred(
      username: username,
      password: password,
    );
  }
}
