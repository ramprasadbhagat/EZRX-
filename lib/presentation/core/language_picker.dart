import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension LocaleExtension on Locale {
  String languageString() {
    switch (languageCode.toLowerCase()) {
      case 'en':
        return 'English';
      case 'th':
        return 'ภาษาไทย';
      case 'zh':
        return '繁體中文';
      case 'mm':
        return 'ဗမာဘာသာစကား';
      case 'vn':
        return 'Tiếng Việt';
      case 'kh':
        return 'ភាសាខ្មែរ';
      case 'id':
        return 'Bahasa Indonesia';
      default:
        return '';
    }
  }

  String apiLanguageCode() {
    switch (languageCode) {
      case 'th':
        return ApiLanguageCode.thai;
      case 'zh':
        return ApiLanguageCode.mandarin;
      case 'my':
        return ApiLanguageCode.burmese;
      case 'vi':
        return ApiLanguageCode.vietnamese;
      case 'km':
        return ApiLanguageCode.khmer;
      case 'id':
        return ApiLanguageCode.indonesian;
      case 'en':
      default:
        return ApiLanguageCode.english;
    }
  }

  Locale get languageValue => Locale(apiLanguageCode());

  Locale get fromApiLanguageCode {
    switch (languageCode) {
      case ApiLanguageCode.thai:
        return const Locale(LanguageCode.thai);
      case ApiLanguageCode.mandarin:
        return const Locale(LanguageCode.mandarin);
      case ApiLanguageCode.burmese:
        return const Locale(LanguageCode.burmese);
      case ApiLanguageCode.vietnamese:
        return const Locale(LanguageCode.vietnamese);
      case ApiLanguageCode.khmer:
        return const Locale(LanguageCode.khmer);
      case ApiLanguageCode.indonesian:
        return const Locale(LanguageCode.indonesian);
      case ApiLanguageCode.english:
      default:
        return const Locale(LanguageCode.english);
    }
  }
}
