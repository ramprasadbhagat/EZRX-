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
      return '';
  }
}

bool isAdmin(String roleName) {
  switch (roleName) {
    case 'ROOT Admin':
    case 'ZP Admin':
      return true;
    default:
      return false;
  }
}
