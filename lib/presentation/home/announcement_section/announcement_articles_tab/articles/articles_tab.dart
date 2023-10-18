import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

class ArticlesTab extends StatefulWidget {
  const ArticlesTab({Key? key}) : super(key: key);

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
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
      key: WidgetKeys.articlesTab,
      body: BlocBuilder<ArticlesInfoBloc, ArticlesInfoState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return state.isFetching && state.articleInfo.announcementList.isEmpty
              ? LoadingShimmer.logo(
                  key: WidgetKeys.loaderImage,
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ScrollList<AnnouncementArticleItem>(
                    controller: _scrollController,
                    noRecordFoundWidget: const NoRecordFound(
                      key: WidgetKeys.noArticleToShowKey,
                      title: 'No articles to show',
                    ),
                    onRefresh: () {
                      context.read<ArticlesInfoBloc>().add(
                            ArticlesInfoEvent.getArticles(
                              salesOrg: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrg,
                              user: context.read<EligibilityBloc>().state.user,
                            ),
                          );
                    },
                    isLoading: state.isFetching,
                    onLoadingMore: () => context.read<ArticlesInfoBloc>().add(
                          ArticlesInfoEvent.loadMoreArticles(
                            salesOrg:
                                context.read<EligibilityBloc>().state.salesOrg,
                            user: context.read<EligibilityBloc>().state.user,
                          ),
                        ),
                    itemBuilder: (context, index, item) => _ArticlesTile(
                      key: WidgetKeys.genericKey(key: 'articleItem$index'),
                      article: item,
                    ),
                    items: state.filterAnnouncementListBySearchKey,
                  ),
                );
        },
      ),
      floatingActionButton: !_isScrollAtInitialPosition
          ? FloatingActionButton(
              key: WidgetKeys.materialDetailsFloatingButton,
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

class _ArticlesTile extends StatelessWidget {
  final AnnouncementArticleItem article;
  const _ArticlesTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: false,
      showShadow: true,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () => context.router.push(
          ArticleDetailsRoute(
            article: article,
          ),
        ),
        minVerticalPadding: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ArticleImageBox(
              key: WidgetKeys.articleImageKey,
              imageUrl: article.thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 10, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.labelSmall,
                      key: WidgetKeys.articleTitleKey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      article.publishedDate.dateTimeOrDashString,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: ZPColors.extraLightGrey4),
                      key: WidgetKeys.articleTimeKey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArticleImageBox extends StatelessWidget {
  final String imageUrl;
  const _ArticleImageBox({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      width: MediaQuery.of(context).size.width * 0.35,
      height: 88,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.fitWidth),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
