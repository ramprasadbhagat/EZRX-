import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String? initialFile;
  final String titleText;
  const WebViewPage({
    Key? key,
    this.url = '',
    this.initialFile,
    this.titleText = '',
  }) : super(key: key);

  @override
  State<WebViewPage> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  bool errorLoadingUrl = false;

  late InAppWebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: widget.titleText.isEmpty,
        title: widget.titleText.isNotEmpty
            ? Text(widget.titleText.tr())
            : SvgPicture.asset(
                'assets/svg/ezrx+logo.svg',
                height: 30,
                fit: BoxFit.scaleDown,
              ),
      ),
      body: SafeArea(
        child: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: errorLoadingUrl
              ? Center(
                  key: const ValueKey('errorLoadingUrl'),
                  child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Image.asset(
                      'assets/images/error.png',
                    ),
                  ),
                )
              : Stack(
                  key: WidgetKeys.webview,
                  children: <Widget>[
                    InAppWebView(
                      initialFile: widget.initialFile,
                      initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                      initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          mediaPlaybackRequiresUserGesture: false,
                        ),
                      ),
                      onWebViewCreated:
                          (InAppWebViewController webViewController) {
                        controller = webViewController;
                      },
                      onLoadStart: ((controller, url) {
                        setState(() {
                          isLoading = true;
                          errorLoadingUrl = false;
                        });
                        isLoading = true;
                      }),
                      onLoadStop: (controller, url) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                      onLoadHttpError: (
                        InAppWebViewController controller,
                        Uri? url,
                        int i,
                        String s,
                      ) async {
                        setState(() {
                          errorLoadingUrl = true;
                        });
                      },
                      androidOnPermissionRequest: (
                        InAppWebViewController controller,
                        String origin,
                        List<String> resources,
                      ) async {
                        return PermissionRequestResponse(
                          resources: resources,
                          action: PermissionRequestResponseAction.GRANT,
                        );
                      },
                    ),
                    isLoading
                        ? Align(
                            alignment: Alignment.center,
                            child: LoadingAnimationWidget.discreteCircle(
                              key: WidgetKeys.loader,
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
      ),
    );
  }
}
