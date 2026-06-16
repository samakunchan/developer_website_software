import 'dart:convert';

class JwtDecoder {
  static Map<String, dynamic>? decode(String token) {
    try {
      final List<String> parts = token.split('.');
      if (parts.length != 3) {
        return null;
      }

      final String payload = parts[1];
      final String normalized = base64Url.normalize(payload);
      final String resp = utf8.decode(base64Url.decode(normalized));
      final dynamic decoded = json.decode(resp);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      return null;
    } on Object catch (_) {
      return null;
    }
  }

  static DateTime? getExpirationDate(String token) {
    final Map<String, dynamic>? decoded = decode(token);
    if (decoded == null) {
      return null;
    }

    final dynamic exp = decoded['exp'];
    if (exp is int) {
      return DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    }
    return null;
  }
}
