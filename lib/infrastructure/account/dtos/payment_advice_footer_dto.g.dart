// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_advice_footer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentAdviceFooterDto _$$_PaymentAdviceFooterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentAdviceFooterDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      salesDistrict: json['salesDistrict'] as String? ?? '',
      footer: json['footer'] as String? ?? '',
      headerLogoPath: json['headerLogoPath'] as String? ?? '',
      header: json['header'] as String? ?? '',
      pleaseNote: json['pleaseNote'] as String? ?? '',
    );

Map<String, dynamic> _$$_PaymentAdviceFooterDtoToJson(
        _$_PaymentAdviceFooterDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'salesDistrict': instance.salesDistrict,
      'footer': instance.footer,
      'headerLogoPath': instance.headerLogoPath,
      'header': instance.header,
      'pleaseNote': instance.pleaseNote,
    };
