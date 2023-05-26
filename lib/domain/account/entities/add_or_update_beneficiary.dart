
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_or_update_beneficiary.freezed.dart';

@freezed
class AddOrUpdateBeneficiary with _$AddOrUpdateBeneficiary {
  const AddOrUpdateBeneficiary._();
  
  const factory AddOrUpdateBeneficiary({
    required String info,
  }) = _AddOrUpdateBeneficiary;

  factory AddOrUpdateBeneficiary.empty() => const AddOrUpdateBeneficiary(
    info: '',
  );
}
