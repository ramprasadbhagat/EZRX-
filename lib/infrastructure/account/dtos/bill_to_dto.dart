import 'package:ezrxmobile/domain/account/entities/bill_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_alt_name.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_dto.freezed.dart';
part 'bill_to_dto.g.dart';

@freezed
class BillToDto with _$BillToDto {
  const BillToDto._();
  const factory BillToDto({
    @JsonKey(name: 'billToCustomerCode') required String billToCustomerCode,
    @JsonKey(name: 'defaulBillToAddress') required bool defaulBillToAddress,
    @JsonKey(name: 'name1') required String name1,
    @JsonKey(name: 'name2') required String name2,
    @JsonKey(name: 'name3') required String name3,
    @JsonKey(name: 'name4') required String name4,
    @JsonKey(name: 'altName1') required String altName1,
    @JsonKey(name: 'altName2') required String altName2,
    @JsonKey(name: 'altName3') required String altName3,
    @JsonKey(name: 'altName4') required String altName4,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'street') required String street,
    @JsonKey(name: 'street2') required String street2,
    @JsonKey(name: 'street3') required String street3,
    @JsonKey(name: 'street4') required String street4,
    @JsonKey(name: 'street5') required String street5,
    @JsonKey(name: 'postalCode') required String postalCode,
    @JsonKey(name: 'postalCode2') required String postalCode2,
    @JsonKey(name: 'city1') required String city1,
    @JsonKey(name: 'city2') required String city2,
    @JsonKey(name: 'telephoneNumber') required String telephoneNumber,
    @JsonKey(name: 'telephoneExtension') required String telephoneExtension,
    @JsonKey(name: 'faxNumber') required String faxNumber,
    @JsonKey(name: 'faxExtension') required String faxExtension,
    @JsonKey(name: 'taxNumber') required String taxNumber,
    @JsonKey(name: 'houseNumber1') required String houseNumber1,
    @JsonKey(name: 'houseNumber2') required String houseNumber2,
    @JsonKey(name: 'building') required String building,
    @JsonKey(name: 'region') required String region,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'district') required String district,
    @JsonKey(name: 'floor') required String floor,
    @JsonKey(name: 'plant') required String plant,
    @JsonKey(name: 'roomnumber') required String roomnumber,
    @JsonKey(name: 'taxIncludedBySalesOrganization')
        required bool taxIncludedBySalesOrganization,
    @JsonKey(name: 'customerClassification')
        required String customerClassification,
    @JsonKey(name: 'customerLocalGroup') required String customerLocalGroup,
    @JsonKey(name: 'emailAddresses') required List emailAddresses,
  }) = _BillToDto;

  factory BillToDto.fromDomain(BillToInfo billToInfo) {
    return BillToDto(
      billToCustomerCode: billToInfo.billToCustomerCode,
      defaulBillToAddress: billToInfo.defaulBillToAddress,
      name1: billToInfo.billToName.name1,
      name2: billToInfo.billToName.name2,
      name3: billToInfo.billToName.name3,
      name4: billToInfo.billToName.name4,
      altName1: billToInfo.billToAltName.altName1,
      altName2: billToInfo.billToAltName.altName2,
      altName3: billToInfo.billToAltName.altName3,
      altName4: billToInfo.billToAltName.altName4,
      status: billToInfo.status,
      street: billToInfo.billToAddress.street,
      street2: billToInfo.billToAddress.street2,
      street3: billToInfo.billToAddress.street3,
      street4: billToInfo.billToAddress.street4,
      street5: billToInfo.billToAddress.street5,
      postalCode: billToInfo.postalCode,
      postalCode2: billToInfo.postalCode2,
      city1: billToInfo.city1,
      city2: billToInfo.city2,
      emailAddresses: billToInfo.emailAddresses,
      telephoneNumber: billToInfo.telephoneNumber,
      telephoneExtension: billToInfo.telephoneExtension,
      faxNumber: billToInfo.faxNumber,
      faxExtension: billToInfo.faxExtension,
      taxNumber: billToInfo.taxNumber,
      houseNumber1: billToInfo.houseNumber1,
      houseNumber2: billToInfo.houseNumber2,
      building: billToInfo.building,
      country: billToInfo.country,
      district: billToInfo.district,
      region: billToInfo.region,
      floor: billToInfo.floor,
      plant: billToInfo.plant,
      roomnumber: billToInfo.roomnumber,
      taxIncludedBySalesOrganization: billToInfo.taxIncludedBySalesOrganization,
      customerClassification: billToInfo.customerClassification,
      customerLocalGroup: billToInfo.customerLocalGroup,
    );
  }

  BillToInfo toDomain() {
    return BillToInfo(
      billToCustomerCode: billToCustomerCode,
      defaulBillToAddress: defaulBillToAddress,
      billToName: BillToName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      billToAltName: BillToAltName(
        altName1: altName1,
        altName2: altName2,
        altName3: altName3,
        altName4: altName4,
      ),
      status: status,
      billToAddress: BillToAddress(
        street: street,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
        city1: city1,
        city2: city2,
      ),
      country: country,
      district: district,
      postalCode: postalCode,
      postalCode2: postalCode2,
      city1: city1,
      city2: city2,
      emailAddresses: emailAddresses,
      telephoneNumber: telephoneNumber,
      telephoneExtension: telephoneExtension,
      faxNumber: faxNumber,
      faxExtension: faxExtension,
      taxNumber: taxNumber,
      houseNumber1: houseNumber1,
      houseNumber2: houseNumber2,
      building: building,
      region: region,
      floor: floor,
      plant: plant,
      roomnumber: roomnumber,
      taxIncludedBySalesOrganization: taxIncludedBySalesOrganization,
      customerClassification: customerClassification,
      customerLocalGroup: customerLocalGroup,
    );
  }

  factory BillToDto.fromJson(Map<String, dynamic> json) =>
      _$BillToDtoFromJson(json);
}
