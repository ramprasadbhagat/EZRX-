part of 'articles_info_bloc.dart';

@freezed
class ArticlesInfoState with _$ArticlesInfoState {
  const ArticlesInfoState._();

  const factory ArticlesInfoState({
    required AnnouncementArticleInfo articleInfo,
    required bool isFetching,
    required bool canLoadMore,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _ArticlesInfoState;

  factory ArticlesInfoState.initial() => ArticlesInfoState(
        isFetching: false,
        articleInfo: AnnouncementArticleInfo.empty(),
        canLoadMore: true,
        apiFailureOrSuccessOption: none(),
      );
}
