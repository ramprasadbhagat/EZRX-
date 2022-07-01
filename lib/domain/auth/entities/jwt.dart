import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt.freezed.dart';

@freezed
class JWT with _$JWT {
  const JWT._();

  const factory JWT({
    required String access,
    required String refresh,
  }) = _JWT;

  factory JWT.empty() => const JWT(
        access: '',
        refresh: '',
      );
}
