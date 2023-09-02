part of 'articles_info_bloc.dart';

@freezed
class ArticlesInfoEvent with _$ArticlesInfoEvent {
  const factory ArticlesInfoEvent.getArticles({
    required SalesOrg salesOrg,
    required User user,
  }) = _GetArticles;

  const factory ArticlesInfoEvent.loadMoreArticles({
    required SalesOrg salesOrg,
    required User user,
  }) = _LoadMoreArticles;

  const factory ArticlesInfoEvent.setSearchKey({
    required String searchKey,
  }) = _SetSearchKey;
}
