import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdiUserBanner extends StatelessWidget {
  const EdiUserBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.customerCodeInfo.status != current.customerCodeInfo.status,
      builder: (context, state) {
        return state.customerCodeInfo.status.isEDI
            ? SizedBox(
              key: const Key('EdiUserBanner'),
                height: 38,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Orders for EDI Customers are disabled. Please place orders through EDI'.tr(),
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}