import 'package:ezrxmobile/config.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

String addBaseUrlToImgSrc(String input) {
  final document = HtmlParser.parseHTML(input);
  final imgElements = document.querySelectorAll('img');
  for (final element in imgElements) {
    final srcAttribute = element.attributes['src'];
    if (srcAttribute != null && !srcAttribute.startsWith('http')) {
      element.attributes['src'] =
          '${GetIt.instance<Config>().announcementImageBaseUrl}${srcAttribute.replaceRange(0, 3, '')}';
    }
  }

  return document.outerHtml;
}

String constructSourceBy(String source) {
  return source.isEmpty ? '' : 'Sourced By $source';
}

String constructManufacturerBy(String manufacturer) {
  return manufacturer.isEmpty ? '' : 'By $manufacturer';
}
