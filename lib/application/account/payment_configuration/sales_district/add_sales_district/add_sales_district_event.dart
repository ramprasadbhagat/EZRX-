part of 'add_sales_district_bloc.dart';

@freezed
class AddSalesDistrictEvent with _$AddSalesDistrictEvent {
  const factory AddSalesDistrictEvent.initialized() = _Initialized;
  const factory AddSalesDistrictEvent.salesOrgChanged({
    required SalesOrg salesOrg,
  }) = _SalesOrgChanged;
  const factory AddSalesDistrictEvent.salesDistrictHeaderChanged({
    required StringValue salesDistrictHeader,
  }) = _SalesDistrictHeaderChanged;
  const factory AddSalesDistrictEvent.salesDistrictLabelChanged({
    required StringValue salesDistrictLabel,
  }) = _SalesDistrictLabelChanged;
  const factory AddSalesDistrictEvent.addSalesDistrict() = _AddSalesDistric;
}
