import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_statuses.freezed.dart';

@freezed
class AvailableStatuses with _$AvailableStatuses {
  const AvailableStatuses._();
  factory AvailableStatuses({
    required List<String> statuses,
  }) = _AvailableStatuses;

  factory AvailableStatuses.empty() => AvailableStatuses(
        statuses: <String>[],
      );
  
}
