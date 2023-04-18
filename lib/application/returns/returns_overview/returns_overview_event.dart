part of 'returns_overview_bloc.dart';

@freezed
class ReturnsOverviewEvent with _$ReturnsOverviewEvent {
  const factory ReturnsOverviewEvent.initialized() = _Initialized;
  const factory ReturnsOverviewEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required User user,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
  }) = _fetchReturnsOverview;
}
