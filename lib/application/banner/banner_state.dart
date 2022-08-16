part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    required List<BannerItem> banner,
  }) = _BannerState;
  factory BannerState.initial() => BannerState(
    banner: [BannerItem.empty()],
  );
}
