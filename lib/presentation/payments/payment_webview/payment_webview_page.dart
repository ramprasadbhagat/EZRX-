import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentWebviewPage extends StatefulWidget {
  const PaymentWebviewPage({Key? key}) : super(key: key);

  @override
  State<PaymentWebviewPage> createState() => _PaymentWebviewPageState();
}

class _PaymentWebviewPageState extends State<PaymentWebviewPage> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          key: _key,
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
          initialUrlRequest: URLRequest(
            url: Uri.dataFromString(
              context.read<NewPaymentBloc>().state.paymentInfo.zzHtmcs,
              mimeType: 'text/html',
            ),
          ),
          onLoadStart: (controller, url) async {
            final uri = await controller.getUrl();
            if (uri != null && (uri.path).contains('my-account/thankyou')) {
              if (mounted) {
                await context.router.pop(
                  uri,
                );
              }
            }
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
