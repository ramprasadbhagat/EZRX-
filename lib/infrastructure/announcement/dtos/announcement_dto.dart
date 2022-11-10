import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_dto.freezed.dart';
part 'announcement_dto.g.dart';

@Freezed(toJson: false)
class AnnouncementDto with _$AnnouncementDto {
  const AnnouncementDto._();

  const factory AnnouncementDto({
    @JsonKey(name: 'startTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
        required String startTime,
    @JsonKey(name: 'endTime', defaultValue: '', readValue: announcementDateTimeFormatCheck)
        required String endTime,
    @JsonKey(
      name: 'description',
      defaultValue: '',
    )
        required String description,
    @JsonKey(
      name: 'id',
      defaultValue: '',
    )
        required String id,
    @JsonKey(
      name: 'type',
      defaultValue: '',
    )
        required String type,
    @JsonKey(
      name: 'active',
      defaultValue: false,
    )
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

String announcementDateTimeFormatCheck(Map json, String key){
  if (json[key].isEmpty) return '';

    return json[key].split(' ').length > 2
        ? "${json[key].split(' ')[0]} ${json[key].split(' ')[1]}"
        : json[key].split(' ')[0];
}
