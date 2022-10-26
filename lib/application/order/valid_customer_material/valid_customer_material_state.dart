part of 'valid_customer_material_bloc.dart';

@freezed
class ValidCustomerMaterialState with _$ValidCustomerMaterialState {
  const ValidCustomerMaterialState._();
  const factory ValidCustomerMaterialState({
    required Map<String, List<MaterialNumber>> validMaterialNumbers,
    required bool isValidating,
  }) = _ValidCustomerMaterialState;
  factory ValidCustomerMaterialState.initial() =>
      const ValidCustomerMaterialState(
        validMaterialNumbers: {},
        isValidating: false,
      );

  List<String> get validMaterialNumberList {
    final validMaterialNumberList = <String>[];
    for (final materialNumbers in validMaterialNumbers.values) {
      validMaterialNumberList
          .addAll(materialNumbers.map((e) => e.getOrDefaultValue('')));
    }

    return validMaterialNumberList.toSet().toList();
  }

  List<String> filterValidMaterialNumber(List<String> materialNumbers) =>
      materialNumbers
          .where((String element) => validMaterialNumberList.contains(element))
          .toList();

  List<String> filterInvalidMaterialNumber(List<String> materialNumbers) =>
      materialNumbers
          .where((String element) => !validMaterialNumberList.contains(element))
          .toList();
}
