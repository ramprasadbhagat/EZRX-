part of 'valid_customer_material_bloc.dart';

@freezed
class ValidCustomerMaterialEvent with _$ValidCustomerMaterialEvent {
  const factory ValidCustomerMaterialEvent.initialized() = _Initialized;
  const factory ValidCustomerMaterialEvent.validate({
    required String validateId,
    required List<MaterialNumber> materialList,
    required List<MaterialNumber> focMaterialList,
    required User user,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _Validate;
}
