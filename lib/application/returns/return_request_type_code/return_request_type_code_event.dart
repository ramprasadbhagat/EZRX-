part of 'return_request_type_code_bloc.dart';

@freezed
class ReturnRequestTypeCodeEvent with _$ReturnRequestTypeCodeEvent {
  const factory ReturnRequestTypeCodeEvent.initialized() = _Initialized;
  const factory ReturnRequestTypeCodeEvent.fetch({
    required SalesOrganisation salesOrganisation,
  }) = _Fetch;
}