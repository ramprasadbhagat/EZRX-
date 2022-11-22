import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
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
          previous.customerCodeInfo != current.customerCodeInfo,
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
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {},
          ),
        );

        final salesOrgState = context.read<SalesOrgBloc>().state;
        context.read<EligibilityBloc>().add(
              EligibilityEvent.update(
                user: context.read<UserBloc>().state.user,
                salesOrganisation: salesOrgState.salesOrganisation,
                salesOrgConfigs: salesOrgState.configs,
                customerCodeInfo: state.customerCodeInfo,
              ),
            );

        final defaultShipToInfo = state.defaultShipToInfo;
        context.read<ShipToCodeBloc>().add(
              ShipToCodeEvent.load(
                shipToInfos: state.shipToInfos,
              ),
            );
        context.read<ShipToCodeBloc>().add(
              ShipToCodeEvent.loadSavedShipToCode(
                shipToInfos: state.shipToInfos,
                defaultShipToInfo: defaultShipToInfo,
              ),
            );
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
              : FittedBox(
                  child: Text(
                    state.customerCodeInfo == CustomerCodeInfo.empty()
                        ? 'NA'.tr()
                        : state.customerCodeInfo.customerCodeSoldTo,
                    style: Theme.of(context).textTheme.subtitle2?.apply(
                          color: ZPColors.primary,
                        ),
                  ).tr(),
                ),
        );
      },
    );
  }
}
