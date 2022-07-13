enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;

  String get baseUrl {
    switch (appFlavor) {
      case Flavor.mock:
      case Flavor.dev:
        return 'http://127.0.0.1:8080';
      case Flavor.uat:
        return 'https://zpprodapiportalapimgmt.apimanagement.ap1.hana.ondemand.com';
      case Flavor.prod:
      default:
        return 'https://ezrx.com';
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
          'client_id': '0oa402ex52DFKp74y1d7',
          'redirect_uri': 'com.oktapreview.zuellig:/callback',
          'end_session_redirect_uri': 'com.oktapreview.zuellig:/',
          'discovery_uri': 'https://zuellig.oktapreview.com/',
          'scopes': ['openid', 'profile', 'offline_access']
        };
    }
  }
}
