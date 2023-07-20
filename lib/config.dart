import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scandit_flutter_datacapture_barcode/scandit_flutter_datacapture_barcode.dart';

enum Flavor { mock, dev, uat, prod }

class Config {
  Flavor appFlavor = Flavor.prod;
  int httpSendTimeout = 150000;
  int httpConnectTimeout = 150000;
  int httpReceiveTimeout = 150000;
  Duration dateRangePickerDuration = const Duration(days: 1095);

  String baseUrl({AppMarket? currentMarket}) {
    final marketDomain = currentMarket?.getOrDefaultValue('my');
    switch (appFlavor) {
      case Flavor.prod:
        return '$schema$marketDomain.ezrx.com$urlConstants';
      case Flavor.mock:
      case Flavor.dev:
      case Flavor.uat:
      default:
        return '$schema$env-$marketDomain.ezrx.com';
    }
  }

  String get env {
    switch (appFlavor) {
      case Flavor.mock:
        return 'mock';
      case Flavor.dev:
        return 'dev';
      case Flavor.uat:
        return 'uat';
      case Flavor.prod:
        return 'prod';
      default:
        return '';
    }
  }

  String get schema {
    switch (appFlavor) {
      case Flavor.mock:
        return 'http://';
      case Flavor.dev:
      case Flavor.uat:
      case Flavor.prod:
      default:
        return 'https://';
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

  String get appName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'eZRx+ Mock';
      case Flavor.dev:
        return 'eZRx+ Dev';
      case Flavor.uat:
        return 'eZRx+ Uat';
      case Flavor.prod:
      default:
        return 'eZRx+';
    }
  }

  String get packageName {
    switch (appFlavor) {
      case Flavor.mock:
        return 'com.zuelligpharma.ezrxplus.mock';
      case Flavor.dev:
        return 'com.zuelligpharma.ezrxplus.dev';
      case Flavor.uat:
        return 'com.zuelligpharma.ezrxplus.uat';
      case Flavor.prod:
      default:
        return 'com.zuelligpharma.ezrxplus';
    }
  }

  //============================================================
  //  Okta SSO login
  //
  //============================================================

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
  //============================================================
  //  Create Account Url
  //============================================================

  String get createAccountUrl =>
      'http://zpregistration.zuelligpharma.com/Registration/Index';

  //============================================================
  //  Privacy Policy
  //============================================================

  String get getPrivacyPolicyFile {
    return 'assets/html/eZRxPrivacyPolicy.html';
  }

  String get staticPrivacyPolicyFile {
    return 'assets/html/ezrx-privacy_policy_st.html';
  }

  //============================================================
  //  Term and Condition
  //============================================================
  String get getTnCFile {
    return 'assets/html/eZRxTermsOfUse.html';
  }

  String get staticTermsOfUseFile {
    return 'assets/html/ezrx-terms_of_use_st.html';
  }

  String get staticStyleCss {
    return '''
      var style = document.createElement('style');
      style.innerHTML = 'body { padding: 4rem !important; padding-top: 2rem !important; text-align: left !important; }';
      document.head.appendChild(style);
    ''';
  }
  //============================================================
  //  Firebase
  //
  //============================================================

