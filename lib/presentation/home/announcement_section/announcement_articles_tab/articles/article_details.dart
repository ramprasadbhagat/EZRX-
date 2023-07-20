import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

class ArticleDetails extends StatefulWidget {
  final AnnouncementArticleItem article;
  const ArticleDetails({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
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
      body: ListView(
        controller: _scrollController,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: widget.article.thumbnail,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return const SizedBox.shrink();
                },
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const CircleAvatar(
                  maxRadius: 16,
                  backgroundColor: ZPColors.defaultReturnSummaryStatusColor,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: ZPColors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.article.publishedDate.getAnnouncementDateFormat,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ZPColors.extraLightGrey4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    widget.article.title,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 20),
                  ),
                ),
                const Divider(
                  color: ZPColors.accentColor,
                  indent: 0,
                  endIndent: 0,
                  height: 20,
                ),
                Html(
                  data: widget.article.content.getOrDefaultValue(''),
                ),
              ],
            ),
          ),
        ],
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
