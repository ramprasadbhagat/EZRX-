part of 'banner_bloc.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState({
    required List<EZReachBanner> banner,
    required Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption,
    required bool isLoading,
  }) = _BannerState;
  factory BannerState.initial() => BannerState(
        banner: <EZReachBanner>[],
        bannerFailureOrSuccessOption: none(),
        isLoading: false,
      );
}
