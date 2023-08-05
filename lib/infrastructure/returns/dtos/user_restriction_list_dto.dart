import 'package:ezrxmobile/infrastructure/returns/dtos/user_restriction_list_raw_meta_data_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_restriction_list_dto.freezed.dart';

part 'user_restriction_list_dto.g.dart';

@freezed
class UserRestrictionListDto with _$UserRestrictionListDto {
  UserRestrictionListDto._();

  factory UserRestrictionListDto({
    @JsonKey(name: 'rawMetaData')
        required UserRestrictionListRawMetaDataDto rawMetaData,
  }) = _UserRestrictionListDto;

  factory UserRestrictionListDto.fromJson(Map<String, dynamic> json) =>
      _$UserRestrictionListDtoFromJson(json);
}
