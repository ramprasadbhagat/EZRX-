import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSuspendedBanner extends StatelessWidget {
  const AccountSuspendedBanner({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isAccountSuspended != current.isAccountSuspended,
      builder: (context, state) {
        return state.isAccountSuspended
            ? SizedBox(
                height: 38,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Customer is suspended, please contact ZP Admin for support',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
