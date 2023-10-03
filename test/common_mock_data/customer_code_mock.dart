import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

// Customer code info
const _fakeBuilding = 'fakeBuilding';
const _shipToCustomerCode = '123';
const _fakeBillToCustomerCode = 'customer1234';
const _fakeCustomerCodeSoldTo = 'customer123';
final _fakeShipToInfo = ShipToInfo.empty()
    .copyWith(building: _fakeBuilding, shipToCustomerCode: _shipToCustomerCode);
final _fakeBillToInfo =
    BillToInfo.empty().copyWith(billToCustomerCode: _fakeBillToCustomerCode);

final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
  shipToInfos: [_fakeShipToInfo],
  billToInfos: [_fakeBillToInfo],
  customerCodeSoldTo: _fakeCustomerCodeSoldTo,
);
