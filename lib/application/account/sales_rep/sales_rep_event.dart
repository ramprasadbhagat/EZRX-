part of 'sales_rep_bloc.dart';

@freezed
class SalesRepEvent with _$SalesRepEvent {
  const factory SalesRepEvent.initialized() = _Initialized;
  const factory SalesRepEvent.fetch() = _Fetch;
}
