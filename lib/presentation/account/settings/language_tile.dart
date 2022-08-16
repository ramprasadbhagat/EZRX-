import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('languageTile'),
      leading: const Icon(Icons.language),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Language').tr(),
          Text(context.locale.languageString()),
        ],
      ),
      onTap: () => showPlatformDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => PlatformAlertDialog(
          title: const Text('Please select a language').tr(),
          actions: <Widget>[
            PlatformDialogAction(
              key: const Key('englishLanguageTile'),
              child: Text(const Locale('en', 'SG').languageString()),
              onPressed: () {
                context.setLocale(const Locale('en', 'SG'));
                context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: const Key('thaiLanguageTile'),
              child: Text(const Locale('th', 'TH').languageString()),
              onPressed: () {
                context.setLocale(const Locale('th', 'TH'));
                context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: const Key('mandarinLanguageTile'),
              child: Text(const Locale('zh', 'TW').languageString()),
              onPressed: () {
                context.setLocale(const Locale('zh', 'TW'));
                context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: const Key('burmeseLanguageTile'),
              child: Text(const Locale('my', 'MY').languageString()),
              onPressed: () {
                context.setLocale(const Locale('my', 'MY'));
                context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: const Key('vietnameseLanguageTile'),
              child: Text(const Locale('vi', 'VN').languageString()),
              onPressed: () {
                context.setLocale(const Locale('vi', 'VN'));
                context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: const Key('khmerLanguageTile'),
              child: Text(const Locale('km', 'KH').languageString()),
              onPressed: () {
                context.setLocale(const Locale('km', 'KH'));
                context.router.pop();
              },
            ),
          ],
        ),
      ),
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
        return '中文';
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
