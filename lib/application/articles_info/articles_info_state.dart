part of 'articles_info_bloc.dart';

@freezed
class ArticlesInfoState with _$ArticlesInfoState {
  const ArticlesInfoState._();

  const factory ArticlesInfoState({
    required SalesOrg salesOrg,
    required ShipToInfo shipToInfo,
    required AnnouncementArticleInfo articleInfo,
    required bool isFetching,
    required bool canLoadMore,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
  }) = _ArticlesInfoState;

  factory ArticlesInfoState.initial() => ArticlesInfoState(
        salesOrg: SalesOrg(''),
        shipToInfo: ShipToInfo.empty(),
        isFetching: false,
        articleInfo: AnnouncementArticleInfo.empty(),
        canLoadMore: true,
        searchKey: SearchKey(''),
        apiFailureOrSuccessOption: none(),
      );

  List<AnnouncementArticleItem> get filterAnnouncementListBySearchKey =>
      articleInfo.filterAnnouncementListBySearchKey(
        searchKey.searchValueOrEmpty.toLowerCase(),
      );
}
