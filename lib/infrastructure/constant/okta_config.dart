const Map<String, dynamic> _dev = {
  'client_id': '0oa402ex52DFKp74y1d7',
  'redirect_uri': 'com.oktapreview.zuellig:/callback',
  'end_session_redirect_uri': 'com.oktapreview.zuellig:/',
  'discovery_uri': 'https://zuellig.oktapreview.com/',
  'scopes': ['openid', 'profile', 'offline_access']
};

const Map<String, dynamic> _prod = {};

abstract class OktaConfig {
  static const Map<String, dynamic> config = _dev;
}
