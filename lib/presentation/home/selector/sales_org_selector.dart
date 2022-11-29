import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SalesOrgSelector extends StatelessWidget {
  const SalesOrgSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgBloc = context.read<SalesOrgBloc>();
    final cartBloc = context.read<CartBloc>();

    return CustomSelector(
      key: const Key('salesOrgSelect'),
      title: 'Sales Org',
      child: BlocConsumer<SalesOrgBloc, SalesOrgState>(
        listenWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation ||
            previous.salesOrgFailureOrSuccessOption !=
                current.salesOrgFailureOrSuccessOption ||
            previous.configs != current.configs,
        listener: (context, state) {
          state.salesOrgFailureOrSuccessOption.fold(
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

                if (state.haveSelectedSalesOrganisation) {
                  _callBannerAndDocType(context, state, false);
                }
              },
              (_) {},
            ),
          );
          if (state.haveSelectedSalesOrganisation &&
              state.configs != SalesOrganisationConfigs.empty()) {
            _callBannerAndDocType(context, state, true);
          }
        },
        buildWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation,
        builder: (context, state) {
          return state.salesOrganisation == SalesOrganisation.empty()
              ? LoadingShimmer.tile()
              : Text(
                  state.salesOrg.fullName,
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
              previous.userSalesOrganisations != current.userSalesOrganisations,
          builder: (context, state) {
            return PlatformAlertDialog(
              title: FittedBox(
                child: const Text('Please select a Sales Org').tr(),
              ),
              actions: state.userSalesOrganisations
                  .map(
                    (e) => PlatformDialogAction(
                      key: Key('salesOrgOption${e.salesOrg.getOrCrash()}'),
                      child: Text(e.salesOrg.fullName),
                      onPressed: () {
                        if (e != salesOrgBloc.state.salesOrganisation &&
                            cartBloc.state.cartItemList.isNotEmpty) {
                          ConfirmClearDialog.show(
                            context: context,
                            title: 'Change sales organization'.tr(),
                            description:
                                'The progress on your cart is going to be lost. Do you want to proceed?'
                                    .tr(),
                            onCancel: () {
                              context.router.pop();
                            },
                            onConfirmed: () {
                              cartBloc.add(const CartEvent.clearCart());
                              context.router.popUntilRouteWithName(
                                HomeNavigationTabbarRoute.name,
                              );
                              salesOrgBloc.add(
                                SalesOrgEvent.selected(
                                  salesOrganisation: e,
                                ),
                              );
                            },
                          );
                        } else {
                          context.router.popUntilRouteWithName(
                            HomeNavigationTabbarRoute.name,
                          );
                          salesOrgBloc.add(
                            SalesOrgEvent.selected(
                              salesOrganisation: e,
                            ),
                          );
                        }
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

  void _callBannerAndDocType(
      BuildContext context, SalesOrgState state, bool fetchCustomer,) {
    context.read<BannerBloc>().add(
          BannerEvent.fetch(
            isPreSalesOrg: false,
            salesOrganisation: state.salesOrganisation,
          ),
        );
    context.read<OrderDocumentTypeBloc>().add(
          OrderDocumentTypeEvent.fetch(
            salesOrganisation: state.salesOrganisation,
          ),
        );

    if (fetchCustomer) {
      context.read<CustomerCodeBloc>().add(
            CustomerCodeEvent.fetch(
              hidecustomer: state.hideCustomer,
              selectedSalesOrg: state.salesOrganisation,
              isRefresh: true,
              userInfo: context.read<UserBloc>().state.user,
            ),
          );
    }
  }
}
