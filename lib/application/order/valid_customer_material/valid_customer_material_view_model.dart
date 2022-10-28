import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'valid_customer_material_view_model.freezed.dart';

enum ValidatingStatus { success, failure, loading }

@freezed
class ValidCustomerMaterialViewModel with _$ValidCustomerMaterialViewModel {
  const ValidCustomerMaterialViewModel._();

  const factory ValidCustomerMaterialViewModel({
    @Default(<MaterialNumber>[]) List<MaterialNumber> validMaterialNumbers,
    required ValidatingStatus status,
  }) = _ValidCustomerMaterialViewModel;
}
