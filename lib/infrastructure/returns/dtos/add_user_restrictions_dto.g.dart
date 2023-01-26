// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_restrictions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddConfigureUserRestrictionDto _$$_AddConfigureUserRestrictionDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AddConfigureUserRestrictionDto(
      addRestrictionStatus:
          addRestrictionOverride(json, 'addRestriction') as String? ?? '',
      addReturnApprovalLimit:
          addReturnApprovalLimitOverride(json, 'addReturnApprovalLimit')
                  as bool? ??
              false,
    );

Map<String, dynamic> _$$_AddConfigureUserRestrictionDtoToJson(
        _$_AddConfigureUserRestrictionDto instance) =>
    <String, dynamic>{
      'addRestriction': instance.addRestrictionStatus,
      'addReturnApprovalLimit': instance.addReturnApprovalLimit,
    };
