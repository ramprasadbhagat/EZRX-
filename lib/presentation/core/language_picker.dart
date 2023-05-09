import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key, required this.onPressed}) : super(key: key);
  final Function(Locale locale) onPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      key: const Key('languagePicker'),
      title: const Text('Please select a language').tr(),
      actions: <Widget>[
        PlatformDialogAction(
          key: const Key('englishLanguageTile'),
          child: Text(const Locale('en').languageString()),
          onPressed: () => onPressed(const Locale('en')),
        ),
        PlatformDialogAction(
          key: const Key('thaiLanguageTile'),
          child: Text(const Locale('th').languageString()),
          onPressed: () => onPressed(const Locale('th')),
        ),
        PlatformDialogAction(
          key: const Key('mandarinLanguageTile'),
          child: Text(const Locale('zh').languageString()),
          onPressed: () => onPressed(const Locale('zh')),
        ),
        PlatformDialogAction(
          key: const Key('burmeseLanguageTile'),
          child: Text(const Locale('my').languageString()),
          onPressed: () => onPressed(const Locale('my')),
        ),
        PlatformDialogAction(
          key: const Key('vietnameseLanguageTile'),
          child: Text(const Locale('vi').languageString()),
          onPressed: () => onPressed(const Locale('vi')),
        ),
        PlatformDialogAction(
          key: const Key('khmerLanguageTile'),
          child: Text(const Locale('km').languageString()),
          onPressed: () => onPressed(const Locale('km')),
        ),
      ],
    );
  }
}

extension LocaleExtension on Locale {
  String languageString() {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'th':
        return 'ภาษาไทย';
      case 'zh':
        return '繁體中文';
      case 'my':
        return 'ဗမာဘာသာစကား';
      case 'vi':
        return 'Tiếng Việt';
      case 'km':
        return 'ភាសាខ្មែរ';
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
      case 'en':
      default:
        return ApiLanguageCode.english;
    }
  }

  LanguageValue get languageValue => LanguageValue(apiLanguageCode());
}
