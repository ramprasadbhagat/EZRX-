part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchTextChanged(String searchText) =
      _SearchTextChanged;
  const factory SearchEvent.searchTextSubmitted(String searchText) =
      _SearchTextSubmitted;
  const factory SearchEvent.clearSearchText() = _ClearSearchText;
  const factory SearchEvent.resetSearchInProgress(bool isSearchInProgress) =
      _ResetSearchInProgress;
}
