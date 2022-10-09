import 'package:ezrxmobile/domain/account/entities/bill_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_alt_name.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_info.freezed.dart';

@freezed
class BillToInfo with _$BillToInfo {
  const BillToInfo._();

  const factory BillToInfo({
    required bool defaulBillToAddress,
    required String billToCustomerCode,
    required BillToName billToName,
    required BillToAddress billToAddress,
    required BillToAltName billToAltName,
    required List emailAddresses,
    required String taxNumber,
    required String status,
    required String country,
    required String district,
    required String building,
    required String city1,
    required String city2,
    required String postalCode,
    required String postalCode2,
    required String houseNumber1,
    required String houseNumber2,
    required String telephoneNumber,
    required String telephoneExtension,
    required String faxNumber,
    required String faxExtension,
    required String region,
    required String floor,
    required String plant,
    required String roomnumber,
    required bool taxIncludedBySalesOrganization,
    required String customerClassification,
    required String customerLocalGroup,
  }) = _BillToInfo;

  factory BillToInfo.empty() => const BillToInfo(
        defaulBillToAddress: false,
        billToCustomerCode: '',
        billToName: BillToName(
          name1: '',
          name2: '',
          name3: '',
          name4: '',
        ),
        billToAddress: BillToAddress(
          street: '',
          street2: '',
          street3: '',
          street4: '',
          street5: '',
        ),
        billToAltName: BillToAltName(
          altName1: '',
          altName2: '',
          altName3: '',
          altName4: '',
        ),
        emailAddresses: [],
        taxNumber: '',
        status: '',
        country: '',
        region: '',
        district: '',
        building: '',
        city1: '',
        city2: '',
        postalCode: '',
        postalCode2: '',
        telephoneNumber: '',
        telephoneExtension: '',
        faxNumber: '',
        faxExtension: '',
        houseNumber1: '',
        houseNumber2: '',
        floor: '',
        plant: '',
        roomnumber: '',
        taxIncludedBySalesOrganization: false,
        customerClassification: '',
        customerLocalGroup: '',
      );
}
