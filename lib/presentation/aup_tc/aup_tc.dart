import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AupTCDialog extends StatefulWidget {
  final bool fromSetting;

  const AupTCDialog({
    Key? key,
    this.fromSetting = false,
  }) : super(key: key);

  @override
  State<AupTCDialog> createState() => AupTCDialogState();
}

class AupTCDialogState extends State<AupTCDialog> {
  bool termsAndConditionReadtoEnd = false; //flag to see user read all content
  int lastHighValue = 0;
  bool isLoading = false;

  late InAppWebViewController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => widget.fromSetting,
          child: Scaffold(
            appBar: AppBar(
              key: const ValueKey('auptcappBar'),
              title: SvgPicture.asset(
                'assets/svg/ezrxlogo.svg',
                height: 30,
                fit: BoxFit.scaleDown,
              ),
              automaticallyImplyLeading: widget.fromSetting,
            ),
            body: AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: InAppWebView(
                key: const ValueKey('auptcwebview'),
                initialFile: state.initialFile,
                onWebViewCreated: (InAppWebViewController webViewController) {
                  controller = webViewController;
                },
                initialUrlRequest: URLRequest(url: Uri.parse(state.url)),
                onLoadStart: (controller, url) {
                  setState(
                    () {
                      isLoading = true;
                    },
                  );
                },
                onLoadStop: (controller, url) {
                  setState(() {
                    isLoading = false;
                  });
                },
                onScrollChanged: (controller, x, y) {
                  if (lastHighValue < y) {
                    setState(() {
                      lastHighValue = y;
                    });
                  }
                  if (lastHighValue > 0 && lastHighValue <= y) {
                    //condition if for user reached to end of content
                    setState(() {
                      termsAndConditionReadtoEnd = true;
                    });
                  }
                },
              ),
            ),
            bottomNavigationBar: isLoading || widget.fromSetting
                ? const SizedBox.shrink()
                : AcceptButton(
                    key: const ValueKey('auptcAcceptButton'),
                    fromSetting: widget.fromSetting,
                    termsAndConditionReadtoEnd: termsAndConditionReadtoEnd,
                  ),
          ),
        );
      },
    );
  }
}

class AcceptButton extends StatelessWidget {
  final bool fromSetting;

  const AcceptButton({
    Key? key,
    required this.termsAndConditionReadtoEnd,
    required this.fromSetting,
  }) : super(key: key);
  final bool termsAndConditionReadtoEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZPColors.systemMessageColor,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Text(
                'I acknowledge that I have read, and do hereby accept the terms of use & Regional Privacy Policy',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (!termsAndConditionReadtoEnd) {
                  showSnackBar(
                    context: context,
                    message:
                        'You Need To read full Terms and Condition before Accept'
                            .tr(),
                  );
                } else {
                  context.read<UserBloc>().add(
                        UserEvent.acceptTnc(
                          date: DateTime.now().toUtc().toIso8601String(),
                        ),
                      );
                  if (fromSetting) {
                    context.router.pop();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: termsAndConditionReadtoEnd
                    ? ZPColors.primary
                    : ZPColors.darkGray,
              ),
              child: const Text('Accept'),
            ),
          ],
        ),
      ),
    );
  }
}
