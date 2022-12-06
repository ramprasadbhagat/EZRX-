import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key, required this.onPressed}) : super(key: key);
  final Function(Locale locale) onPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
      title: const Text('Please select a language').tr(),
      actions: <Widget>[
        PlatformDialogAction(
          key: const Key('englishLanguageTile'),
          child: Text(const Locale('en', 'SG').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'en',
            countryCode: 'SG',
          ),
        ),
        PlatformDialogAction(
          key: const Key('thaiLanguageTile'),
          child: Text(const Locale('th', 'TH').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'th',
            countryCode: 'TH',
          ),
        ),
        PlatformDialogAction(
          key: const Key('mandarinLanguageTile'),
          child: Text(const Locale('zh', 'TW').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'zh',
            countryCode: 'TW',
          ),
        ),
        PlatformDialogAction(
          key: const Key('burmeseLanguageTile'),
          child: Text(const Locale('my', 'MY').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'my',
            countryCode: 'MY',
          ),
        ),
        PlatformDialogAction(
          key: const Key('vietnameseLanguageTile'),
          child: Text(const Locale('vi', 'VN').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'vi',
            countryCode: 'VN',
          ),
        ),
        PlatformDialogAction(
          key: const Key('khmerLanguageTile'),
          child: Text(const Locale('km', 'KH').languageString()),
          onPressed: () => _returnCurrentLocale(
            languageCode: 'km',
            countryCode: 'KH',
          ),
        ),
      ],
    );
  }

  void _returnCurrentLocale({
    required String languageCode,
    String? countryCode,
  }) {
    final locale = Locale(languageCode, countryCode);
    onPressed(locale);
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
}
