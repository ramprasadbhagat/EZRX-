import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/payment_completed_message.dart';
part 'widgets/payment_completed_please_note.dart';

class PaymentCompletedPage extends StatelessWidget {
  const PaymentCompletedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: ZPColors.white,
        title: Text(context.tr('Payment request submitted')),
        leading: IconButton(
          key: WidgetKeys.paymentAdviceCreatedPageBack,
          onPressed: () => Navigator.pop(context),
          icon: const CircleAvatar(
            maxRadius: 16,
            backgroundColor: ZPColors.transparent,
            child: Icon(
              Icons.close,
              color: ZPColors.neutralsBlack,
            ),
          ),
        ),
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              _PaymentCompletedMessage(),
              SizedBox(height: 8),
              _PaymentCompletedPleaseNote(),
            ],
          ),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: ZPColors.lightGray2,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.accountSummaryButton,
                    onPressed: () => context.router
                        .push(AccountSummaryRoute(isMarketPlace: false)),
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                ZPColors.white,
                              ),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 9.5),
                              ),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(color: ZPColors.primary),
                                ),
                              ),
                            ),
                    child: FittedBox(
                      child: Text(
                        context.tr('Account summary'),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.primary,
                                ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.paymentSummaryRouteButton,
                    onPressed: () {
                      context.router.pushNamed('payments/payment_summary');
                    },
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                ZPColors.primary,
                              ),
                              padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 9.5),
                              ),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(color: ZPColors.primary),
                                ),
                              ),
                            ),
                    child: FittedBox(
                      child: Text(
                        context.tr('Payment summary'),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.white,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
