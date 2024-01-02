import 'dart:async';

import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScrollableGridView<T> extends StatefulWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadingMore;
  final bool isLoading;
  final List<T> items;
  final Widget? noRecordFoundWidget;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final Widget header;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const ScrollableGridView({
    Key? key,
    required this.isLoading,
    required this.itemBuilder,
    required this.items,
    this.onRefresh,
    this.onLoadingMore,
    this.header = const SizedBox.shrink(),
    this.crossAxisSpacing = 12.0,
    this.mainAxisSpacing = 12.0,
    this.noRecordFoundWidget,
  }) : super(key: key);

  @override
  State<ScrollableGridView> createState() => _ScrollableGridViewState<T>();
}

class _ScrollableGridViewState<T> extends State<ScrollableGridView<T>> {
  final ScrollController _scrollController = ScrollController();

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
    if (!widget.isLoading &&
        _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
      widget.onLoadingMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ZPColors.primary,
      onRefresh: () async => widget.onRefresh?.call(),
      child: CustomScrollView(
        key: WidgetKeys.scrollList,
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: widget.header,
          ),
          widget.items.isEmpty && !widget.isLoading
              ? SliverToBoxAdapter(
                  child: widget.noRecordFoundWidget,
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = widget.items[index];

                      return widget.itemBuilder(context, index, item);
                    },
                    childCount: widget.items.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        Responsive.isLargerThan(context, Breakpoint.desktop)
                            ? 4
                            : 2,
                    crossAxisSpacing: widget.crossAxisSpacing,
                    mainAxisSpacing: widget.mainAxisSpacing,
                    childAspectRatio: _getResponsiveAspectRatio(context),
                  ),
                ),
          if (widget.isLoading)
            SliverToBoxAdapter(
              key: WidgetKeys.loadMoreLoader,
              child: _LoadingMoreIndicator(
                controller: _scrollController,
              ),
            ),
        ],
      ),
    );
  }

  double _getResponsiveAspectRatio(BuildContext context) {
    if (Responsive.isLargerThan(context, Breakpoint.xl)) {
      return 1 / 0.9;
    } else if (Responsive.isLargerThan(context, Breakpoint.desktop)) {
      return 1 / 1.8;
    }

    return 1 / 1.8;
  }
}

class _LoadingMoreIndicator extends StatelessWidget {
  const _LoadingMoreIndicator({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        Timer(
          const Duration(milliseconds: 50),
          () {
            if (controller.hasClients) {
              controller.jumpTo(controller.position.maxScrollExtent);
            }
          },
        );

        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: LoadingAnimationWidget.discreteCircle(
            color: ZPColors.primary,
            secondRingColor: ZPColors.secondary,
            thirdRingColor: ZPColors.orange,
            size: 30,
          ),
        );
      },
    );
  }
}
