part of 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';

class _WhyUsSection extends StatelessWidget {
  final ContentSplitTemplate whyUs;
  const _WhyUsSection({
    Key? key,
    required this.whyUs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: WidgetKeys.aboutUsWhyUsSection,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            whyUs.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            whyUs.subTitle,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 5),
          Html(data: whyUs.description),
        ],
      ),
    );
  }
}
