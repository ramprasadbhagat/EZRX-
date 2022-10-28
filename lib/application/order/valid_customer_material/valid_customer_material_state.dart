part of 'valid_customer_material_bloc.dart';

@freezed
class ValidCustomerMaterialState with _$ValidCustomerMaterialState {
  const ValidCustomerMaterialState._();
  const factory ValidCustomerMaterialState({
    required Map<String, ValidCustomerMaterialViewModel> validMaterialState,
  }) = _ValidCustomerMaterialState;
  factory ValidCustomerMaterialState.initial() =>
      const ValidCustomerMaterialState(
        validMaterialState: {},
      );

  ValidatingStatus? validatingStatusById(
    String validateId,
  ) =>
      validMaterialState[validateId]?.status;

  List<MaterialNumber> validMaterialNumberById(
    String validateId,
  ) =>
      validMaterialState[validateId]?.validMaterialNumbers ?? [];

  List<String> get validMaterialNumberList {
    final validMaterialNumberList = <String>[];
    for (final state in validMaterialState.values) {
      validMaterialNumberList.addAll(
        state.validMaterialNumbers.map(
          (e) => e.getOrDefaultValue(''),
        ),
      );
    }

    return validMaterialNumberList.toSet().toList();
  }

  List<String> filterValidMaterialNumber(List<String> materialNumbers) =>
      materialNumbers
          .where(
            (String element) => validMaterialNumberList.contains(
              element,
            ),
          )
          .toList();

  List<String> filterInvalidMaterialNumber(List<String> materialNumbers) =>
      materialNumbers
          .where(
            (String element) => !validMaterialNumberList.contains(
              element,
            ),
          )
          .toList();
}
