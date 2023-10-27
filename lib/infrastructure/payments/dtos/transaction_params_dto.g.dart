// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_params_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionParamsDto _$$_TransactionParamsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionParamsDto(
      customer: json['customer'] as String? ?? '',
      createdStartDate: json['createdStartDate'] as String? ?? '',
      createdEndDate: json['createdEndDate'] as String? ?? '',
      search: json['search'] as String? ?? '',
      first: json['first'] as int? ?? 0,
      after: json['after'] as int? ?? 0,
      amountMin: json['amountMin'] as int? ?? 0,
      amountMax: json['amountMax'] as int? ?? 0,
      status: (json['status'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_TransactionParamsDtoToJson(
        _$_TransactionParamsDto instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'createdStartDate': instance.createdStartDate,
      'createdEndDate': instance.createdEndDate,
      'search': instance.search,
      'first': instance.first,
      'after': instance.after,
      'amountMin': instance.amountMin,
      'amountMax': instance.amountMax,
      'status': instance.status,
    };
