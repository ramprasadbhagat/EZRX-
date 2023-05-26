import 'package:ezrxmobile/domain/account/entities/add_or_update_beneficiary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_or_update_beneficiary_dto.freezed.dart';
part 'add_or_update_beneficiary_dto.g.dart';

@freezed
class AddOrUpdateBeneficiaryDto with _$AddOrUpdateBeneficiaryDto {
  const AddOrUpdateBeneficiaryDto._();

  const factory AddOrUpdateBeneficiaryDto({
    @JsonKey(name: 'info', defaultValue: '') required String info,
  }) = _AddOrUpdateBeneficiaryDto;

  factory AddOrUpdateBeneficiaryDto.fromDomain(
    AddOrUpdateBeneficiaryDto addOrUpdateBeneficiary,
  ) {
    return AddOrUpdateBeneficiaryDto(info: addOrUpdateBeneficiary.info);
  }

  AddOrUpdateBeneficiary toDomain() {
    return AddOrUpdateBeneficiary(info: info);
  }

  factory AddOrUpdateBeneficiaryDto.fromJson(Map<String, dynamic> json) =>
      _$AddOrUpdateBeneficiaryDtoFromJson(json);
}
