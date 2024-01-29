part of 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';

class _AnnouncementInfoTitleSection extends StatelessWidget {
  const _AnnouncementInfoTitleSection({
    Key? key,
    required this.details,
  }) : super(key: key);

  final AnnouncementInfoDetails details;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      details.releaseDate.dateTimeOrDashString,
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.neutralsGrey1,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                  if (details.tag.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(6),
                      margin:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                      decoration: BoxDecoration(
                        color: ZPColors.paleBlueGray,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        details.tag,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            if (details.publishedDate.aWeekDifference)
              const NewAnnouncementIcon(),
          ],
        ),
        const Divider(
          indent: 0,
          thickness: 1,
          height: 5,
          endIndent: 0,
          color: ZPColors.extraLightGrey3,
        ),
      ],
    );
  }
}
