import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';

@freezed
class Announcement with _$Announcement {
  const Announcement._();

  const factory Announcement({
    required String startTime,
    required String endTime,
    required String description,
    required String id,
    required String type,
    required bool active,
  }) = _Announcement;

  factory Announcement.empty() => const Announcement(
        startTime: '',
        endTime: '',
        description: '',
        id: '',
        type: '',
        active: false,
      );

  bool get hasValidAnnouncement => this != Announcement.empty() && active;

  String get descriptionDisplay {
    var newDescription = descriptionParsed;

    var textsNeedTranslated = const <String>[
      'eZRx will be undergoing enhancements from ',
      'SGT on',
      'We apologize for the inconvenience and appreciate your patience.',
    ];

    for (var text in textsNeedTranslated) {
      if (newDescription.contains(text)) {
        newDescription = newDescription.replaceAll(text, text.tr());
      }
    }

    return newDescription;
  }

  String get descriptionParsed {
    return description.isNotEmpty
        ? description
            .replaceAll('\${startTime}', _startTimeConvert)
            .replaceAll('\${endTime}', _endTimeConvert)
            .replaceAll('\${day}', startTime.split(' ')[0])
        : '';
  }

  String get _startTimeConvert {
    if (startTime.isEmpty) return '';

    return startTime.split(' ').length > 2
        ? "${startTime.split(' ')[1]} ${startTime.split(' ')[2]}"
        : startTime.split(' ')[1];
  }

  String get _endTimeConvert {
    if (endTime.isEmpty) return '';

    return endTime.split(' ').length > 2
        ? "${endTime.split(' ')[1]} ${endTime.split(' ')[2]}"
        : endTime.split(' ')[1];
  }
}
