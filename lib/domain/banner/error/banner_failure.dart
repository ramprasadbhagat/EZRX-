import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_failure.freezed.dart';

@freezed
class BannerFailure with _$BannerFailure {
  const factory BannerFailure.other(String message) = _Other;
}
