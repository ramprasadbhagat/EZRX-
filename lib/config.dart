enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;

  String get baseUrl {
    switch (appFlavor) {
      case Flavor.mock:
      case Flavor.dev:
        return 'http://127.0.0.1:7091';
      case Flavor.uat:
        return 'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com';
      case Flavor.prod:
      default:
        return 'https://ezrx.com';
    }
  }

  String get appName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'eZRx Mock';
      case Flavor.dev:
        return 'eZRx Dev';
      case Flavor.uat:
        return 'eZRx Uat';
      case Flavor.prod:
      default:
        return 'eZRx';
    }
  }

  String get packageName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'com.zuelligpharma.ezrxmobile.mock';
      case Flavor.dev:
        return 'com.zuelligpharma.ezrxmobile.dev';
      case Flavor.uat:
        return 'com.zuelligpharma.ezrxmobile.uat';
      case Flavor.prod:
      default:
        return 'com.zuelligpharma.ezrxmobile';
    }
  }

  Map<String, dynamic> get oktaConfig {
    switch (appFlavor) {
      case Flavor.mock:
      case Flavor.dev:
      case Flavor.uat:
        return {
          'client_id': '0oa402ex52DFKp74y1d7',
          'redirect_uri': 'com.oktapreview.zuellig:/callback',
          'end_session_redirect_uri': 'com.oktapreview.zuellig:/',
          'discovery_uri': 'https://zuellig.oktapreview.com/',
          'scopes': ['openid', 'profile', 'offline_access']
        };
      case Flavor.prod:
      default:
        return {
          'client_id': '0oa5urfw6s1OLENaX5d7',
          'redirect_uri': 'com.zuelligpharma.ezlogin:/callback',
          'end_session_redirect_uri': 'com.zuelligpharma.ezlogin:/',
          'discovery_uri': 'https://ezlogin.zuelligpharma.com/',
          'scopes': ['openid', 'profile', 'offline_access']
        };
    }
  }
}
