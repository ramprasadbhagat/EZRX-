import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
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
            ? Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  color: ZPColors.error.withOpacity(0.8),
                ),
                child: Text(
                  'Customer is suspended, please contact ZP Admin for support',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.white,
                      ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
