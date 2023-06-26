import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ReturnRoot extends StatelessWidget {
  const ReturnRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.returnRootPage,
      appBar: AppBar(
        title: const Text('Returns').tr(),
        centerTitle: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(currentPath: context.router.currentPath),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                ReturnByItemPageRoute(),
                ReturnByRequestPageRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      border: const Border(
                        bottom: BorderSide(
                          color: ZPColors.unselectedTabColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        'View by items',
                        'View by return request',
                      ]
                          .map(
                            (e) => Tab(
                              key: Key(
                                StringUtils.changeToCamelCase(sentence: e),
                              ),
                              text: e.tr(),
                            ),
                          )
                          .toList(),
                    ),
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
