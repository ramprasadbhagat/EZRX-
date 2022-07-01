import 'package:freezed_annotation/freezed_annotation.dart';

part 'cred.freezed.dart';

@freezed
class Cred with _$Cred {
  const Cred._();

  const factory Cred({
    required String username,
    required String password,
  }) = _Cred;

  factory Cred.empty() => const Cred(
        username: '',
        password: '',
      );
}
