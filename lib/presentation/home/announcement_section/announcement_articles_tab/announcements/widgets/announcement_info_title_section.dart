part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';

class _AnnouncementInfoTitleSection extends StatelessWidget {
  const _AnnouncementInfoTitleSection({
    Key? key,
    required this.details,
  }) : super(key: key);

  final AnnouncementInfoDetails details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        details.publishedDate.dateOrDashString,
                        key: WidgetKeys.announcementDetailDateKey,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.neutralsGrey1,
                              fontSize: 10,
                            ),
                      ),
                    ),
                    if (details.title.isNotEmpty)
                      FittedBox(
                        child: Text(
                          details.title,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    if (details.sourceAndOrAuthorLabel.isNotEmpty)
                      FittedBox(
                        child: Text(
                          details.sourceAndOrAuthorLabel,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: const BoxDecoration(
                  color: ZPColors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Text(
                  'New'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.whiteBgCard,
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
