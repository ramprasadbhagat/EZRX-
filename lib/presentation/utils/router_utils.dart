import 'package:ezrxmobile/domain/core/value/value_transformers.dart';

class RouterUtils {
  String routePatternMatcher =
      r'^(?:main\/|material_root\/)?([\w-]+\/)?([\w-]+)$';

  String buildRouteTrackingName(String name) {
    final regex = RegExp(routePatternMatcher);

    final match = regex.firstMatch(name);

    var words = match?.group(2)?.split('_') ?? [];
    words = words.map((word) => stringCapitalize(word)).toList();

    return '${words.join(' ')} Page';
  }
}
