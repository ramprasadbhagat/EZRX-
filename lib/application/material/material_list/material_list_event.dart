part of 'material_list_bloc.dart';

@freezed
class MaterialListEvent with _$MaterialListEvent {
  const factory MaterialListEvent.initialized() = _Initialized;
  const factory MaterialListEvent.fetch() = _Fetch;
  const factory MaterialListEvent.updateSearchKey(String searchKey) =
      _UpdateSearchKey;
  const factory MaterialListEvent.loadMore() = _LoadMore;
}
