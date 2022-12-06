import 'dart:core';

Contact salesOrgContact(String salesOrg) {
  switch (salesOrg) {
    case '2001':
      return Contact(
        instruction: 'Toll Free 1800 88 3711(Press 2)',
        phoneNumbers: ['1800883711'],
      );
    case '2200':
    case '2201':
    case '2203':
    case '2250':
      return Contact(
        instruction: '',
        phoneNumbers: ['+9519345524', '+959797207000'],
      );
    case '2500':
      return Contact(
        instruction:
            'Telephone Number: +632 8236-6488\nFax number: +63 2 822-6979',
        phoneNumbers: ['+63282366488'],
      );
    case '2501':
      return Contact(
        instruction:
            '(02) 84241228 (Manila Line)\n(049) 5598120 (Laguna Line)\nMobile: 09190560455',
        phoneNumbers: ['0284241228', '0495598120', '09190560455'],
      );
    case '2601':
      return Contact(
        instruction: '',
        phoneNumbers: ['+6565483190'],
      );
    case '2800':
    case '2801':
    case '2802':
    case '2803':
    case '2804':
    case '2805':
      return Contact(
        instruction: '',
        phoneNumbers: ['0809090887'],
      );
    case '2900':
    case '2902':
      return Contact(
        instruction: '',
        phoneNumbers: ['+6621231000', '1800500000'],
      );
    case '3070':
    case '3000':
    case '3001':
    case '3050':
    case '3072':
    case '3090':
      return Contact(
        instruction:
            'Số điện thoại miễn cước 1800 5555 58 và bấm số 3 để được hỗ trợ',
        phoneNumbers: ['1800555558'],
      );
    default:
      return Contact.empty();
  }
}

String salesOrgEmail(String value) {
  final contactEmailMap = {
    '2001': 'myezrx@zuelligpharma.com',
    '2200': 'Zinkohtay@zuelligpharma.com',
    '2201': 'Zinkohtay@zuelligpharma.com',
    '2203': 'Zinkohtay@zuelligpharma.com',
    '2250': 'Zinkohtay@zuelligpharma.com',
    '2500': 'PHZPCallCenter@zuelligpharma.com',
    '2501': 'customerservice@metrodrug.com.ph',
    '2601': 'SGZPSCallCenterMailbox@zuelligpharma.com',
    '2800': 'ezrx4u@zuelligpharma.com',
    '2801': 'ezrx4u@zuelligpharma.com',
    '2802': 'ezrx4u@zuelligpharma.com',
    '2803': 'ezrx4u@zuelligpharma.com',
    '2804': 'ezrx4u@zuelligpharma.com',
    '2805': 'ezrx4u@zuelligpharma.com',
    '2900': 'ZPTH-CS-CRC@zuelligpharma.com',
    '2902': 'ZPTH-CS-CRC@zuelligpharma.com',
    '3070': 'dat.hang@ezrx.com.vn',
    '3000': 'dat.hang@ezrx.com.vn',
    '3001': 'dat.hang@ezrx.com.vn',
    '3050': 'dat.hang@ezrx.com.vn',
    '3072': 'dat.hang@ezrx.com.vn',
    '3090': 'dat.hang@ezrx.com.vn',
  };

  return contactEmailMap[value] ?? '';
}

String salesOrgContactPerson(String value) {
  final contactPersonMap = {
    '2001': 'My eZRx Support Team',
    '2200': 'Mr Zin Ko Htay, Trade Sales Team',
    '2201': 'Mr Zin Ko Htay, Trade Sales Team',
    '2203': 'Mr Zin Ko Htay, Trade Sales Team',
    '2250': 'Mr Zin Ko Htay, Trade Sales Team',
    '2500': 'ZPC Customer Service',
    '2501': 'MDI Customer Service',
    '2601': 'SG Customer Support',
    '2800': 'eZRx Service Team',
    '2801': 'eZRx Service Team',
    '2802': 'eZRx Service Team',
    '2803': 'eZRx Service Team',
    '2804': 'eZRx Service Team',
    '2805': 'eZRx Service Team',
    '2900': 'ZP Thailand Customer Support',
    '2902': 'ZP Thailand Customer Support',
    '3070': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
    '3000': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
    '3001': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
    '3050': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
    '3072': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
    '3090': 'Ty TNHH Thương Mại và Dược Phẩm Sang',
  };

  return contactPersonMap[value] ?? '';
}

