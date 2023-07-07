import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_info.freezed.dart';

@freezed
class CustomerCodeInfo with _$CustomerCodeInfo {
  const CustomerCodeInfo._();

  const factory CustomerCodeInfo({
    required String customerCodeSoldTo,
    required CustomerName customerName,
    required CustomerAddress customerAddress,
    required Status status,
    required String division,
    required String postalCode,
    required CustomerClassification customerClassification,
    required String customerLocalGroup,
    required String paymentTermDescription,
    required List<ShipToInfo> shipToInfos,
    required List<BillToInfo> billToInfos,
    required List<EmailAddress> emailAddresses,
    required CustomerAttr7 customerAttr7,
    required CustomerGrp4 customerGrp4,
    required String region,
    required bool comboEligible,
    required List<SalesDealNumber> salesDeals,
    required PhoneNumber telephoneNumber,
    required String country,
    required String floor,
    required String houseNumber1,
  }) = _CustomerCodeInfo;

  factory CustomerCodeInfo.empty() => CustomerCodeInfo(
        customerCodeSoldTo: '',
        customerName: const CustomerName(
          name1: '',
          name2: '',
          name3: '',
          name4: '',
        ),
        customerAddress: const CustomerAddress(
          street1: '',
          street2: '',
          street3: '',
          street4: '',
          street5: '',
          city1: '',
          city2: '',
        ),
        status: Status(''),
        division: '',
        postalCode: '',
        customerClassification: CustomerClassification(''),
        customerLocalGroup: '',
        paymentTermDescription: '',
        shipToInfos: <ShipToInfo>[],
        billToInfos: <BillToInfo>[],
        customerAttr7: CustomerAttr7(''),
        customerGrp4: CustomerGrp4(''),
        region: '',
        emailAddresses: <EmailAddress>[],
        comboEligible: false,
        salesDeals: [],
        telephoneNumber: PhoneNumber(''),
        country: '',
        floor:'',
        houseNumber1:'',
      );

  bool get hasBillToInfo {

    return getBillToInfo.billToCustomerCode.isNotEmpty &&
        getBillToInfo.billToCustomerCode != customerCodeSoldTo;
  }

  String get customerEmailAddress {
    return emailAddresses.isNotEmpty
        ? emailAddresses.first.value.getOrElse(() => 'NA')
        : 'NA';
  }

  int get countWhenValid => this != CustomerCodeInfo.empty() ? 1 : 0;

  BillToInfo get getBillToInfo =>
      billToInfos.isNotEmpty ? billToInfos.first : BillToInfo.empty();

  String get fullCustomerAddress => '${customerAddress.toAddress()} $postalCode';
}