  FirebaseOptions get firebaseOptions {
    switch (appFlavor) {
      case Flavor.mock:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:ffb59bbd88016e7cf6589b',
          measurementId: 'G-HGBQM0L9J3',
        );
      case Flavor.dev:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:b18e5cc1431e6e3df6589b',
          measurementId: 'G-Z61EE1QCHC',
        );
      case Flavor.uat:
        return const FirebaseOptions(
          apiKey: 'AIzaSyBFE83eBuDFuABL6UwbFqqXNz8S4Cw4jrQ',
          authDomain: 'ezrx-uat.firebaseapp.com',
          projectId: 'ezrx-uat',
          storageBucket: 'ezrx-uat.appspot.com',
          messagingSenderId: '289365077122',
          appId: '1:289365077122:web:7c4467b519575509f6589b',
          measurementId: 'G-9DQSS4RCFZ',
        );
      case Flavor.prod:
      default:
        return const FirebaseOptions(
          apiKey: 'AIzaSyDHfqmNqiFyVZ0u4QLREXabDqyrRQP12OY',
          authDomain: 'ezrx-6494b.firebaseapp.com',
          databaseURL: 'https://ezrx-6494b.firebaseio.com',
          projectId: 'ezrx-6494b',
          storageBucket: 'ezrx-6494b.appspot.com',
          messagingSenderId: '1064533093414',
          appId: '1:1064533093414:web:de2a644d4926f664800ae7',
          measurementId: 'G-V6D452L2G1',
        );
    }
  }

  //============================================================
  //  Mixpanel
  //
  //============================================================

  String get mixpanelKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return '54d0f06f471767440cbe387ea9b35eb6';
      case Flavor.uat:
        return '3d6a7eee1377f95ad8b24f204b112f24';
      case Flavor.prod:
      default:
        return '8b725579df59111dd76fc65f2be558f0';
    }
  }

  //============================================================
  //  Scandit
  //
  //============================================================

  String get scanditLicenseKey {
    switch (appFlavor) {
      case Flavor.dev:
      case Flavor.mock:
        return 'AYSTegE+JzRqE5r5Iw9HZI5EHqjiDUP2VW2WezNkStsUTc3D+FgP03pnEpaJdi8zomrE77VCUw8Xblq02F8SIup8WKU4Qq/0AgMkzF9G9qKOQmGOmVraPIkkbezpd66pAkfewdhTA9J7KzJvJy3HmIoeukX2KRYgbUPz3Fuug2duLItig9xVNoDlXLI8qFkAzmIeQLa28TgtAVg9dmi7Y/ptwMqPmFidO5xvIs70/ao9yKkYexphRSOixQQWNF8hmSvqp5gUup6e9YWSRINIpgtKXU+q4Rj0n+H0WiRZb8t+H6BqShg8MJv5dZ1yKLQWPOy5P2G9zQVu16hWY9mYvnl/jEXxE//nZ4CCNAumfZnJSvpEMO3NBqmR5WlKuVQYXVheVKtmduLXnuAf+8LeP9Q+BVTysZYGzOxGwgIwUTonAtLB16Zy2hwDl3GcjgJhd63MU4JGhPJWGhHKP3iZrXFcuNOup+3FP6kJv+fReRWXQIm7V5kOkvrxQiFlQFuNSwcfJ3qEg6B24nMHMExvLgaCwYohoaBcJMHxW0coaokB8KwUZsw8A8JCS8zzB8sdmBiAstR0Hkj5NlJymBDlKpbUJq2Fkbu2S79IEKmC0G2IShzz3E5L0Pw343fBKkx3wYoZ9qljgMqX9j6W5ftX7dY6u+TC74gdB8D5lWG9/LbhFUI6jlTtiyjuqaHRYDEs/YVhG8d95jqgjGCecbsUxA2Ugifsh5b4JMm+dst3qIr/4N3jIoX1oX1r+kneSmBIHHaWKAy26KDI+yNZzJmN0KfsBT9iw6Uve/IOln+VcM4jbLVeWEI09D3bM7teKyMQEoo5L+FBnfWm';
      case Flavor.prod:
        return 'ATSTcYWBEWRWFabwSBws+xhCeCR9N/xZfUlOAj1PxI4uWXe69URipfl24c2nexRovHSNnaVc85p+N1NabQohRFxmac8zb1QWgRY3qL1NhD6vTCBEV3XEMhNvt8kbcxy+/V/hoIw8zE3FJYU9XhXtrOUQRS8rG1FSkPIBJVSwgrE0Yppa5LwinnLOIKBWB7+3hp0nXr4getqGUzRY+RaTFwzQCM+RqVpobOQZ6T4e18S4HH5gd3J7J/Ryj1WBMCRAv5t6ySKpicyjp2keRVAX9+qkETZEIM6ppy8bZ85u5aNaTBhKzny8PQ/Jzg5Lx28EvOiHPtbDz7KFJCklUrJfWdNO2bnktgDnySV4lqNvP6vs3ubhD6tZtJi5C5DNaoXDBU19u7+bVgI0uvtDIlrIqvXqz2IJFsygYbwCI54OSn5abI+F2uKs7bR6nP6Zg7zctPDkM543Z+hEJOvhshQiMpeHlgA8PDitvOouqLDwVRktfF2WHPxBQ7e5IMcfWx+GSnt7+Ym3Iee7GrJZS4g0GtgB3kKeOel0/FvXZrovN1Tr/Py98EEOQFMg/XuFir2cDNsU+1PqIeyxZEUPrXuy6uhsNLSJILZQ3+Az8+4z9avY7C56AZFLEYJQTe8iXbKNPCBVYb3+Z6Na6Oj8Trv53rSl/g/AoLyWdUNybYr2q0Gw0AjzFIUsZw7x6chPmAXlHa9W5GvgFFG+NAFdHp44dDRCfPIemsBLiyypjOalcTZf9ktTTix+0qu+jjX/ZrcS2vYUnCyuYfazBMiuOb8cb12t96ft3VLRiMnud2P6oL4/YvKE9OnUa5J8mG3hsyP1K8YxVw==';
      case Flavor.uat:
      default:
        return 'ASjTPSg+DjiIAOhIPhC6BwYUhh35FdjOYkuxlBgRkVkTB1rYZnvhHcF+KXCgUqhmwE3PPLt9lKLzJOpGDTidJiNiFBWjebSEhiswiV8sNjosNQOMlns11hskDwGGSOFa33Nz/KZ6CW7RK3jcQAfAvI08jbvXM+dtsKjnhKp8j5l5zwbmLJBr8ebyQc2bt0ng24LepgJ4AFSFdwAZnBjBckONqlufHhW6bPuNquPcCG3NMC9O3nwimyJvcGpD9kBnhElf9EaGvmSKfxJlKX7F2/29amFy5WudSGEzwpUOzQrmF3aD3uoHjF+mF94FKujhUbY0d788ELRFcBQnzAi+T/YEpCjgZBrTYx0BmWWg//vPpL7Y3i3BHBqZFitgXnkWr9tCARaoa+Bn1BxOmjOzA/9PjCLM6KXUkqdv4LcZeebBKAL1A41bFvTBYBz5dt2eflnrlefavoes6fHklm0cXiUKmkKcXEf5gv35/7ac4xV/eU89crWrf9soTSSK7/e5ATYMKGZJZKJOqkeOzE6703jzNvWzPPvSEhSTsvQCMPxKgyHCZg8glgCX50s0BM9+yl+I7tp9QfXVZv6gc/che4zu304UZUOk0pzNfsyXX0FK2KEMowamjqoxwveurifUUx/YUEqLXn3F2KhAFygHM5rPODXYonLdapAR2hrGB4EpF0doXRNVDj0FqkJLO56w0Be1KehA+pkOEp+S1Af2B8pLlQPleXJfH8VNoAQBXCOOtR9WqH+XXaIQT6f/Fv93upxq54gDxgYWLNGdBjr118nyZEtfQHdFZeS/8moyMKOOFBamnvmFLH6eGxdclt+oKfMgrEHbjtqr';
    }
  }

  List<Symbology> get enabledSymbologies => [
        Symbology.code128,
        Symbology.ean13Upca,
        Symbology.ean8,
        Symbology.qr,
        Symbology.upce,
        Symbology.code39,
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

  //============================================================
  //  Payment advice logo
  //
  //============================================================

  List<String> get allowedExtensionsPaymentAdviceLogo => [
        'png',
        'jpg',
        'jpeg',
      ];

  //============================================================
  //  eZReach
  //
  //============================================================
  // https://zuelligpharma.atlassian.net/wiki/spaces/CONSUB/pages/78283852/eZReach+integration+with+eZRx
  String get targetProduct => 'EZRX+';

  String get getEZReachUrl {
    switch (appFlavor) {
      case Flavor.mock:
        return '';
      case Flavor.dev:
      case Flavor.uat:
        return 'https://campaignengine-stg.ezreach.io/query';
      case Flavor.prod:
      default:
        return 'https://campaignengine.ezreach.io/query';
    }
  }

  String get eZReachToken =>
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJc0FjdGl2ZSI6dHJ1ZSwiVXNlck5hbWUiOiJJbnRlZ3JhdGlvbiBVc2VyIiwiZW1haWwiOiJpbnRlZ3JhdGlvblVzZXJAZXpyeC5jb20iLCJleHAiOjE3NjQ2NDY3NDEsImlhdCI6MTY2OTk3Mzk0MSwicHJvdmlkZXIiOiJUZXN0IEFkbWluIiwicm9sZSI6ImN1c3RvbWVyIiwidXNlcklkIjoiNjM4NWE4NTc3MGQ5ZjFkZDU1MmFkZmFiIn0.xSjadOGP0XiC-9t2CoS0Yy6MEIbhIozi08i4vS0VQsA';

  //============================================================
  //  ChatBot
  //
  //============================================================

  String get getBotId {
    switch (appFlavor) {
      case Flavor.dev:
        return 'x1679377148926';
      case Flavor.uat:
        return 'x1679377149397';
      case Flavor.prod:
        return 'x1679377150018';
      default:
        return '-';
    }
  }

  String get getBotCustomURL => 'https://r3.cloud.yellow.ai';

  //============================================================
  //  Announcement Info
  //
  //============================================================

  String get getAnnouncementApiKey {
    switch (appFlavor) {
      case Flavor.dev:
        return 'TDFxR1Z0VlhIcjE5LzRHNHJ0MG9jNWMyUmhvUmdDdldjMS9LbzZoNnJYQT18enVlbGxpZ3BoYXI5YjM0LXpwY21zLXRlc3QtZmNmOQ==';
      case Flavor.uat:
        return 'YjdLWWNucEk1akpGNDBWdFU3VUFuaUx3Sk9MVExVMlRsUXo1Y1Y2bXpwQT18enVlbGxpZ3BoYXI0MDBmLXpwY21zLXVhdC1jZTBm';
      case Flavor.prod:
        return 'OGtnRUErUi9uZGl0cE9LV213L0tHZXh3Vjl5cjcwa1VNTGpWNk9acGprbz18enVlbGxpZ3BoYXIzYzkwLXpwY21zLXByb2QtNDUzMg==';
      case Flavor.mock:
      default:
        return '';
    }
  }

  String get announcementApiUrlPath => '/api/announcement';

  String get announcementTemplate => 'EA1748E3-EF3B-4D38-B2C9-937B90864DED';

  String get articleTemplate => 'DA48D344-04CE-411B-B721-5D1B4F807860';
}
