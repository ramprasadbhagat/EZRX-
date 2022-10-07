import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  ScrollController termsandConditionScrollController = ScrollController();
  bool termsAndConditionReadtoEnd = false; //flag to see user read all content
  int lastHighValue = 0;
  bool isLoading = false;

  void _termsAndConditionScrollListner() {
    if (termsandConditionScrollController.offset >=
            termsandConditionScrollController.position.maxScrollExtent &&
        !termsandConditionScrollController.position.outOfRange) {
      //condition if for user reached to end of content
      setState(() {
        termsAndConditionReadtoEnd = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    termsandConditionScrollController.addListener(
      _termsAndConditionScrollListner,
    ); //Listner for scroll of terms and condition
  }

  @override
  void dispose() {
    super.dispose();
    termsandConditionScrollController.removeListener(
      _termsAndConditionScrollListner,
    );
    termsandConditionScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => widget.fromSetting,
          child: Scaffold(
            appBar: AppBar(
              key: const ValueKey('auptcappBar'),
              title: Text(state.title.tr()),
              automaticallyImplyLeading: widget.fromSetting,
            ),
            body: Stack(
              children: [
                InAppWebView(
                  key: const ValueKey('auptcwebview'),
                  initialFile: state.initialFile,
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
                isLoading
                    ? const SizedBox.shrink()
                    : AcceptButton(
                        key: const ValueKey('auptcAcceptButton'),
                        fromSetting: widget.fromSetting,
                        termsAndConditionReadtoEnd: termsAndConditionReadtoEnd,
                      ),
              ],
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
    return Positioned(
      right: 10,
      bottom: 10,
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 40 / 100,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            gradient: const LinearGradient(
              colors: <Color>[
                ZPColors.primary,
                ZPColors.gradient,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Accept'.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () {
          if (!termsAndConditionReadtoEnd) {
            showSnackBar(
              context: context,
              message: 'You Need To read full Terms and Condition before Accept'
                  .tr(),
            );
          } else {
            context.read<UserBloc>().add(const UserEvent.accptTnc());
            if (fromSetting) {
              context.router.pop();
            }
          }
        },
      ),
    );
  }
}
