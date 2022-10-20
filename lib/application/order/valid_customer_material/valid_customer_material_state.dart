part of 'valid_customer_material_bloc.dart';

@freezed
class ValidCustomerMaterialState with _$ValidCustomerMaterialState {
  const ValidCustomerMaterialState._();
  const factory ValidCustomerMaterialState({
    required List<MaterialNumber> validMaterialList,
  }) = _ValidCustomerMaterialState;
  factory ValidCustomerMaterialState.initial() =>
      const ValidCustomerMaterialState(
        validMaterialList: <MaterialNumber>[],
      );

  List<String> get validMaterialNumber => validMaterialList
      .map((MaterialNumber materialNumber) => materialNumber.getOrCrash())
      .toList();

  List<String> allValidMaterail(List<String> materialNumbers) => materialNumbers
      .where((String element) => validMaterialNumber.contains(element))
      .toList();

  List<String> allInValidMaterail(List<String> materialNumbers) =>
      materialNumbers
          .where((String element) => !validMaterialNumber.contains(element))
          .toList();
}
