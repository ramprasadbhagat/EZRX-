enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;
  int httpSendTimeout = 150000;
  int httpConnectTimeout = 150000;
  int httpReceiveTimeout = 150000;

  String get baseUrl {
    switch (appFlavor) {
      case Flavor.mock:
        return 'http://127.0.0.1:7091';
      case Flavor.dev:
        return 'https://dev.ezrx.com';
      case Flavor.uat:
        return 'https://uat.ezrx.com';
      case Flavor.prod:
      default:
        return 'https://ezrx.com';
    }
  }

  String get urlConstants {
    switch (appFlavor) {
      case Flavor.uat: // return '/ezrxapi/api/';
      case Flavor.dev:
      case Flavor.prod:
        return '/api/';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get getPrivacyUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/privacy_policy';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getPrivacyInitialFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/eZRx-privacy_policy.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
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
          'scopes': ['openid', 'profile', 'offline_access'],
        };
      case Flavor.prod:
      default:
        return {
          'client_id': '0oa5urfw6s1OLENaX5d7',
          'redirect_uri': 'com.zuelligpharma.ezlogin:/callback',
          'end_session_redirect_uri': 'com.zuelligpharma.ezlogin:/',
          'discovery_uri': 'https://ezlogin.zuelligpharma.com/',
          'scopes': ['openid', 'profile', 'offline_access'],
        };
    }
  }

  String get getTCENUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/termsandconditions';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCENFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/eZRx-termsandConditions-en.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getTCVNUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/mobile/termsandconditionsvn';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCVNFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/termsandConditions-vn.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getTCTWUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/mobile/termsandconditionstw';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCTWFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/termsandConditions-tw.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getTCTHUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/mobile/termsandconditionsth';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCTHFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/termsandConditions-th.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getTCMMUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/mobile/termsandconditionsmm';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCMMFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/termsandConditions-mm.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getTCKHUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
        return '$baseUrl/mobile/termsandconditionskh';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String? get getTCKHFile {
    switch (appFlavor) {
      case Flavor.mock:
        return 'assets/html/termsandConditions-kh.html';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return null;
    }
  }

  String get getCountlyApiKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
        return '02990adcb274a658318737fd58e23069620df8c8';
      case Flavor.prod:
        return '2f293538f1a001f1ae2e022bd305e0eae543d394';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get getCountlyServerUrl => 'https://countly.azurefd.net';
}
