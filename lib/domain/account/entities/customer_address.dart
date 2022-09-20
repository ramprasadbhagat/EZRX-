import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_address.freezed.dart';

@freezed
class CustomerAddress with _$CustomerAddress {
  const CustomerAddress._();

  const factory CustomerAddress({
    required String street1,
    required String street2,
    required String street3,
    required String street4,
    required String street5,
  }) = _CustomerAddress;

  factory CustomerAddress.empty() => const CustomerAddress(
        street1: '',
        street2: '',
        street3: '',
        street4: '',
        street5: '',
      );

  @override
  String toString() => '$street1 $street2 $street3 $street4 $street5';
}
