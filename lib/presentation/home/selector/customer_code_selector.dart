import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerCodeSelector extends StatelessWidget {
  const CustomerCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCodeBloc, CustomerCodeState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption ||
          previous.customeCodeInfo != current.customeCodeInfo,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
            },
            (_) {
              context.read<AuthBloc>().add(const AuthEvent.authCheck());
            },
          ),
        );

        final defaultShipToInfo = state.defaultShipToInfo;
        if (defaultShipToInfo != null) {
          context.read<ShipToCodeBloc>().add(
                ShipToCodeEvent.selected(
                  shipToInfo: defaultShipToInfo,
                ),
              );
        } else {
          context
              .read<ShipToCodeBloc>()
              .add(const ShipToCodeEvent.initialized());
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return CustomSelector(
          key: const Key('customerCodeSelect'),
          title: 'Customer Code',
          onTap: state.isFetching
              ? null
              : () => context.router.pushNamed('customer_search_page'),
          child: state.isFetching
              ? LoadingShimmer.tile()
              : Text(
                  state.apiFailureOrSuccessOption.isNone()
                      ? state.customeCodeInfo.customerCodeSoldTo
                      : 'No Customer',
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                ).tr(),
        );
      },
    );
  }
}
