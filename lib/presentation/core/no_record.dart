import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoRecordFound extends StatelessWidget {
  const NoRecordFound({
    Key? key,
    required this.title,
    this.subTitle =
        'Try adjusting your search or filter selection to find what you’re looking for.',
  }) : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/search.svg',
          key: WidgetKeys.noRecordsFoundSearchIcon,
          height: 200,
          width: 200,
        ),
        // The padding is used to create space between image, title, and the subtitle.
        Padding(
          padding:
              title.isNotEmpty ? const EdgeInsets.all(10) : EdgeInsets.zero,
          child: Text(
            title.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subTitle.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
