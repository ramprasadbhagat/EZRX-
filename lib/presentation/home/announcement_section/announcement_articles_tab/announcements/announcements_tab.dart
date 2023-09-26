import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';

class AnnouncementsTab extends StatefulWidget {
  const AnnouncementsTab({Key? key}) : super(key: key);

  @override
  State<AnnouncementsTab> createState() => _AnnouncementsTabState();
}

class _AnnouncementsTabState extends State<AnnouncementsTab> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

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
              previous.searchedAnnouncementList !=
                  current.searchedAnnouncementList,
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
                      noRecordFoundWidget: const NoRecordFound(
                        key: WidgetKeys.announcementNotFoundRecordKey,
                        title: 'No Announcement found',
                      ),
                      controller: _scrollController,
                      onRefresh: () => context.read<AnnouncementInfoBloc>().add(
                            AnnouncementInfoEvent.fetch(
                              salesOrg: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrg,
                            ),
                          ),
                      onLoadingMore: () =>
                          context.read<AnnouncementInfoBloc>().add(
                                AnnouncementInfoEvent.loadMore(
                                  salesOrg: context
                                      .read<EligibilityBloc>()
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
                                      .read<EligibilityBloc>()
                                      .state
                                      .salesOrg,
                                ),
                              );
                          context.router.pushNamed('announcement_info_details');
                        },
                      ),
                      items: state.searchedAnnouncementList,
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: !_isScrollAtInitialPosition
          ? FloatingActionButton(
              key: WidgetKeys.scrollToTopArrowIcon,
              onPressed: () => _scrollToTop(),
              mini: true,
              backgroundColor: ZPColors.secondaryMustard,
              child: const Icon(
                Icons.expand_less,
                color: ZPColors.black,
              ),
            )
          : const SizedBox.shrink(),
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
      key: WidgetKeys.genericKey(key: item.id),
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
                    item.publishedDate.dateOrDashString,
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
                    context.tr('New'),
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
