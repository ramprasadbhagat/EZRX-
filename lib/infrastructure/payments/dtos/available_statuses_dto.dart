import 'package:ezrxmobile/domain/payments/entities/available_statuses.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_statuses_dto.freezed.dart';
part 'available_statuses_dto.g.dart';

@freezed
class AvailableStatusesDto with _$AvailableStatusesDto {
  const AvailableStatusesDto._();
  factory AvailableStatusesDto({
    @JsonKey(
      name: 'statuses',
      defaultValue: <String>[],
    )
        required List<String> statuses,
  }) = _AvailableStatusesDto;

  AvailableStatuses toDomain() {
    return AvailableStatuses(
      statuses: statuses,
    );
  }

  factory AvailableStatusesDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableStatusesDtoFromJson(json);
}
