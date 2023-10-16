import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

class RouterUtils {
  static const _routePatternMatcher = r'^([\w-]+\/)?([\w-]+)$';

  static String buildRouteTrackingName(String name) {
    final regex = RegExp(_routePatternMatcher);

    final match = regex.firstMatch(name);

    var words = match?.group(2)?.split('_') ?? [];
    words = words.map((word) => stringCapitalize(word)).toList();

    return '${words.join(' ')} Page';
  }
}
