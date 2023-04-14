import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';

@freezed
class Announcement with _$Announcement {
  const Announcement._();

  const factory Announcement({
    required bool active,
    required List<AnnouncementMessage> descriptionList,
    required String startTime,
    required String endTime,
    required AnnouncementType type,
    required String day,
    required String functionLabel,
    required String id,
    required bool isModuleSpecific,
    required List<AnnouncementDislayModule> moduleName,
    required AnnouncementDislayTime loginType,
    required bool isCrossButton,
  }) = _Announcement;

  factory Announcement.empty() => Announcement(
        active: false,
        descriptionList: [],
        startTime: '',
        endTime: '',
        type: AnnouncementType(''),
        day: '',
        functionLabel: '',
        id: '',
        isModuleSpecific: false,
        moduleName: [],
        loginType: AnnouncementDislayTime(''),
        isCrossButton: false,
      );

  bool isValidScreenToDisplay({
    required String screenName,
  }) {
    //TODO: This is currently unused, will refactor this code when implement module specific feature for announcement
    if (screenName == HomeNavigationTabbarRoute.name ||
        screenName == HomeTabRoute.name) return true;

    return moduleName.any((module) {
      if (module.isReturn) {
        return screenName.startsWith('Return');
      }
      if (module.isPayment) {
        return false;
      }
      if (module.isOrder) {
        return screenName.startsWith('Order');
      }

      return false;
    });
  }

  String descriptionDisplay({
    required String languageCode,
  }) =>
      _isCustomAnnouncement
          ? descriptionList
              .firstWhere(
                (message) => message.languageCode == languageCode,
                orElse: () => AnnouncementMessage.empty(),
              )
              .announcement
          : descriptionList.first.announcement
              .replaceAll('\${startTime}', startTime)
              .replaceAll('\${endTime}', endTime)
              .replaceAll('\${day}', _dayDisplay)
              .replaceAll('\${functionLabel}', functionLabel);

  bool get _isCustomAnnouncement => descriptionList.length != 1;

  String get _dayDisplay => startTime.isEmpty ? '' : startTime.split(' ')[0];

  bool get hasValidAnnouncement =>
      this != Announcement.empty() && active && !_isExpired;

  bool get _isExpired {
    final parsedEndTime = _toDateTime(endTime);
    if (parsedEndTime != null) {
      return DateTime.now().isAfter(parsedEndTime);
    }

    return true;
  }

  DateTime? _toDateTime(String text) {
    try {
      return DateFormat.yMd().add_jm().parseLoose(text);
    } catch (_) {
      return DateTime.now();
    }
  }
}

@freezed
class AnnouncementMessage with _$AnnouncementMessage {
  const AnnouncementMessage._();

  const factory AnnouncementMessage({
    required String languageCode,
    required String language,
    required String announcement,
  }) = _AnnouncementMessage;

  factory AnnouncementMessage.empty() => const AnnouncementMessage(
        languageCode: '',
        language: '',
        announcement: '',
      );
}
