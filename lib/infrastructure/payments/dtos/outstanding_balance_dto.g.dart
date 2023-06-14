// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_balance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutstandingBalanceDto _$$_OutstandingBalanceDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OutstandingBalanceDto(
      customerCode: json['customerCode'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      amount: json['amount'] as String? ?? '',
      overdue: json['overdue'] as String? ?? '',
      checkDate: json['checkDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_OutstandingBalanceDtoToJson(
        _$_OutstandingBalanceDto instance) =>
    <String, dynamic>{
      'customerCode': instance.customerCode,
      'currency': instance.currency,
      'amount': instance.amount,
      'overdue': instance.overdue,
      'checkDate': instance.checkDate,
    };
