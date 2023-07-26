import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const _AnnouncementSectionLoadingShimmer();
        } else if (state.announcementInfo.announcementList.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SectionTitle(
                title: 'Announcements',
                onTapIconButton: () =>
                    context.router.pushNamed('announcements_page'),
              ),
            ),
            _AnnouncementSectionItemScrollList(
              announcementItemList: state.announcementInfo.announcementList,
            ),
          ],
        );
      },
    );
  }
}

class _AnnouncementSectionItemScrollList extends StatelessWidget {
  final List<AnnouncementArticleItem> announcementItemList;
  const _AnnouncementSectionItemScrollList({
    Key? key,
    required this.announcementItemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemCount: announcementItemList.length,
        itemBuilder: (context, index) {
          return _AnnouncementSectionItem(
            announcementItem: announcementItemList[index],
          );
        },
      ),
    );
  }
}

class _AnnouncementSectionItem extends StatelessWidget {
  final AnnouncementArticleItem announcementItem;
  const _AnnouncementSectionItem({Key? key, required this.announcementItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AnnouncementInfoDetailsBloc>().add(
              AnnouncementInfoDetailsEvent.fetch(
                itemId: announcementItem.id,
                salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
              ),
            );
        context.router.pushNamed('announcement_info_details');
      },
      child: CustomCard(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        child: _ItemDescription(
          title: announcementItem.title,
          description: announcementItem.summary,
          publishedDate: announcementItem.publishedDate,
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  final String title;
  final String description;
  final DateTimeStringValue publishedDate;
  const _ItemDescription({
    Key? key,
    required this.title,
    required this.publishedDate,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            publishedDate.getAnnouncementDateFormat,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ZPColors.extraLightGrey4, fontSize: 10),
          ),
          Text(
            title,
            maxLines: Responsive.isMobile(context) ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      ),
    );
  }
}

class _AnnouncementSectionLoadingShimmer extends StatelessWidget {
  const _AnnouncementSectionLoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LoadingShimmer.withChild(
        child: const SizedBox(
          height: 140,
          child: CustomCard(
            child: ListTile(),
          ),
        ),
      ),
    );
  }
}
