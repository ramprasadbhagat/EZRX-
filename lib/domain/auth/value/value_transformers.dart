import 'dart:convert';

import 'package:ezrxmobile/domain/account/value/value_objects.dart';

Map<String, dynamic> getJWTPayload(String token) {
  final splitToken = token.split('.'); // Split the token by '.'
  if (splitToken.length != 3) {
    throw const FormatException('Invalid token');
  }
  try {
    final payloadBase64 = splitToken[1]; // Payload is always the index 1
    // Base64 should be multiple of 4. Normalize the payload before decode it
    final normalizedPayload = base64.normalize(payloadBase64);
    // Decode payload, the result is a String
    final payloadString = utf8.decode(base64.decode(normalizedPayload));
    // Parse the String to a Map<String, dynamic>
    
    return jsonDecode(payloadString);
  } catch (error) {
    throw const FormatException('Invalid payload');
  }
}

/// Returns token expiration date
DateTime getJWTExpirationDate(String token) {
  if (token.isEmpty) return DateTime.now();
  final decodedToken = getJWTPayload(token);

  return DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['exp'].toInt()),
  );
}

/// Returns token issuing date (iat)
Duration getJWTTime(String token) {
  if (token.isEmpty) return const Duration();
  final decodedToken = getJWTPayload(token);
  final issuedAtDate = DateTime.fromMillisecondsSinceEpoch(0).add(
    Duration(seconds: decodedToken['iat']),
  );

  return DateTime.now().difference(issuedAtDate);
}

/// Returns remaining time until expiry date.
Duration getJWTRemainingTime(String token) {
  if (token.isEmpty) return const Duration();
  final expirationDate = getJWTExpirationDate(token);

  return expirationDate.difference(DateTime.now());
}

String getJwtUserId(String token) {
  if (token.isEmpty) return '';
  final decodedToken = getJWTPayload(token);

  return decodedToken['id'].toString();
}

/// Tells whether a token is expired.
bool isJWTExpired(String token) {
  if (token.isEmpty) return true;
  final expirationDate = getJWTExpirationDate(token);

  return DateTime.now().isAfter(expirationDate);
}

List getJWTSalesOrg(String token) {
  if (token.isEmpty) [];
  final payload = getJWTPayload(token);

  return payload['salesOrgs'];
}

RoleName getJWTRoleName(String token) {
  if (token.isEmpty) [];
  final payload = getJWTPayload(token);

  return RoleName(payload['role']);
}

String getMarketName(String marketDomain) {
  final marketNameMap = {
    'hk': 'Hong Kong',
    'kh': 'Cambodia',
    'kr': 'Korea',
    'mm': 'Myanmar',
    'ph': 'Philippines',
    'sg': 'Singapore',
    'th': 'Thailand',
    'tw': 'Taiwan',
    'vn': 'Vietnam',
    'my': 'Malaysia',
  };

  return marketNameMap[marketDomain] ?? 'Malaysia';
}