part of 'about_us_bloc.dart';

@freezed
class AboutUsEvent with _$AboutUsEvent {
  const factory AboutUsEvent.initialize() = _Initialize;
  const factory AboutUsEvent.fetchAboutUsInfo({
    required SalesOrg salesOrg,
  }) = _FetchAboutUsInfo;
}
