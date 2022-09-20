import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_address.freezed.dart';

@freezed
class ShipToAddress with _$ShipToAddress {
  const ShipToAddress._();

  const factory ShipToAddress({
    required String street,
    required String street2,
    required String street3,
    required String street4,
    required String street5,
  }) = _ShipToAddress;

  factory ShipToAddress.empty() => const ShipToAddress(
        street: '',
        street2: '',
        street3: '',
        street4: '',
        street5: '',
      );

  @override
  String toString() => '$street $street2 $street3 $street4 $street5';
}
