import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_material_selected.freezed.dart';

@freezed
class FilterMaterialSelected with _$FilterMaterialSelected {
  const FilterMaterialSelected._();

  const factory FilterMaterialSelected({
    required List<String> uniquePrincipalName,
    required List<String> uniqueTherapeuticClass,
    required List<String> uniqueItemBrand,
  }) = _FilterMaterialSelected;

  factory FilterMaterialSelected.empty() => const FilterMaterialSelected(
        uniqueItemBrand: <String>[],
        uniquePrincipalName: <String>[],
        uniqueTherapeuticClass: <String>[],
      );
}
