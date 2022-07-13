import 'package:ezrxmobile/infrastructure/auth/dtos/cred_dto.dart';

abstract class ICredStorage {
  Future<void> init();
  Future<CredDto> get();
  Future set(CredDto credDto);
  Future delete();
}
