part of 'sales_district_bloc.dart';

@freezed
class SalesDistrictEvent with _$SalesDistrictEvent {
  const factory SalesDistrictEvent.initialized() = _Initialized;
  const factory SalesDistrictEvent.fetch() = _Fetch;
}
