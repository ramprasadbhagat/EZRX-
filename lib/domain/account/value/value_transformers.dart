String salesOrgBuName(String salesOrg) {
  switch (salesOrg) {
    case '1300':
      return 'ZPBN';
    case '1500':
      return 'ZPKH';
    case '1501':
      return 'APKH';
    case '1703':
      return 'ZPMO';
    case '1700':
    case '1750':
      return 'ZPHK';
    case '2001':
      return 'ZPMY';
    case '2200':
    case '2201':
    case '2203':
    case '2250':
      return 'ZPMM';
    case '2500':
      return 'ZPC PH';
    case '2501':
      return 'MDI PH';
    case '2601':
      return 'ZPSG';
    case '2800':
    case '2801':
    case '2802':
    case '2803':
    case '2804':
    case '2805':
      return 'ZPTW';
    case '2900':
    case '2902':
      return 'ZPTH';
    case '3000':
    case '3001':
    case '3072':
      return 'ZPVN';
    case '3050':
      return 'Phyto VN';
    case '3070':
      return 'Sang VN';
    case '3090':
      return 'Mekophar VN';
    case '3101':
    case '3102':
    case '3150':
    case '3151':
    case '3152':
    case '3153':
      return 'ZPKR';
    case 'PH01':
      return 'GBDI ZPC PH';
    case 'PH02':
      return 'MXPS MDI PH';
    default:
      return 'Unknown';
  }
}

String salesOrgCountry(String salesOrg) {
  switch (salesOrg) {
    case '2001':
      return 'MY';
    case '2200':
    case '2201':
    case '2203':
    case '2250':
      return 'MM';
    case '2500':
    case '2501':
    case 'PH02':
    case 'PH03':
      return 'PH';
    case '2601':
      return 'SG';
    case '2800':
    case '2801':
    case '2802':
    case '2803':
    case '2804':
    case '2805':
      return 'TW';
    case '2900':
    case '2902':
      return 'TH';
    case '3070':
    case '3000':
    case '3001':
    case '3050':
    case '3072':
    case '3090':
      return 'VN';
    default:
      return 'Unknown';
  }
}

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
