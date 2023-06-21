import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StaticHtmlViewer extends StatefulWidget {
  final String title;
  final String htmlPath;
  final String styleCss;
  const StaticHtmlViewer({
    Key? key,
    this.title = '',
    required this.htmlPath,
    this.styleCss = '',
  }) : super(key: key);

  @override
  State<StaticHtmlViewer> createState() => StaticHtmlViewerState();
}

class StaticHtmlViewerState extends State<StaticHtmlViewer> {
  bool isLoading = true;
  InAppWebViewController? _controller;

  @override
  void dispose() {
    _controller?.stopLoading();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title.isNotEmpty
          ? AppBar(
              title: Text(widget.title.tr()),
              centerTitle: widget.title.isEmpty,
            )
          : null,
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Stack(
          children: [
            InAppWebView(
              key: WidgetKeys.staticHtmlViewer,
              initialFile: widget.htmlPath,
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                  useWideViewPort: false,
                ),
                ios: IOSInAppWebViewOptions(
                  enableViewportScale: true,
                ),
                crossPlatform: InAppWebViewOptions(
                  preferredContentMode: UserPreferredContentMode.RECOMMENDED,
                  minimumFontSize: 14,
                  allowUniversalAccessFromFileURLs: true,
                ),
              ),
              onLoadStop: (controller, url) async {
                _controller = controller;
                if (widget.styleCss.isNotEmpty) {
                  await _controller?.evaluateJavascript(
                    source: widget.styleCss,
                  );
                }
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? Align(
                    alignment: Alignment.center,
                    child: LoadingAnimationWidget.discreteCircle(
                      color: ZPColors.primary,
                      secondRingColor: ZPColors.secondary,
                      thirdRingColor: ZPColors.orange,
                      size: 30,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
