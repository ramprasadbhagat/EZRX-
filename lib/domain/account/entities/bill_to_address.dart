import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_address.freezed.dart';

@freezed
class BillToAddress with _$BillToAddress {
  const BillToAddress._();

  const factory BillToAddress({
    required String street,
    required String street2,
    required String street3,
    required String street4,
    required String street5,
  }) = _BillToAddress;

  factory BillToAddress.empty() => const BillToAddress(
    street: '',
    street2: '',
    street3: '',
    street4: '',
    street5: '',
  );

  @override
  String toString() => '$street $street2 $street3 $street4 $street5';
}
