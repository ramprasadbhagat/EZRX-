import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_schedule.freezed.dart';

@freezed
class ReturnSchedule with _$ReturnSchedule {
  const ReturnSchedule._();

  const factory ReturnSchedule({
    required String scheduledLine,
    required DateTimeStringValue requestDate,
  }) = _ReturnSchedule;

  factory ReturnSchedule.empty() => ReturnSchedule(
        scheduledLine: '',
        requestDate: DateTimeStringValue(''),
      );
}
