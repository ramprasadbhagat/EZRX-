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
    '1900': 'ID',
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
    'ID': 'id',
  };

  return salesOrgCountryMap[country] ?? 'en';
}

String helpAndSupportLanguageCode(String country) {
  switch (country) {
    case 'TW':
      return 'zh-TW';
    case 'ID':
      return 'id-ID';
    case 'KH':
      return 'km-KH';
    case 'KR':
      return 'ko-KR';
    case 'TH':
      return 'th-TH';
    case 'VN':
      return 'vi-VN';
    case 'MM':
      return 'my-MM';
    default:
      return salesOrgLanguageCode(country);
  }
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

String subTotalTextString(String country) {
  return country == 'ID' ? 'Subtotal (excl.tax)' : 'Subtotal with tax';
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

int getIntValue(String value) => int.tryParse(value) ?? 0;

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

String countryArticlePath(String country) {
  final salesOrgCountryMap = {
    'MY': '188B233B-B81D-4679-A70B-036F07B2F649',
    'PH': '4B59DB24-B8C4-4BAE-947E-DE73D7D5C7AB',
    'SG': 'A1102055-6945-4C9A-BD31-E8A693F48CCB',
    'ID': 'EFBA9577-4545-446E-AF2D-3397A0C9D7EB',
    'KH': '33F72ED6-AAEF-4C1A-AF92-51BFFE236821',
    'KR': 'D94CEEC3-760D-410C-AF22-9EECB628B4CB',
    'MM': 'EBF6065D-FE92-4A7B-9E31-AC54081EB239',
    'TH': '0D2B87E3-8EED-477F-BDBF-DAFF4A13F4A7',
    'TW': '8608BB54-0D3B-4EEB-9069-9C106C1CB488',
    'VN': 'E151DCDD-DF32-445E-AB3B-8D49E063C99B',
  };

  return salesOrgCountryMap[country] ?? '';
}

String countryFaqPath(String country) {
  final salesOrgCountryMap = {
    'MY': '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
    'PH': '0D1637B9-8DB1-4ADB-869C-F5EAAED85110',
    'SG': '02C19C05-556A-49E6-837E-D00EB6ACFC52',
    'ID': '066686D3-8661-4F5B-9BD6-B9921F5474F8',
    'KH': 'D4343F90-CA28-4337-9FA3-7D9C3AE1F7BB',
    'KR': '66854331-3FEF-4F0C-ACC8-8A9A49663B10',
    'MM': 'A052DF06-CFF8-49F6-B078-B31E1DB9E580',
    'TH': '0AA3EE9A-4D93-4F71-B01D-57DF09D84F9A',
    'TW': '1DD9C115-E3E7-4185-8E71-DE2071A6E6D7',
    'VN': 'D12B1FAC-5F95-4B0B-9434-42B2FEDB1776',
  };

  return salesOrgCountryMap[country] ?? '';
}

String countryAboutUsPath(String country) {
  final salesOrgCountryMap = {
    'MY': 'C6392052-7603-4BA8-AC70-66D32B1D118D',
    'PH': '86A07446-932C-42F2-87CC-45075D4597BF',
    'SG': '011B7293-5FB2-49F8-8579-2BCE530C69DA',
    'ID': 'FD4D9868-8BA3-4DB4-A538-353AE3147F80',
    'KH': '91E625B5-9168-4BE0-9EEC-D3DC8E52C6D3',
    'KR': 'E6576F86-5745-4C3E-8E34-2C93EB1141F0',
    'MM': '349D1AB9-FBB3-4F66-AD7E-8FFC08386D0B',
    'TH': '8A79BB43-E3B4-4B91-AF25-3AA3F6A02F54',
    'TW': '98B6CF21-85A3-4A2B-86A7-6444A14F30D2',
    'VN': '1219C020-C8C8-42BB-8EE9-3A747FAE9926',
  };

  return salesOrgCountryMap[country] ?? '';
}

String countryCustomerPaymentResponsePath(String country) {
  final salesOrgCountryMap = {
    'MY': 'assets/json/customerPaymentMYResponse.json',
    'PH': 'assets/json/customerPaymentPHResponse.json',
    'SG': 'assets/json/customerPaymentSGResponse.json',
    'TH': 'assets/json/customerPaymentTHResponse.json',
    'VN': 'assets/json/customerPaymentVNResponse.json',
  };

  return salesOrgCountryMap[country] ??
      'assets/json/customerPaymentMYResponse.json';
}

String countryPaymentInfoResponsePath(String country) {
  final salesOrgCountryMap = {
    'MY': 'assets/json/payResponseMY.json',
    'PH': 'assets/json/payResponsePH.json',
    'SG': 'assets/json/payResponseSG.json',
    'TH': 'assets/json/payResponseTH.json',
    'VN': 'assets/json/payResponseVN.json',
  };

  return salesOrgCountryMap[country] ?? 'assets/json/payResponseMY.json';
}

String getPaymentIdPretext(String country) {
  final salesOrgCountryMap = {
    'ID': 'PR',
  };

  return salesOrgCountryMap[country] ?? 'PA';
}

String getPaymentDateLabelText(String country) {
  final salesOrgCountryMap = {
    'ID': 'Created on',
  };

  return salesOrgCountryMap[country] ?? 'Payment date';
}

int countryCutOffTime(String country) {
  final salesOrgCountryMap = {
    'SG': 15,
  };

  return salesOrgCountryMap[country] ?? 15;
}

double countrySmallOrderThreshold(String country) {
  final salesOrgCountryMap = {
    'ID': 300000.0,
  };

  return salesOrgCountryMap[country] ?? 0;
}

num countryOrderTaxValue(String country) {
  final salesOrgCountryMap = {
    'ID': 11,
  };

  return salesOrgCountryMap[country] ?? 0;
}
