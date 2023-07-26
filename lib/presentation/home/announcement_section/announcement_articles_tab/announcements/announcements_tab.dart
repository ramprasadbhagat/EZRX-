import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsTab extends StatelessWidget {
  const AnnouncementsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.announcementListPageKey,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<AnnouncementInfoBloc, AnnouncementInfoState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading ||
              previous.announcementInfo.announcementList !=
                  current.announcementInfo.announcementList,
          builder: (context, state) {
            return state.isLoading &&
                    state.announcementInfo.announcementList.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: ScrollList<AnnouncementArticleItem>(
                      noRecordFoundWidget:
                          const NoRecordFound(title: 'No Announcement found'),
                      controller: ScrollController(),
                      onRefresh: () => context.read<AnnouncementInfoBloc>().add(
                            AnnouncementInfoEvent.fetch(
                              salesOrg:
                                  context.read<SalesOrgBloc>().state.salesOrg,
                            ),
                          ),
                      onLoadingMore: () =>
                          context.read<AnnouncementInfoBloc>().add(
                                AnnouncementInfoEvent.loadMore(
                                  salesOrg: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrg,
                                ),
                              ),
                      isLoading: state.isLoading,
                      itemBuilder: (context, index, item) => GestureDetector(
                        child: _AnnouncementItem(item: item),
                        onTap: () {
                          context.read<AnnouncementInfoDetailsBloc>().add(
                                AnnouncementInfoDetailsEvent.fetch(
                                  itemId: item.id,
                                  salesOrg: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .salesOrg,
                                ),
                              );
                          context.router.pushNamed('announcement_info_details');
                        },
                      ),
                      items: state.announcementInfo.announcementList,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class _AnnouncementItem extends StatelessWidget {
  final AnnouncementArticleItem item;
  const _AnnouncementItem({
    Key? key,
    required this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: false,
      showShadow: true,
      child: ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.publishedDate.getAnnouncementDateFormatWithTime,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.neutralsGrey1,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: const BoxDecoration(
                    color: ZPColors.skyBlueColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    'New'.tr(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.whiteBgCard,
                        ),
                  ),
                ),
              ],
            ),
            Text(
              item.title,
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
