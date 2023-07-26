import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

import 'package:ezrxmobile/presentation/core/search_bar.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: WidgetKeys.announcementsTab,
        title: Text(
          'Announcements & articles'.tr(),
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
                            text: e.tr(),
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
                          child: SearchBar(
                            onSearchChanged: (v) {},
                            clearIconKey: WidgetKeys.clearIconKey,
                            controller: TextEditingController(),
                            onClear: () {},
                          ),
                        ),
                        IconButton(
                          onPressed: () => {},
                          icon: const Icon(
                            Icons.tune,
                          ),
                        ),
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
