import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PaymentWebviewPage extends StatefulWidget {
  const PaymentWebviewPage({Key? key}) : super(key: key);

  @override
  State<PaymentWebviewPage> createState() => _PaymentWebviewPageState();
}

class _PaymentWebviewPageState extends State<PaymentWebviewPage> {
  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          key: WidgetKeys.paymentWebviewPage,
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              useShouldOverrideUrlLoading: true,
              javaScriptCanOpenWindowsAutomatically: true,
            ),
          ),
          initialUrlRequest: URLRequest(
            url: Uri.dataFromString(
              context.read<NewPaymentBloc>().state.customerPaymentInfo.zzHtmcs,
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
          onLoadStop: (controller, url) async {
            await controller.evaluateJavascript(
              source: ''' 
                const payNowButton = document.querySelector('button[_kpayment].pay-button');
                if (payNowButton) {
                  payNowButton.style.padding ='25px 30px';
                  payNowButton.style.fontSize='40px';
                  payNowButton.style.fontWeight = 'bold';
                  payNowButton.style.position = 'absolute';
                  payNowButton.style.display = 'flex';
                  payNowButton.style.top = '50%';
                  payNowButton.style.left = '50%';
                  payNowButton.style.transform = 'translate(-50%, -50%)';
                  payNowButton.style.width = 220
                }
              ''',
            );
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            return NavigationActionPolicy.ALLOW;
          },
          
        ),
      ),
    );
  }
}
