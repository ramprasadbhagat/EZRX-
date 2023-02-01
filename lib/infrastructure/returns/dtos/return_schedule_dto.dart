import 'package:ezrxmobile/domain/returns/entities/return_schedule.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_schedule_dto.freezed.dart';
part 'return_schedule_dto.g.dart';

@freezed
class ReturnScheduleDto with _$ReturnScheduleDto {
  const ReturnScheduleDto._();

  const factory ReturnScheduleDto({
    @JsonKey(name: 'scheduledLine', defaultValue: '')
        required String scheduledLine,
    @JsonKey(
      name: 'requestDate',
      defaultValue: '',
    )
        required String requestDate,
  }) = _ReturnScheduleDto;

  factory ReturnScheduleDto.fromDomain(
    ReturnSchedule schedule,
  ) {
    return ReturnScheduleDto(
      scheduledLine: schedule.scheduledLine,
      requestDate: schedule.requestDate.getOrCrash(),
    );
  }

  ReturnSchedule toDomain() {
    return ReturnSchedule(
      scheduledLine: scheduledLine,
      requestDate: SimpleDate(requestDate),
    );
  }

  factory ReturnScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnScheduleDtoFromJson(json);
}
