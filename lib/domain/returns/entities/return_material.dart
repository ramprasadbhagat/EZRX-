import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_material.freezed.dart';

@freezed
class ReturnMaterial with _$ReturnMaterial {
  const ReturnMaterial._();

  const factory ReturnMaterial({
    required IntegerValue targetQuantity,
    required RangeValue unitPrice,
    required RangeValue totalPrice,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String batch,
    required String assignmentNumber,
    required PrincipalCode principalCode,
    required PrincipalName principalName,
    required DateTimeStringValue expiryDate,
    required DateTimeStringValue priceDate,
    required List<ReturnMaterial> bonusItems,
  }) = _ReturnMaterial;

  factory ReturnMaterial.empty() => ReturnMaterial(
        targetQuantity: IntegerValue(''),
        unitPrice: RangeValue(''),
        totalPrice: RangeValue(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        batch: '',
        assignmentNumber: '',
        principalCode: PrincipalCode(''),
        principalName: PrincipalName(''),
        expiryDate: DateTimeStringValue(''),
        priceDate: DateTimeStringValue(''),
        bonusItems: <ReturnMaterial>[],
      );
}

extension ReturnMaterialListExtension on List<ReturnMaterial> {
  double get amountTotal => fold<double>(
        0,
        (sum, item) => sum + item.totalPrice.getOrDefaultValue(0),
      );
}
