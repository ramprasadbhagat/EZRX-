import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_filter.freezed.dart';

@freezed
class MaterialFilter with _$MaterialFilter {
  const MaterialFilter._();

  const factory MaterialFilter({
    required List<String> uniquePrincipalName,
    required List<String> uniqueTherapeuticClass,
    required List<String> uniqueItemBrand,
    @Default(false) bool isFavourite,
  }) = _MaterialFilter;

  factory MaterialFilter.empty() => const MaterialFilter(
        uniqueItemBrand: <String>[],
        uniquePrincipalName: <String>[],
        uniqueTherapeuticClass: <String>[],
        isFavourite: false,
      );
}
