part of 'material_filter_bloc.dart';

@freezed
class MaterialFilterState with _$MaterialFilterState {
  const MaterialFilterState._();
  const factory MaterialFilterState({
    required MaterialFilter materialFilter,
    required SearchKey searchKey,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required bool isFetching,
  }) = _MaterialFilterState;

  factory MaterialFilterState.initial() => MaterialFilterState(
        isFetching: false,
        materialFilter: const MaterialFilter(
          countryMapOptions: <MaterialFilterCountry, bool>{},
          manufactureMapOptions: <String, bool>{},
          brandList: <String>[],
        ),
        searchKey: SearchKey(''),
        apiFailureOrSuccessOption: none(),
      );

  MaterialFilter get displayMaterialFilter => MaterialFilter(
        manufactureMapOptions: Map<String, bool>.fromEntries(
          materialFilter.manufactureMapOptions.entries.where(
            (element) => element.key
                .toLowerCase()
                .contains(searchKey.getValue().toLowerCase()),
          ),
        ),
        countryMapOptions: Map<MaterialFilterCountry, bool>.fromEntries(
          materialFilter.countryMapOptions.entries.where(
            (element) => element.key.name
                .toLowerCase()
                .contains(searchKey.getValue().toLowerCase()),
          ),
        ),
        brandList: <String>[],
      );

  MaterialFilter get emptyMaterialFilter => MaterialFilter.empty();
}
