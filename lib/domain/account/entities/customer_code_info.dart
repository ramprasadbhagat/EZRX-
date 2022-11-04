import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_name.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_info.freezed.dart';

@freezed
class CustomerCodeInfo with _$CustomerCodeInfo {
  const CustomerCodeInfo._();

  const factory CustomerCodeInfo({
    required String customerCodeSoldTo,
    required CustomerName customerName,
    required CustomerAddress customerAddress,
    required String status,
    required String postalCode,
    required String customerClassification,
    required String customerLocalGroup,
    required String paymentTermDescription,
    required List<ShipToInfo> shipToInfos,
    required List<BillToInfo> billToInfos,
    required CustomerAttr7 customerAttr7,
    required CustomerGrp4 customerGrp4,
    required String region,
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
        ),
        status: '',
        postalCode: '',
        customerClassification: '',
        customerLocalGroup: '',
        paymentTermDescription: '',
        shipToInfos: <ShipToInfo>[],
        billToInfos: <BillToInfo>[],
        customerAttr7: CustomerAttr7(''),
        customerGrp4: CustomerGrp4(''),
        region: '',
      );
}
