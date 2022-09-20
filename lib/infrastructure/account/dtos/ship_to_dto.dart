import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_dto.freezed.dart';
part 'ship_to_dto.g.dart';

@freezed
class ShipToDto with _$ShipToDto {
  const ShipToDto._();
  const factory ShipToDto({
    @JsonKey(name: 'shipToCustomerCode') required String shipToCustomerCode,
    @JsonKey(name: 'defaultShipToAddress') required bool defaultShipToAddress,
    @JsonKey(name: 'name1') required String name1,
    @JsonKey(name: 'name2') required String name2,
    @JsonKey(name: 'name3') required String name3,
    @JsonKey(name: 'name4') required String name4,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'street') required String street,
    @JsonKey(name: 'street2') required String street2,
    @JsonKey(name: 'street3') required String street3,
    @JsonKey(name: 'street4') required String street4,
    @JsonKey(name: 'street5') required String street5,
    @JsonKey(name: 'postalCode') required String postalCode,
    @JsonKey(name: 'city1') required String city1,
    @JsonKey(name: 'city2') required String city2,
    @JsonKey(name: 'telephoneNumber') required String telephoneNumber,
    @JsonKey(name: 'houseNumber1') required String houseNumber1,
    @JsonKey(name: 'building') required String building,
    @JsonKey(name: 'region') required String region,
    @JsonKey(name: 'floor') required String floor,
    @JsonKey(name: 'plant') required String plant,
  }) = _ShipToDto;

  factory ShipToDto.fromDomain(ShipToInfo shipToInfo) {
    return ShipToDto(
      shipToCustomerCode: shipToInfo.shipToCustomerCode,
      defaultShipToAddress: shipToInfo.defaultShipToAddress,
      name1: shipToInfo.shipToName.name1,
      name2: shipToInfo.shipToName.name2,
      name3: shipToInfo.shipToName.name3,
      name4: shipToInfo.shipToName.name4,
      status: shipToInfo.status,
      street: shipToInfo.shipToAddress.street,
      street2: shipToInfo.shipToAddress.street2,
      street3: shipToInfo.shipToAddress.street3,
      street4: shipToInfo.shipToAddress.street4,
      street5: shipToInfo.shipToAddress.street5,
      postalCode: shipToInfo.postalCode,
      city1: shipToInfo.city1,
      city2: shipToInfo.city2,
      telephoneNumber: shipToInfo.telephoneNumber,
      houseNumber1: shipToInfo.houseNumber1,
      building: shipToInfo.building,
      region: shipToInfo.region,
      floor: shipToInfo.floor,
      plant: shipToInfo.plant,
    );
  }

  ShipToInfo toDomain() {
    return ShipToInfo(
      shipToCustomerCode: shipToCustomerCode,
      defaultShipToAddress: defaultShipToAddress,
      shipToName: ShipToName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      status: status,
      shipToAddress: ShipToAddress(
        street: street,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
      ),
      postalCode: postalCode,
      city1: city1,
      city2: city2,
      telephoneNumber: telephoneNumber,
      houseNumber1: houseNumber1,
      building: building,
      region: region,
      floor: floor,
      plant: plant,
    );
  }



  factory ShipToDto.fromJson(Map<String, dynamic> json) =>
      _$ShipToDtoFromJson(json);
}