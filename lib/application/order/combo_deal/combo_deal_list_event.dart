part of 'combo_deal_list_bloc.dart';

@freezed
class ComboDealListEvent with _$ComboDealListEvent {
  const factory ComboDealListEvent.initialize() = _Initialize;
  const factory ComboDealListEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required PriceComboDeal comboDeals,
  }) = _Fetch;
}
