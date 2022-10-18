import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SalesOrgSelector extends StatelessWidget {
  const SalesOrgSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSelector(
      key: const Key('salesOrgSelect'),
      title: 'Sales Org',
      child: BlocConsumer<SalesOrgBloc, SalesOrgState>(
        listenWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation,
        listener: (context, state) {
          if (state.haveSelectedSalesOrganisation) {
            context.read<CustomerCodeBloc>().add(
                  CustomerCodeEvent.fetch(
                    hidecustomer: state.configs.hideCustomer,
                    selectedSalesOrg: state.salesOrganisation,
                    isRefresh: true,
                    userInfo: context.read<UserBloc>().state.user,
                  ),
                );
            context.read<BannerBloc>().add(
                  BannerEvent.fetch(
                    isPreSalesOrg: false,
                    salesOrganisation: state.salesOrganisation,
                  ),
                );
          }
        },
        buildWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation,
        builder: (context, state) {
          return state.salesOrganisation == SalesOrganisation.empty()
              ? LoadingShimmer.tile()
              : Text(
                  state.salesOrganisation.salesOrg.fullName,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                );
        },
      ),
      onTap: () => showPlatformDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) =>
              previous.user.userSalesOrganisations !=
              current.user.userSalesOrganisations,
          builder: (context, state) {
            return PlatformAlertDialog(
              title: const Text('Please select a Sales Org').tr(),
              actions: state.user.userSalesOrganisations
                  .map(
                    (e) => PlatformDialogAction(
                      key: Key('salesOrgOption${e.salesOrg.getOrCrash()}'),
                      child: Text(e.salesOrg.fullName),
                      onPressed: () {
                        context.read<SalesOrgBloc>().add(
                              SalesOrgEvent.selected(salesOrganisation: e),
                            );
                        context.router.pop();
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
