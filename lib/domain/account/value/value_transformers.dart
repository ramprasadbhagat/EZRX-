import 'dart:core';

import 'package:ezrxmobile/domain/account/entities/bu_contact.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

BuContact salesOrgContact(String salesOrg) {
  switch (salesOrg) {
    case '2001':
      return BuContact.salesOrgContact(
        instruction: 'Toll Free 1800 88 3711(Press 2)',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['1800883711']),
      );
    case '2200':
    case '2201':
    case '2203':
    case '2250':
      return BuContact.salesOrgContact(
        instruction: '',
        phoneNumbers:
            getPhoneNumberList(phoneNumbers: ['+9519345524', '+959797207000']),
      );
    case '2500':
      return BuContact.salesOrgContact(
        instruction:
            'Telephone Number: +632 8236-6488\nFax number: +63 2 822-6979',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['+63282366488']),
      );
    case '2501':
      return BuContact.salesOrgContact(
        instruction:
            '(02) 84241228 (Manila Line)\n(049) 5598120 (Laguna Line)\nMobile: 09190560455',
        phoneNumbers: getPhoneNumberList(
          phoneNumbers: ['0284241228', '0495598120', '09190560455'],
        ),
      );
    case '2504':
      return BuContact.salesOrgContact(
        instruction: 'Telephone Number: +632 9082222 (loc 253)',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['+6329082222']),
      );
    case '2601':
      return BuContact.salesOrgContact(
        instruction: '',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['+6565483190']),
      );
    case '2800':
    case '2801':
    case '2802':
    case '2803':
    case '2804':
    case '2805':
      return BuContact.salesOrgContact(
        instruction: '',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['0809090887']),
      );
    case '2900':
    case '2902':
      return BuContact.salesOrgContact(
        instruction: '',
        phoneNumbers:
            getPhoneNumberList(phoneNumbers: ['+6621231000', '1800500000']),
      );
    case '3070':
    case '3000':
    case '3001':
    case '3050':
    case '3072':
    case '3090':
      return BuContact.salesOrgContact(
        instruction:
            'Số điện thoại miễn cước 1800 5555 58 và bấm số 3 để được hỗ trợ',
        phoneNumbers: getPhoneNumberList(phoneNumbers: ['1800555558']),
      );
    default:
      return BuContact.empty();
  }
}

List<PhoneNumber> getPhoneNumberList({required List<String> phoneNumbers}) =>
    phoneNumbers.map((e) => PhoneNumber(e)).toList();

String salesOrgEmail(String value) {
  final contactEmailMap = {
    '2001': 'myezrx@zuelligpharma.com',
    '2200': 'Zinkohtay@zuelligpharma.com',
    '2201': 'Zinkohtay@zuelligpharma.com',
    '2203': 'Zinkohtay@zuelligpharma.com',
    '2250': 'Zinkohtay@zuelligpharma.com',
    '2500': 'PHZPCallCenter@zuelligpharma.com',
    '2501': 'customerservice@metrodrug.com.ph',
    '2504': 'customerservice@interpharmasolutions.com',
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
    '2504': 'ISPI Customer Service',
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
    '2504': 'ISPI PH',
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
    '2504': 'PH',
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
    '1501': 'KH',
  };

  return salesOrgCountryMap[salesOrg] ?? 'Unknown';
}

String salesOrgLanguageCode(String country) {
  final salesOrgCountryMap = {
    'MY': 'en',
    'MM': 'my',
    'PH': 'en',
    'SG': 'en',
    'TW': 'zh',
    'TH': 'th',
    'VN': 'vi',
    'KR': 'en',
    'KH': 'km',
  };

  return salesOrgCountryMap[country] ?? 'en';
}

//  Possible role
//  'internal_sales_rep'
//  'external_sales_rep'
//  'root_admin'
//  'zp_admin'
//  'client_admin'
//  'client_user'
bool isAdmin(String roleType) {
  switch (roleType) {
    case 'root_admin':
    case 'zp_admin':
      return true;
    default:
      return false;
  }
}

String roleNameToRoleType(String roleName) {
  // use map insted of switch statement to reduce cyclomatic complexity
  final roleNameToRoleTypeMap = {
    'Public': 'public',
    'ROOT Admin': 'root_admin',
    'ZP Admin': 'zp_admin',
    'Internal Sales Rep': 'internal_sales_rep',
    'Client Admin': 'client_admin',
    'Return Requestor': 'return_requestor',
    'External Sales Rep': 'external_sales_rep',
    'Client User': 'client_user',
    'Return Admin': 'return_admin',
    'Return Approver': 'return_approver',
    'ZP Admin Attachments': 'zp_admin_attachments',
  };

  return roleNameToRoleTypeMap[roleName] ?? 'Unknown';
}

String getOrderSource(String roleType) {
  final roleNameToOrderSource = {
    'internal_sales_rep': 'EZS',
    'external_sales_rep': 'EZP',
    'zp_admin': 'DSS',
    'root_admin': 'DSS',
    'client_user': 'DSC',
    'client_admin': 'DSC',
  };

  return roleNameToOrderSource[roleType] ?? '';
}

bool roleCanLoginOnBehalfByZPAdmin(String userRoleType) {
  switch (userRoleType) {
    case 'client_admin':
    case 'client_user':
    case 'internal_sales_rep':
    case 'external_sales_rep':
      return true;
    default:
      return false;
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

String checkAllOrDash(String value) {
  switch (value) {
    case '-':
    case 'all':
      return '';
    default:
      return value;
  }
}

String removeDash(String value) {
  switch (value) {
    case '-':
      return '';
    default:
      return value;
  }
}

bool paymentAdviceEdit(String value) =>
    value.toLowerCase() == 'Data Updated Successfully'.toLowerCase();

String countryAnnouncementPath(String country) {
  final salesOrgCountryMap = {
    'MY': '947B6425-5858-4A84-9AFB-7AB3AF92530B',
    'PH': '54E151C1-17CB-4A37-BD75-CE4631B9F173',
    'SG': 'AE918C9A-67E9-407A-9772-83FE9211FB23',
    'ID': 'F57EC59A-1251-42A0-A53C-21A8BE537AD3',
    'KH': '4A5800F3-67BF-4CF0-8D63-40545183F1CF',
    'KR': 'B5AE9F0E-B3AF-4324-BDA1-2B2179650858',
    'MM': '28B03026-5384-4F96-B46E-5C0C7A5FE170',
    'TH': '2887B446-E53E-4CEF-8A52-C637578D626A',
    'TW': '78949980-128F-4B06-BD9F-9E6B2DB4A3A8',
    'VN': 'AC387D5A-A251-4994-9118-5F82818EA2AC',
  };
  
  return salesOrgCountryMap[country] ?? '';
}