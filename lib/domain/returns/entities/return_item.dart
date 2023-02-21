import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_schedule.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item.freezed.dart';

@freezed
class ReturnItem with _$ReturnItem {
  const ReturnItem._();

  const factory ReturnItem({
    required String assignmentNumber,
    required String referenceDocument,
    required String purchaseNumberC,
    required String poMethod,
    required DateTimeStringValue createdDate,
    required String currency,
    required String plant,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String itemNumber,
    required int targetQuantity,
    required String storeLocation,
    required String batch,
    required String highLevelItemCode,
    required String orderReason,
    required DateTimeStringValue priceDate,
    required double unitPrice,
    required double totalPrice,
    required PrincipalData principalData,
    required DateTimeStringValue expiryDate,
    required bool eligibleForReturn,
    required List<ReturnSchedule> schedules,
    required String suggestedPriceOverride,
    required int balanceQuantity,
    required double balanceValue,
    required bool outsidePolicy,
  }) = _ReturnItem;

  factory ReturnItem.empty() => ReturnItem(
        assignmentNumber: '',
        referenceDocument: '',
        purchaseNumberC: '',
        poMethod: '',
        createdDate: DateTimeStringValue(''),
        currency: '',
        plant: '',
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        itemNumber: '',
        targetQuantity: 0,
        storeLocation: '',
        batch: '',
        highLevelItemCode: '',
        orderReason: '',
        priceDate: DateTimeStringValue(''),
        unitPrice: 0.0,
        totalPrice: 0.0,
        principalData: PrincipalData(
          principalName: '',
          principalCode: PrincipalCode(''),
        ),
        expiryDate: DateTimeStringValue(''),
        eligibleForReturn: false,
        schedules: <ReturnSchedule>[],
        suggestedPriceOverride: '',
        balanceQuantity: 0,
        balanceValue: 0.0,
        outsidePolicy: false,
      );
}
