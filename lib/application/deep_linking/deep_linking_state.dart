part of 'deep_linking_bloc.dart';

@freezed
class DeepLinkingState with _$DeepLinkingState {
  const factory DeepLinkingState.initial() = _Initial;
  const factory DeepLinkingState.linkPending(Uri link) = _LinkPending;
  const factory DeepLinkingState.redirectMaterialDetail(String materialNumber) =
      _RedirectMaterialDetail;
       const factory DeepLinkingState.redirectHistoryDetail(String history) =
      _RedirectHistoryDetail;
  const factory DeepLinkingState.error(RedirectFailure failure) = _Error;
}
