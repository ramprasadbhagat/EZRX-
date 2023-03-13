import 'package:firebase_core/firebase_core.dart';

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
      case Flavor.uat:
        return 'd39d1a5395bc4054f5d1cf296b20d80b';
      case Flavor.prod:
        return 'f401c9430963bf0091150adb1a0593e3';
      default:
        return 'f401c9430963bf0091150adb1a0593e3';
    }
  }

  String get scanditLicenseKey {
    switch (appFlavor) {
      case Flavor.mock:
        return 'AdqySx0oPgINP21WDgk1l7wXPC9aOxpmlHR9XWQzrnD/SlLMP26Qt6p9FE8QC6XEV3whcTR8veryfMf7QXsYYNhQVtiNaJptPRWL8CZs/6iuVNG1WFibGENf91aKf21vY2bP+rxu3fetBGZR1yi3fFsWixlAIrEfBAcBYy8mg7IO/2aXqe80HvwvNrJWj2P6PkQbG8+vl8xZS0H3TxtYC086RXxITy1MlMrVv37gdB7TB20Pk59gEFCbX62gakpOkXXj9FIScsA/XnE0TjzalaxXQoSUjQpS5SEmPsndznCBQzjbZM69iPfE27RSOTQ4g8MeO9fXKiNV6iLABhMILnx5w8EAJWI7Z9aReteVX+kEY+qetb0CiKBerO+HQEg9fHVefEBhXYTVGbeD7eXXQMyRzjKQEWjXxRzxi6GBkP9N1M8ApCv2z0wrG4LgOdGALQgOTwrBGe32rOv/62y+0Lrb2UGu3iyyBzfb5IT6A2q8jmteazWOMcdAwDkX73t9um2+WylBRIPPj8c3L0jsArIXla+9KUTSNCM0Zt9n05rPFeVluZ8zuZ52SYEASoCHV0OnjWgdhhZttZm1TmM/2uopxWkRJtd0I75hI1o4QA8HR4QBr2sJFc0xt0eySmvzph9hchUMxBeYYUrXOcs6AIJEKXQbQscH/P4VVe1pcUgDv3005VU+kPFloVzNO952PsezdtaiabWQeK5y+rurJJ8FuLLEiQvhqqtwby9XAQ8qZb4BLmgcS56/+h+1EKfa3/PrVHNPG8tF9ivDQ514K5j3cJqvRA6ZeJWs0WnjK7xGsUeGQjxxw9qxnaLLqQcYps8vgzSeYcQ7fw==';
      case Flavor.dev:
        return 'AYZyfQQoJ/YJOjnAD0H0qMs0m/6tPx0ygz2akKwiVqj/ctIeql0FGzwyEhK7F2JM2CZzjMZGgvtZWZBnO3kf7IY9TMRIST9qgxulK2du3shpasYsG0GoWnhwXFilbNLz+mfGGClMklrzEgqqWQx567Mug9usQJxbBBXYAIAITyd53gdzFqf2bqH6bpFtywtV9Z/gi12D/9wR+xkd5Qfq2jyg+4vGKGpC6wD/UDS1JhNJp7SwtcaHG6eScxcgeJTGxo1qqmNv+JMoot3rVMPh1/AyBX+S8Nug2zyf2bzuXGFf2wwdSFiUYxR3YseZVcF8YmJ9YnNP2wfKX0s9pk5XqBPPZjKHQq2CWjqiwJq/Yby3DFUeDc7moPfS0DlRA627PUczkye3tKiPDGRPqVvk1OBAKbJxUgW5XvEz+G237O+j8BNpEtbowbhcXkDStZKbNw4XuTOJlX1WSkLUN+Ze9EfhHJJBaaEDwg1ywUJjCS6bFKNkHZ81rtlnAso6Fz3kw6Z83r27eN6UI5dDYj51rsQzNyAnHRKNUQSiaPaKH6pmFzSgjAqqHtgAJfd8fES2qpi6g6Ec3rFHVNVuqpXWYNV1E6sYcdWJmWDm6k7SVscp3sdb2pnaOcJIA5eqZH5feqmiIDd3CBERC35HloCJR8Y12W8sbLBXMe4OqoPcwVI2ZrtkXheQ3hAbLqtg7OsxJsbZM54Nq5ScW5ktdCCBi4q35eShzk9qz6D0bvs+JepJ3xWtyS2RmcbryHDOURJDLKA4/geOIRlrd248s4bmugtdS6tbnpVCthx3Nk1IkGrEPOR4Gy3F78614He8gRevVG8CukhpOhSV';
      case Flavor.uat:
        return 'ASvCfC0oDtl3OtfyYze4rLJCQh+CPiIP+3BSQ0crfbBgSt0x1F/L5IY4qKnhEifIFzxCFtdE1BuvWx3QUy7W19dvh0OrS1zjxzzxAWtLEv1lUAqaukUJ3yUg8bdvSeiDKFoUxt9IIBNCKrs0XBzMuHsOO5fBMjFHQ1MyYd3ODA2+z0MuZ14M7b8DUGSrYjFbGGFpuzui8xbZ+7A1l93JofuXRn0Da6cVu7T/Qy1RIhPmR8lr9J/VOM2GmRf0lifogvbSLXJQs5HKsa7vyePm/7tjzwXH8ZTo3j50JbweDcQUwPmXfW8uqiZTFrhoJ0edqy3Va0oEpQpg4affFWVRgGhDAeb87f49RYENBKibPq+oqkpY99QKw0hOZc+/G0mjatGwXiTfqauoPiWbEIciFfHUWmKB7+xrwp0l9VpKF+i63xiRTKH02YUqgW4LB4dtFmXkfmzCiYtie1cnwlnM+xM2rLRWvShQkOXrYzQgj3WiBYWM4nm2p3ntXl9vsScsbs37wU+FGDEK6lFVv/clDgRl5GI1lCIJJOf+3RDBpipiCj6mzqQqCrSrCwkI35Q1i04gn89hPH7b2wa/7R2om2T9jPmtunh7kD+kaLuPzKzdP9wJ0RPqkrlMpykBle5OD+tgBeIRRnepeTrGfffVQksrv6p9t3azv9NCDeTzQYBBEgix0S7VBuNwREmI9VGTY6XKMZyMB38j4TiiGadw0Ap4g1c7joA4/UhRdUIOARehMQ6KPwcbGEnF+twy65xrBrhHPjgnXpKEDN/C5eqwt5a/iwXU00anlILW8TEc3A+AB3ihCSs067VJoUefRKSPrRJYZp+P0wxK';
      case Flavor.prod:
      default:
        return 'ASvCfC0oDtl3OtfyYze4rLJCQh+CPiIP+3BSQ0crfbBgSt0x1F/L5IY4qKnhEifIFzxCFtdE1BuvWx3QUy7W19dvh0OrS1zjxzzxAWtLEv1lUAqaukUJ3yUg8bdvSeiDKFoUxt9IIBNCKrs0XBzMuHsOO5fBMjFHQ1MyYd3ODA2+z0MuZ14M7b8DUGSrYjFbGGFpuzui8xbZ+7A1l93JofuXRn0Da6cVu7T/Qy1RIhPmR8lr9J/VOM2GmRf0lifogvbSLXJQs5HKsa7vyePm/7tjzwXH8ZTo3j50JbweDcQUwPmXfW8uqiZTFrhoJ0edqy3Va0oEpQpg4affFWVRgGhDAeb87f49RYENBKibPq+oqkpY99QKw0hOZc+/G0mjatGwXiTfqauoPiWbEIciFfHUWmKB7+xrwp0l9VpKF+i63xiRTKH02YUqgW4LB4dtFmXkfmzCiYtie1cnwlnM+xM2rLRWvShQkOXrYzQgj3WiBYWM4nm2p3ntXl9vsScsbs37wU+FGDEK6lFVv/clDgRl5GI1lCIJJOf+3RDBpipiCj6mzqQqCrSrCwkI35Q1i04gn89hPH7b2wa/7R2om2T9jPmtunh7kD+kaLuPzKzdP9wJ0RPqkrlMpykBle5OD+tgBeIRRnepeTrGfffVQksrv6p9t3azv9NCDeTzQYBBEgix0S7VBuNwREmI9VGTY6XKMZyMB38j4TiiGadw0Ap4g1c7joA4/UhRdUIOARehMQ6KPwcbGEnF+twy65xrBrhHPjgnXpKEDN/C5eqwt5a/iwXU00anlILW8TEc3A+AB3ihCSs067VJoUefRKSPrRJYZp+P0wxK';
    }
  }
}
