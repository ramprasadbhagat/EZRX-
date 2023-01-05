import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/approver/approver_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration_list/policy_configuration_list_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            state.map(
              initial: (_) => _showLoadingDialog(context),
              loading: (_) => _showLoadingDialog(context),
              authenticated: (_) {
                context.read<UserBloc>().add(const UserEvent.fetch());
                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    HomeNavigationTabbarRoute(),
                  ],
                );
              },
              unauthenticated: (_) {
                context.read<UserBloc>().add(const UserEvent.initialized());
                context
                    .read<EligibilityBloc>()
                    .add(const EligibilityEvent.initialized());
                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    const LoginPageRoute(),
                  ],
                );
              },
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user.username != current.user.username &&
              current.user.username.isValid(),
          listener: (context, state) {
            final welcomeMessage =
                '${'Welcome back'.tr()}, ${state.user.username.getOrCrash()}';
            showSnackBar(context: context, message: welcomeMessage);

            context.read<ApproverBloc>().add(
                  ApproverEvent.fetch(
                    userInfo: state.user,
                  ),
                );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) => previous.user != current.user,
          listener: (context, state) {
            if (state.haveSalesOrganisation) {
              context.read<SalesOrgBloc>().add(
                    SalesOrgEvent.loadSavedOrganisation(
                      salesOrganisations: state.userSalesOrganisations,
                    ),
                  );
            } else {
              context
                  .read<SalesOrgBloc>()
                  .add(const SalesOrgEvent.initialized());
            }
            if (state.isSalesRep) {
              context.read<SalesRepBloc>().add(
                    SalesRepEvent.fetch(
                      user: state.user,
                    ),
                  );
            }
            if (state.isNotEmpty) {
              context.read<AupTcBloc>().add(
                    AupTcEvent.show(
                      state.user,
                      context.read<SalesOrgBloc>().state.salesOrg,
                    ),
                  );
              context.read<CartBloc>().add(
                    const CartEvent.initialized(),
                  );
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage,
                  );
                },
                (_) {},
              ),
            );
          },
        ),
        BlocListener<PaymentCustomerInformationBloc,
            PaymentCustomerInformationState>(
          listenWhen: (previous, current) =>
              previous.paymentCustomerInformation !=
              current.paymentCustomerInformation,
          listener: (context, paymentCustomerInformationState) {
            if (!paymentCustomerInformationState
                .isPaymentCustomerInformationEmpty) {
              context.read<PaymentTermBloc>().add(
                    PaymentTermEvent.fetch(
                      customeCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      paymentCustomerInformation:
                          paymentCustomerInformationState
                              .paymentCustomerInformation,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      salesOrganisationConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      salesRepresentativeInfo:
                          context.read<SalesRepBloc>().state.salesRepInfo,
                    ),
                  );
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.isCovidMaterialEnable != current.isCovidMaterialEnable ||
              previous.isBundleMaterialEnable !=
                  current.isBundleMaterialEnable ||
              previous.isOrderTypeEnable != current.isOrderTypeEnable ||
              previous.customerCodeInfo != current.customerCodeInfo,
          listener: (context, state) {
            if (state.isCovidMaterialEnable) {
              context.read<CovidMaterialListBloc>().add(
                    CovidMaterialListEvent.fetch(
                      user: state.user,
                      salesOrganisation: state.salesOrganisation,
                      configs: state.salesOrgConfigs,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      pickAndPack: state.getPNPValueCovidMaterial,
                    ),
                  );
            }
            if (state.isBundleMaterialEnable) {
              context.read<MaterialBundleListBloc>().add(
                    MaterialBundleListEvent.fetch(
                      user: state.user,
                      customerCode: state.customerCodeInfo,
                      shipToCode: state.shipToInfo,
                      salesOrganisation: state.salesOrganisation,
                    ),
                  );
            }
            if (state.isOrderTypeEnable) {
              context.read<OrderDocumentTypeBloc>().add(
                    OrderDocumentTypeEvent.fetch(
                      salesOrganisation: state.salesOrganisation,
                      isEDI: state.customerCodeInfo.status.isEDI,
                    ),
                  );
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.salesOrganisation.salesOrg !=
                  current.salesOrganisation.salesOrg ||
              previous.isReturnsEnable != current.isReturnsEnable ||
              previous.user.role.type.hasReturnsAdminAccess !=
                  current.user.role.type.hasReturnsAdminAccess,
          listener: (context, state) {
            final areReturnsEnabled = state.isReturnsEnable;
            final isAdmin = state.user.role.type.hasReturnsAdminAccess;

            if (!areReturnsEnabled || !isAdmin) return;

            context.read<UserRestrictionListBloc>().add(
                  UserRestrictionListEvent.fetch(
                    salesOrg: state.salesOrganisation.salesOrg,
                  ),
                );
            // Policy Configuration fetch event
            context.read<PolicyConfigurationListBloc>().add(
                  PolicyConfigurationListEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                  ),
                );
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.isReturnsEnable != current.isReturnsEnable &&
              current.isReturnsEnable,
          listener: (context, state) {
            context.read<UsageCodeBloc>().add(
                  UsageCodeEvent.fetch(
                    salesOrg: state.salesOrganisation.salesOrg,
                  ),
                );
          },
        ),
      ],
      child: UpgradeAlert(
        upgrader: Upgrader(
          messages: _UpgraderLocalizationMessage(),
          dialogStyle: Platform.isIOS
              ? UpgradeDialogStyle.cupertino
              : UpgradeDialogStyle.material,
          debugLogging:
              locator<Config>().appFlavor == Flavor.prod ? false : true,
          minAppVersion: '1.0.0',
        ),
        child: Scaffold(
          backgroundColor: ZPColors.white,
          body: Image.asset(
            'assets/images/splash.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  key: Key('splashLoadingIndicator'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UpgraderLocalizationMessage extends UpgraderMessages {
  @override
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return 'A new version of {{appName}} is available!'.tr();
      case UpgraderMessage.buttonTitleIgnore:
        return 'Ignore'.tr();
      case UpgraderMessage.buttonTitleLater:
        return 'Later'.tr();
      case UpgraderMessage.buttonTitleUpdate:
        return 'Update Now'.tr();
      case UpgraderMessage.prompt:
        return 'Want to update?'.tr();
      case UpgraderMessage.releaseNotes:
        return 'Release Notes'.tr();
      case UpgraderMessage.title:
        return 'Update App?'.tr();
      default:
        return super.message(messageKey) ?? '';
    }
  }
}
