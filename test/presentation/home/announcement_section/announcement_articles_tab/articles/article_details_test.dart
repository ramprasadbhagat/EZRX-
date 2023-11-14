import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/article_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../../../utils/widget_utils.dart';

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late AnnouncementArticleItem mockArticleItem;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    autoRouterMock = locator<AppRouter>();
    mockArticleItem = (await ArticleInfoLocalDataSource().getArticles())
        .announcementList
        .first;
  });

  Widget getArticleDetailsPage({required AnnouncementArticleItem article}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      child: ArticleDetails(article: article),
    );
  }

  group('Article Detail Page => ', () {
    testWidgets(
      'Page load with data',
      (tester) async {
        await tester
            .pumpWidget(getArticleDetailsPage(article: mockArticleItem));
        final articleDetailsPage = find.byKey(WidgetKeys.articleDetailsPageKey);
        expect(articleDetailsPage, findsOneWidget);
      },
    );

    testWidgets(
      'Page load with Invalid Image',
      (tester) async {
        final articleItemInvalidImage = mockArticleItem.copyWith(
          thumbnail: 'invalid_image',
        );
        await tester.pumpWidget(
          getArticleDetailsPage(article: articleItemInvalidImage),
        );
        final articleDetailsPage = find.byKey(WidgetKeys.articleDetailsPageKey);
        expect(articleDetailsPage, findsOneWidget);
        final BuildContext context = tester.element(articleDetailsPage);
        tester
            .widget<CachedNetworkImage>(find.byType(CachedNetworkImage))
            .errorWidget
            ?.call(context, articleItemInvalidImage.thumbnail, '');
      },
    );

    testWidgets(
      'Page load scroll down then floating upward arrow button clicked',
      (tester) async {
        final content = mockArticleItem.content.value.getOrElse(() => '');
        final articleItemWithContent = mockArticleItem.copyWith(
          content: HtmlContent(content * 10),
        );
        await tester
            .pumpWidget(getArticleDetailsPage(article: articleItemWithContent));
        final articleDetailsPage = find.byKey(WidgetKeys.articleDetailsPageKey);
        expect(articleDetailsPage, findsOneWidget);
        await tester.dragFrom(const Offset(100, 500), const Offset(100, -10));
        await tester.pump(const Duration(seconds: 4));
        final scrollToTopArrowIcon =
            find.byKey(WidgetKeys.materialDetailsFloatingButton);
        final htmlBodyFinder = find.byType(Html);
        expect(htmlBodyFinder, findsOneWidget);
        await tester.drag(
          htmlBodyFinder,
          const Offset(0, -1000),
          warnIfMissed: false,
        );
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        expect(scrollToTopArrowIcon, findsOneWidget);
        await tester.tap(scrollToTopArrowIcon);
      },
    );

    testWidgets(
      'Page load and scroll down bottom back button clicked',
      (tester) async {
        final content = mockArticleItem.content.value.getOrElse(() => '');
        final articleItemWithContent = mockArticleItem.copyWith(
          content: HtmlContent(content * 10),
        );
        await tester
            .pumpWidget(getArticleDetailsPage(article: articleItemWithContent));
        final articleDetailsPage = find.byKey(WidgetKeys.articleDetailsPageKey);
        expect(articleDetailsPage, findsOneWidget);
        await tester.dragFrom(const Offset(100, 400), const Offset(100, -221));
        await tester.pump(const Duration(seconds: 4));
        final backButton =
            find.byKey(WidgetKeys.articleDetailsBottomBackButtonKey);
        expect(backButton, findsOneWidget);
        await tester.tap(backButton);
      },
    );

    testWidgets(
      'Page load and back button clicked',
      (tester) async {
        await tester
            .pumpWidget(getArticleDetailsPage(article: mockArticleItem));
        final articleDetailsPage = find.byKey(WidgetKeys.articleDetailsPageKey);
        expect(articleDetailsPage, findsOneWidget);
        final backButton = find.byKey(WidgetKeys.articleDetailsBackButtonKey);
        expect(backButton, findsOneWidget);
        await tester.ensureVisible(backButton);
        await tester.tap(backButton);
      },
    );
  });
}
