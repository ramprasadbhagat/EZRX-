import 'package:firebase_core/firebase_core.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';

enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;
  int httpSendTimeout = 150000;
  int httpConnectTimeout = 150000;
  int httpReceiveTimeout = 150000;

  String get targetProduct => 'EZRX';

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

  FirebaseOptions get firebaseOptions {
    switch (appFlavor) {
      case Flavor.uat:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:106ee0316ccfe49af6589b',
          measurementId: 'G-J7T2GYDSPJ',
        );
      case Flavor.dev:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:ae78e9bb951f7dfef6589b',
          measurementId: 'G-7JT826JZC2',
        );
      case Flavor.mock:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:bab71bdd2bfbb1cbf6589b',
          measurementId: 'G-Q6N13VZS21',
        );
      case Flavor.prod:
        return const FirebaseOptions(
          apiKey: 'AIzaSyChT_XgD8A5J8QLUtSRs5TKKD8NE0JjMOU',
          authDomain: 'ezrx-6494b.firebaseapp.com',
          databaseURL: 'https://ezrx-6494b.firebaseio.com',
          projectId: 'ezrx-6494b',
          storageBucket: 'ezrx-6494b.appspot.com',
          messagingSenderId: '1064533093414',
          appId: '1:1064533093414:web:08aa836641a8e189800ae7',
          measurementId: 'G-ZJDKEZ52ET',
        );
      default:
        return const FirebaseOptions(
          apiKey: 'AIzaSyChT_XgD8A5J8QLUtSRs5TKKD8NE0JjMOU',
          authDomain: 'ezrx-6494b.firebaseapp.com',
          databaseURL: 'https://ezrx-6494b.firebaseio.com',
          projectId: 'ezrx-6494b',
          storageBucket: 'ezrx-6494b.appspot.com',
          messagingSenderId: '1064533093414',
          appId: '1:1064533093414:web:08aa836641a8e189800ae7',
          measurementId: 'G-ZJDKEZ52ET',
        );
    }
  }

  String get mixpanelKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'd39d1a5395bc4054f5d1cf296b20d80b';
      case Flavor.uat:
        return '4d4594910c5642d9da48164e39ee5134';
      case Flavor.prod:
      default:
        return 'f401c9430963bf0091150adb1a0593e3';
    }
  }

  String get scanditLicenseKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'ASST7CoGDNToP6i7FjuSgIozinACPyM/kF3TEKdb7n0pZVDSgXxmb4R7XPwtTVS1kFrE5gRSCDYDW33M6H+ZV0lqAtfCZNVjdhUwxG5oR87WQElRmEBbYhZoIilvfPjOf3UjDklLIn+wFslmjAJcFzsc+5NqBtr20XE8wSxyEfVEstQedxyOc3YedC3Q0FumiToty55dQgiJcXBhKn8ElZMOX7Mdi6dXOQilGgwsb1JYutuTn/43heEoCEDsHeLuxCVc4T8bVL+nSQzLysRGg+UxNpWX0fa+PPdHQIVcq37au56bAfoXipptBnsrGtmdFWT+S2mwDIJmtV5MSQKlJ9igMJQRuRzQLIMPi0g7dsq5XO/DMcKEs608xV8s5ysFKmsPc4uPu17bglXuCi1raaaqg3flSKJPdRdvDFpTYks0l+x2M+3CxGwOzxRwRJYotWwGYU67mvHDBs0xUHuoXjbqD636VxKCNf58lHQvFZbXDHb7OJNFsuI1bHvBHjpf+J4eprmGr7VTdEu57HxU4gAmar/eMM7uTSyr9GVFR1hzref5kYNu09FmtY0rpYdvFWajtWZ+WUQjGcIPDSKO3KDGvcgx4GEdbswlVaf441Za6Xv+VBWhgJKDjhzXhXEbG9cULLXjuJE7y+2w7YUmYRMhgblVKnFrpx1H47NPo91Hinr2QnSnCsCJ3+TfxM5nC0hAEbtDgpOUkNQTD4rD6Ez2ms+fWrlAe1VxbbGmNKKMNTXzQsoRo8eysgK5wlkwGIxwNIiEPseot8WbWoG7P/bbdgPaPkDpSgXjc8Ps78yd0I7kda7I73uHz7SjVpmsowETEiYTZCPv';
      case Flavor.prod:
        return 'AUSTtoGBFfQTMaMl20PP11YKZtj3L9ayFnjFPct8Ih82XW9iSGp/+yNLK99xbRwwIGvDZC5x9XuIcH3VoHoVWG9M7sZkc9OKzBgqfMNTymHocgd7Em9xw2xiOG7IRj9uqmum6WEDUZLxNEEUMCiDQpAFkM19iZm+IFoVeQ9In3BpUlwITX1g0IlGnpA1Yp98UgMz0T2pubf7cd5AWL/f0kuak3kTlQJE3qUbh6O39hQaPi3Ba4T4JLrcFqTlIOsPHAmxlGxRDVoqRk35iM6+5eVcNbekhptb3Vn+hqM0SJovsxI6VMZ32bkmqGltd/mVs7yGQsDQOPjHqPnvwZ43j1DVPF5lH9TT/6DJOFbJVnogiyoHm/fPFGt9OhYfDpq4ypjP6FGL/iAoSLQtJInmsdMu7lf2H5hh4qQ3QUQ3cGWfPKRQLOu1MwpYvXyIgqiQhQe1k6YOH8gWZaAwdwLIbBt2fJodSfZ4jkq3ljlNztgZbG6dgrt0Llfd2aKYBtmBy6E9Ha3ALQZAb2Oeu3MRUGJrotNIgtoR5aubI999KxZFLD8/myVkR4mnEap6MdrHLML9/y0CyLQ00WcVWhfdSFZJeJRjVxyWLxq3DYkt6+nw85h7C2I5mBPmfpOJBfXPV1mxpDRRGb3TO4Oxe6iKSc2RXk5ScaBypvE0N9zrTj9/baTcIhYaogxyd3uxyTuL7Yr6jVrsAjrNFC8JigI9ItcOojds0kWmDh9bAeRTeWDnwqFLl4rdbrT5xUeLNQxxmpMXCA1A7TExO9vicGU5Tmc76eZITkFY0PJW4WG0WX/nRUOWZ7Pbo+DQElrOs5vSdk40Iw==';
      case Flavor.uat:
      default:
        return 'ATljqTQGEqeVLzVhFi2iRLMas3wxBSDyRmHVJ1USnGMpV/DOunld9NZkHqMaYc4q40SlVsNkjqCQfrOQ7G+9sHxOBxxMQEvgkil0jqZKTwaTNIzw9HOnUTxNiOuwbgcpIUatdphhV1fpC6DQqwmr+0w5vKMfRd/nJQdyfEoK1yX3zFEdnKxAFdFKFCEMK8QA5mOgTDHWhkuqIgEQF0ePt6ZwDQCxCI7+mUJ14tEVEx7z+2JIwoCJaWkfaKMocCFTboUnJQsL8QBNvjcwkY/3EdS3JamRZOG/ol62B1bYTX0RBG/hw0j0JplUSIEf7kYw57ivXvQ9CpcpdvUUtOnbs3BJBy5RDxHjLbasApJkoiH+ZoPmCvDzn9rM/8nIdNIgno/g2Po8gszLcmeCyf2RGlXG0+h07hA2Xu2foUDBqvuk8IS2fpQc+d+ES/H7yhUjmsSu1cXMxaMVsThNv+7AELVGHShQzY8/a1kwmAmHmAAvTFsqLmoAea7bAud9vsC6NPS1OinI/ehAT6WnBlB235Qrfqddd2hU34b5cSHFc4P+FUjjd6GLC0wWSWpLsE7zUMDtx6D4sKUxqGQbr/8R59ClPLRjUWVsK32YyOXWyr//rhaJ2Labeu8a2ObqniQzUB5TQMOao7OhwHBgipPjrG8xkQPVsxiAdT/tydv8jLndw6aijPA7tjzD6b9gZW6nqKZwwstG1o8tUbnYejhKnvNembr+SBJXx55INnqEXnOH44jWMWXT40asL8ZP6x8rTJYJ0Gpn/OkwXQzBHPOILo4W0H3yHbW/PNtD8rI6646e3zYSFiUpB9E92oS5FOhYX+Poh4XUAbx1';
    }
  }

  List<Symbology> get enabledSymbologies => [
        Symbology.code128,
        Symbology.ean13Upca,
        Symbology.ean8,
        Symbology.qr,
        Symbology.upce,
      ];

  List<String> get allowedExtensions => [
        'jpg',
        'pdf',
        'doc',
        'png',
        'jpeg',
        'csv',
        'pdf',
        'xlsx',
        'xls',
        'heic',
      ];

  String get getEZReachUrl {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.uat:
        return 'https://campaignengine-stg.ezreach.io/query';
      case Flavor.prod:
        return 'https://campaignengine.ezreach.io/query';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get eZReachToken =>
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJc0FjdGl2ZSI6dHJ1ZSwiVXNlck5hbWUiOiJJbnRlZ3JhdGlvbiBVc2VyIiwiZW1haWwiOiJpbnRlZ3JhdGlvblVzZXJAZXpyeC5jb20iLCJleHAiOjE3NjQ2NDY3NDEsImlhdCI6MTY2OTk3Mzk0MSwicHJvdmlkZXIiOiJUZXN0IEFkbWluIiwicm9sZSI6ImN1c3RvbWVyIiwidXNlcklkIjoiNjM4NWE4NTc3MGQ5ZjFkZDU1MmFkZmFiIn0.xSjadOGP0XiC-9t2CoS0Yy6MEIbhIozi08i4vS0VQsA';
}
