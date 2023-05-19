part of 'bank_beneficiary_bloc.dart';

@freezed
class BankBeneficiaryEvent with _$BankBeneficiaryEvent {
  const factory BankBeneficiaryEvent.initialized() = _Initialized;
  const factory BankBeneficiaryEvent.fetch() = _Fetch;
}
