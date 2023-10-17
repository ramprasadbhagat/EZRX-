import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';

part 'widgets/announcement_search.dart';
part 'articles/widgets/search_article.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: WidgetKeys.announcementsTab,
        title: Text(
          context.tr('Announcements & articles'),
        ),
        centerTitle: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                AnnouncementsTabRoute(),
                ArticlesTabRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      'Announcements',
                      'Articles',
                    ]
                        .map(
                          (e) => Tab(
                            key: WidgetKeys.announcementsArticleTabItems(
                              e.toLowerCase(),
                            ),
                            text: context.tr(e),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: context.tabsRouter.current.name ==
                                  AnnouncementsTabRoute.name
                              ? const _SearchAnnouncement()
                              : const _SearchArticle(),
                        ),
                        //TODO: Backend don't support filter yet, will revisit when filter option available from backend
                        // IconButton(
                        //   onPressed: () => {},
                        //   icon: const Icon(
                        //     Icons.tune,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