String salesOrgBuName(String salesOrg) {
  // use map insted of switch statement to reduce cyclomatic complexity
  final salesOrgBuMap = {
    '1300': 'ZPBN',
    '1500': 'ZPKH',
    '1501': 'APKH',
    '1703': 'ZPMO',
    '1700': 'ZPHK',
    '1750': 'ZPHK',
    '2001': 'ZPMY',
    '2200': 'ZPMM',
    '2201': 'ZPMM',
    '2203': 'ZPMM',
    '2250': 'ZPMM',
    '2500': 'ZPC PH',
    '2501': 'MDI PH',
    '2601': 'ZPSG',
    '2800': 'ZPTW',
    '2801': 'ZPTW',
    '2802': 'ZPTW',
    '2803': 'ZPTW',
    '2804': 'ZPTW',
    '2805': 'ZPTW',
    '2900': 'ZPTH',
    '2902': 'ZPTH',
    '3000': 'ZPVN',
    '3001': 'ZPVN',
    '3072': 'ZPVN',
    '3050': 'Phyto VN',
    '3070': 'Sang VN',
    '3090': 'Mekophar VN',
    '3101': 'ZPKR',
    '3102': 'ZPKR',
    '3150': 'ZPKR',
    '3151': 'ZPKR',
    '3152': 'ZPKR',
    '3153': 'ZPKR',
    'PH01': 'GBDI ZPC PH',
    'PH02': 'MXPS MDI PH',
  };

  return salesOrgBuMap[salesOrg] ?? 'Unknown';
}

String salesOrgCountry(String salesOrg) {
  // use map insted of switch statement to reduce cyclomatic complexity
  final salesOrgCountryMap = {
    '2001': 'MY',
    '2200': 'MM',
    '2201': 'MM',
    '2203': 'MM',
    '2250': 'MM',
    '2500': 'PH',
    '2501': 'PH',
    'PH02': 'PH',
    'PH03': 'PH',
    '2601': 'SG',
    '2800': 'TW',
    '2801': 'TW',
    '2802': 'TW',
    '2803': 'TW',
    '2804': 'TW',
    '2805': 'TW',
    '2900': 'TH',
    '2902': 'TH',
    '3000': 'VN',
    '3001': 'VN',
    '3072': 'VN',
    '3050': 'VN',
    '3070': 'VN',
    '3090': 'VN',
    '3101': 'KR',
    '3102': 'KR',
    '3150': 'KR',
    '3151': 'KR',
    '3152': 'KR',
    '3153': 'KR',
    '1500': 'KH',
  };

  return salesOrgCountryMap[salesOrg] ?? 'Unknown';
}

//  Possible role
//  'internal_sales_rep'
//  'external_sales_rep'
//  'root_admin'
//  'zp_admin'
//  'client_admin'
//  'client_user'
bool roleCanLoginOnBehalf(String roleType) {
  switch (roleType) {
    case 'root_admin':
    case 'zp_admin':
      return true;
    default:
      return false;
  }
}

String roleUserType(String roleType) {
  switch (roleType) {
    case 'internal_sales_rep':
    case 'external_sales_rep':
      return 'salesRep';
    default:
      return 'client';
  }
}

String roleOrderType(String roleType) {
  switch (roleType) {
    case 'internal_sales_rep':
      return 'MRXR';
    case 'external_sales_rep':
      return 'MRXP';
    default:
      return 'MRXC';
  }
}

bool isZero(int value) => value == 0;

String currencySymbol(String currency) {
  switch (currency) {
    case 'twd':
      return 'NT\$';
    case 'php':
      return '₱';
    case 'myr':
      return 'RM';
    case 'mmk':
      return 'K';
    case 'thb':
      return '฿';
    case 'vnd':
      return '₫';
    case 'krw':
      return '₩';
    case 'bnd':
      return 'B\$';
    case 'sgd':
    default:
      return '\$';
  }
}

String currencyCode(String currency) {
  return currency.isEmpty ? 'NA' : currency.toUpperCase();
}

String salesOrgTaxCode(String country) {
  switch (country) {
    case 'SG':
      return 'GST';
    case 'TH':
    default:
      return 'VAT';
  }
}

bool countrySupportOrderType(country) {
  switch (country) {
    case 'TH':
    case 'SG':
    case 'TW':
    case 'MY':
      return true;
    default:
      return false;
  }
}

class Contact {
  String instruction;
  List<String> phoneNumbers;
  Contact({required this.instruction, required this.phoneNumbers});
  factory Contact.empty() => Contact(instruction: '', phoneNumbers: <String>[]);
}

String checkAllOrDash(String value) {
  switch (value) {
    case '-':
    case 'all':
      return '';
    default:
      return value;
  }
}
