// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionItemDto _$$_TransactionItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionItemDto(
      id: json['id'] as String? ?? '',
      reference: json['reference'] as String? ?? '',
      paymentStatus: json['paymentStatus'] as String? ?? '',
      amountDue: (json['amountDue'] as num?)?.toDouble() ?? 0,
      createdOn: json['createdOn'] as String? ?? '',
      paidOn: json['paidOn'] as String? ?? '',
    );

Map<String, dynamic> _$$_TransactionItemDtoToJson(
        _$_TransactionItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference': instance.reference,
      'paymentStatus': instance.paymentStatus,
      'amountDue': instance.amountDue,
      'createdOn': instance.createdOn,
      'paidOn': instance.paidOn,
    };
