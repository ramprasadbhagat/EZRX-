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
bool isAdminRole(String roleType) {
  switch (roleType) {
    case 'root_admin':
    case 'zp_admin':
      return true;
    default:
      return false;
  }
}

String userType(String roleType) {
  switch (roleType) {
    case 'internal_sales_rep':
    case 'external_sales_rep':
      return 'salesRep';
    default:
      return 'client';
  }
}

String orderType(String roleType) {
  switch (roleType) {
    case 'internal_sales_rep':
      return 'MRXR';
    case 'external_sales_rep':
      return 'MRXP';
    default:
      return 'MRXC';
  }
}

// Is Acceptable Use Policy Audience
bool isAupAudience(String roleType) {
  switch (roleType) {
    case 'internal_sales_rep':
    case 'external_sales_rep':
    case 'root_admin':
    case 'zp_admin':
      return true;
    default:
      return false;
  }
}

// Is TERMS OF USE Audience
bool isTcAudience(String roleType) {
  switch (roleType) {
    case 'client_admin':
    case 'client_user':
    case 'user':
      return true;
    default:
      return false;
  }
}

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
