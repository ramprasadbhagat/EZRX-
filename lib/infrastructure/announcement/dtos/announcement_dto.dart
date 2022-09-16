import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';

part 'announcement_dto.freezed.dart';
part 'announcement_dto.g.dart';

@Freezed(toJson: false)
class AnnouncementDto with _$AnnouncementDto {
  const AnnouncementDto._();

  const factory AnnouncementDto({
    required String startTime,
    required String endTime,
    required String description,
    required String id,
    required String type,
    required bool active,
  }) = _AnnouncementDto;

  Announcement toDomain() {
    return Announcement(
      id: id,
      startTime: startTime,
      endTime: endTime,
      description: description,
      active: active,
      type: type,
    );
  }

  factory AnnouncementDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementDtoFromJson(json);
}
