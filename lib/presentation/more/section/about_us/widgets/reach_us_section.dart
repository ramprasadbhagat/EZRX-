part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _ReachUsSection extends StatelessWidget {
  final ContentSplitTemplate reachUs;
  const _ReachUsSection({
    Key? key,
    required this.reachUs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsReachUsSection,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reachUs.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            reachUs.subTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          Html(
            data: reachUs.description,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
