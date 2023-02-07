import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/language_picker.dart';
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
        builder: (_) => LanguagePicker(
          onPressed: (Locale locale) {
            locator<CountlyService>().addCountlyEvent(
              'Language changed',
              segmentation: {
                'fromLanguage': context.locale.languageCode,
                'toLanguage': locale.languageCode,
              },
            );
            context.setLocale(locale);
            context.router.pop();
          },
        ),
      ),
    );
  }
}
