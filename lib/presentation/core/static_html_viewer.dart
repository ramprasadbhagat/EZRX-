import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class StaticHtmlViewer extends StatelessWidget {
  final String title;
  final String htmlPath;

  const StaticHtmlViewer({
    Key? key, 
    required this.title, 
    required this.htmlPath,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.tr()),
        centerTitle: false,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: InAppWebView(
          key: WidgetKeys.staticHtmlViewer,
          initialFile: htmlPath,
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
            await _injectCss(controller);
          },
        ),
      ),
    );
  }

   Future<void> _injectCss(InAppWebViewController controller) async {
    const cssCode = '''
      var style = document.createElement('style');
      style.innerHTML = 'body { padding: 4rem !important; padding-top: 2rem !important; text-align: left !important; }';
      document.head.appendChild(style);
    ''';
    await controller.evaluateJavascript(source: cssCode);
  }
}