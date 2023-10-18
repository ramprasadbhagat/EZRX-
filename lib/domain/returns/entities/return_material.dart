import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_material.freezed.dart';

@freezed
class ReturnMaterial with _$ReturnMaterial {
  const ReturnMaterial._();

  const factory ReturnMaterial({
    required IntegerValue balanceQuantity,
    required RangeValue unitPrice,
    required RangeValue totalPrice,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String itemNumber,
    required String batch,
    required bool eligibleForReturn,
    required String assignmentNumber,
    required PrincipalCode principalCode,
    required PrincipalName principalName,
    required DateTimeStringValue expiryDate,
    required DateTimeStringValue priceDate,
    required List<ReturnMaterial> bonusItems,
  }) = _ReturnMaterial;

  factory ReturnMaterial.empty() => ReturnMaterial(
        balanceQuantity: IntegerValue(''),
        unitPrice: RangeValue(''),
        totalPrice: RangeValue(''),
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        itemNumber: '',
        batch: '',
        eligibleForReturn: false,
        assignmentNumber: '',
        principalCode: PrincipalCode(''),
        principalName: PrincipalName(''),
        expiryDate: DateTimeStringValue(''),
        priceDate: DateTimeStringValue(''),
        bonusItems: <ReturnMaterial>[],
      );

  String get uuid => '$assignmentNumber$itemNumber';

  ReturnItemDetails get validatedItemDetails =>
      ReturnItemDetails.empty().copyWith(
        materialNumber: materialNumber,
        itemNumber: itemNumber,
        assignmentNumber: assignmentNumber,
        batch: batch,
        unitPrice: unitPrice,
      );
}
