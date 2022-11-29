import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ScrollList<T> extends StatefulWidget {
  final VoidCallback onRefresh;
  final VoidCallback? onLoadingMore;
  final bool isLoading;
  final List<T> items;
  final String emptyMessage;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  const ScrollList({
    Key? key,
    required this.onRefresh,
    required this.isLoading,
    required this.itemBuilder,
    required this.items,
    required this.emptyMessage,
    this.onLoadingMore,
  }) : super(key: key);

  @override
  State<ScrollList<T>> createState() => _ScrollListState<T>();
}

class _ScrollListState<T> extends State<ScrollList<T>> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(
      () {
        if (_controller.position.pixels >=
            _controller.position.maxScrollExtent) {
          widget.onLoadingMore?.call();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ZPColors.primary,
      onRefresh: () async => widget.onRefresh.call(),
      child: CustomScrollView(
        key: const Key('scrollList'),
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          widget.items.isEmpty && !widget.isLoading
              ? SliverFillRemaining(
                  child: NoRecordFound.showMessage(
                    message: widget.emptyMessage.tr(),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = widget.items[index];

                      return widget.itemBuilder(context, index, item);
                    },
                    childCount: widget.items.length,
                  ),
                ),
          if (widget.isLoading)
            SliverToBoxAdapter(
              key: const Key('loadIndicator'),
              child: _LoadingMoreIndicator(
                controller: _controller,
              ),
            ),
        ],
      ),
    );
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
            controller.jumpTo(controller.position.maxScrollExtent);
          },
        );

        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
