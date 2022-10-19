part of 'material_bundle_list_bloc.dart';

@freezed
class MaterialBundleListEvent with _$MaterialBundleListEvent {
  const factory MaterialBundleListEvent.initialized() = _Initialized;
  const factory MaterialBundleListEvent.fetch({
    required User user,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;
  const factory MaterialBundleListEvent.loadMore({
    required User user,
    required CustomerCodeInfo customerCode,
    required ShipToInfo shipToCode,
    required SalesOrganisation salesOrganisation,
  }) = _LoadMore;
}
