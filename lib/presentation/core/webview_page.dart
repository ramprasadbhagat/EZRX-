import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String? initialFile;
  const WebViewPage({Key? key, this.url = '', this.initialFile})
      : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  bool errorLoadingUrl = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/svg/ezrxlogo.svg',
          width: 80,
          height: 80,
        ),
      ),
      body: errorLoadingUrl
          ? Center(
              key: const ValueKey('errorLoadingUrl'),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
            )
          : Stack(
              key: const ValueKey('webview'),
              children: <Widget>[
                InAppWebView(
                  initialFile: widget.initialFile,
                  initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      mediaPlaybackRequiresUserGesture: false,
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {},
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
                Visibility(
                  key: const ValueKey('loader'),
                  visible: isLoading,
                  child: LoadingShimmer.logo(),
                ),
              ],
            ),
    );
  }
}
