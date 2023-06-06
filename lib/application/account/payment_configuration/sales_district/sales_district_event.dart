part of 'sales_district_bloc.dart';

@freezed
class SalesDistrictEvent with _$SalesDistrictEvent {
  const factory SalesDistrictEvent.initialized() = _Initialized;
  const factory SalesDistrictEvent.onValueChange({
    required SalesDistrictField field,
    required String value,
  }) = _OnValueOnChange;
  const factory SalesDistrictEvent.resetField() = _ResetField;
  const factory SalesDistrictEvent.fetch() = _Fetch;
  const factory SalesDistrictEvent.add() = _Add;
  const factory SalesDistrictEvent.edit() = _Edit;
  const factory SalesDistrictEvent.delete() = _Delete;
}

enum SalesDistrictField {
  salesOrg,
  id,
  salesDistrictHeader,
  salesDistrictLabel,
}
