import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';

// Customer code info
const _fakeBuilding = 'fakeBuilding';
const _shipToCustomerCode = '123';
const _fakeBillToCustomerCode = 'customer1234';
const _fakeCustomerCodeSoldTo = 'customer123';
final fakeShipToInfo = ShipToInfo.empty()
    .copyWith(building: _fakeBuilding, shipToCustomerCode: _shipToCustomerCode);
final _fakeBillToInfo =
    BillToInfo.empty().copyWith(billToCustomerCode: _fakeBillToCustomerCode);

final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
  shipToInfos: [fakeShipToInfo],
  billToInfos: [_fakeBillToInfo],
  customerCodeSoldTo: _fakeCustomerCodeSoldTo,
);

final fakeEmptyCustomerCodeInfo = CustomerCodeInfo.empty();
final fakeCustomerCodeInfoWithCustomerGrp4 = CustomerCodeInfo.empty().copyWith(
  customerAttr7: CustomerAttr7('ZEV'),
  customerGrp4: CustomerGrp4('VR'),
);
