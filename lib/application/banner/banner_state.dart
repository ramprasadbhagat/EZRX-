part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    required List<BannerItem> banner,
    required Option<Either<ApiFailure, dynamic>>
        bannerFailureOrSuccessOption,
  }) = _BannerState;
  factory BannerState.initial() => BannerState(
        banner: [BannerItem.empty()],
        bannerFailureOrSuccessOption: none(),
      );
}
