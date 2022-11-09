import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/bill_to_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/ship_to_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_dto.freezed.dart';
part 'customer_code_dto.g.dart';

@freezed
class CustomerCodeDto with _$CustomerCodeDto {
  const CustomerCodeDto._();
  const factory CustomerCodeDto({
    @JsonKey(name: 'customerCodeSoldTo') required String customerCodeSoldTo,
    @JsonKey(name: 'name1') required String name1,
    @JsonKey(name: 'name2') required String name2,
    @JsonKey(name: 'name3') required String name3,
    @JsonKey(name: 'name4') required String name4,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'street1') required String street1,
    @JsonKey(name: 'street2') required String street2,
    @JsonKey(name: 'street3') required String street3,
    @JsonKey(name: 'street4') required String street4,
    @JsonKey(name: 'street5') required String street5,
    @JsonKey(name: 'postalCode') required String postalCode,
    @JsonKey(name: 'customerClassification')
        required String customerClassification,
    @JsonKey(name: 'customerLocalGroup') required String customerLocalGroup,
    @JsonKey(name: 'paymentTermDescription')
        required String paymentTermDescription,
    @JsonKey(name: 'shipTo') required List<ShipToDto> shipToInfos,
    @JsonKey(name: 'billTo') required List<BillToDto> billToInfos,
    @JsonKey(name: 'customerAttr7') required String customerAttr7,
    @JsonKey(name: 'customerGrp4') required String customerGrp4,
    @JsonKey(name: 'region') required String region,
    @JsonKey(name: 'emailAddresses', defaultValue: [])
        required List<String> emailAddresses,
  }) = _CustomerCodeDto;

  factory CustomerCodeDto.fromDomain(CustomerCodeInfo customerCodeInfo) {
    return CustomerCodeDto(
      customerCodeSoldTo: customerCodeInfo.customerCodeSoldTo,
      name1: customerCodeInfo.customerName.name1,
      name2: customerCodeInfo.customerName.name2,
      name3: customerCodeInfo.customerName.name3,
      name4: customerCodeInfo.customerName.name4,
      status: customerCodeInfo.status,
      street1: customerCodeInfo.customerAddress.street1,
      street2: customerCodeInfo.customerAddress.street2,
      street3: customerCodeInfo.customerAddress.street3,
      street4: customerCodeInfo.customerAddress.street4,
      street5: customerCodeInfo.customerAddress.street5,
      postalCode: customerCodeInfo.postalCode,
      customerClassification: customerCodeInfo.customerClassification,
      customerLocalGroup: customerCodeInfo.customerLocalGroup,
      paymentTermDescription: customerCodeInfo.paymentTermDescription,
      shipToInfos: customerCodeInfo.shipToInfos
          .map((e) => ShipToDto.fromDomain(e))
          .toList(),
      billToInfos: customerCodeInfo.billToInfos
          .map((e) => BillToDto.fromDomain(e))
          .toList(),
      customerAttr7: customerCodeInfo.customerAttr7.getOrCrash(),
      customerGrp4: customerCodeInfo.customerGrp4.getOrCrash(),
      region: customerCodeInfo.region,
      emailAddresses: customerCodeInfo.emailAddresses
          .map((e) => e.value.getOrElse(() => ''))
          .toList(),
    );
  }

  CustomerCodeInfo toDomain() {
    return CustomerCodeInfo(
      customerCodeSoldTo: customerCodeSoldTo,
      customerName: CustomerName(
        name1: name1,
        name2: name2,
        name3: name3,
        name4: name4,
      ),
      customerAddress: CustomerAddress(
        street1: street1,
        street2: street2,
        street3: street3,
        street4: street4,
        street5: street5,
      ),
      status: status,
      postalCode: postalCode,
      customerClassification: customerClassification,
      customerLocalGroup: customerLocalGroup,
      paymentTermDescription: paymentTermDescription,
      shipToInfos: shipToInfos.map((e) => e.toDomain()).toList(),
      billToInfos: billToInfos.map((e) => e.toDomain()).toList(),
      customerAttr7: CustomerAttr7(customerAttr7),
      customerGrp4: CustomerGrp4(customerGrp4),
      region: region,
      emailAddresses: emailAddresses.map((e) => EmailAddress(e)).toList(),
    
    );
  }

  factory CustomerCodeDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerCodeDtoFromJson(json);
}

//======================================================================
//
//======================================================================
String getFullNameAndAddress(CustomerCodeInfo customerCodeInfo) {
  return '${customerCodeInfo.customerCodeSoldTo} ${customerCodeInfo.customerName} - ${customerCodeInfo.customerAddress} - ${customerCodeInfo.postalCode}';
}
