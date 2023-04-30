import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/application/returns/returns_overview/returns_overview_bloc.dart';
import 'package:universal_io/io.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/application/returns/return_request_type_code/return_request_type_code_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/application/returns/user_restriction/user_restriction_list_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (_checkIfRefreshIsNeeded()) {
          context.read<AuthBloc>().add(const AuthEvent.init());
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _initializeTimestamp();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void _initializeTimestamp() => dateTime = DateTime.now();

  bool _checkIfRefreshIsNeeded() =>
      dateTime.difference(DateTime.now()).inMinutes >= 30;

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
              authenticated: (authState) {
                context.read<AnnouncementBloc>().add(
                      const AnnouncementEvent.getAnnouncement(),
                    );
                context.read<UserBloc>().add(const UserEvent.fetch());
                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    HomeNavigationTabbarRoute(),
                  ],
                );
              },
              unauthenticated: (unauthState) {
                locator<MixpanelService>().resetSuperProps();
                context.read<AnnouncementBloc>().add(
                      const AnnouncementEvent.getAnnouncement(),
                    );
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
              context.read<UserBloc>().state.userCanCreateOrder &&
              (previous.isCovidMaterialEnable !=
                      current.isCovidMaterialEnable ||
                  previous.salesOrgConfigs.disableBundles !=
                      current.salesOrgConfigs.disableBundles ||
                  previous.isOrderTypeEnable != current.isOrderTypeEnable ||
                  previous.customerCodeInfo != current.customerCodeInfo ||
                  previous.shipToInfo != current.shipToInfo),
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
            if (!state.salesOrgConfigs.disableBundles) {
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
            } else {
              context
                  .read<OrderDocumentTypeBloc>()
                  .add(const OrderDocumentTypeEvent.initialized());
              context.read<OrderDocumentTypeBloc>().add(
                    OrderDocumentTypeEvent.selectedOrderType(
                      isReasonSelected: false,
                      selectedOrderType: OrderDocumentType.defaultSelected(
                        salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
                      ),
                    ),
                  );
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              current.salesOrganisation.salesOrg.isValid() &&
              (previous.salesOrganisation.salesOrg !=
                      current.salesOrganisation.salesOrg ||
                  previous.isReturnsEnable != current.isReturnsEnable ||
                  previous.user.role.type.hasReturnsAdminAccess !=
                      current.user.role.type.hasReturnsAdminAccess),
          listener: (context, state) {
            final enableReturn =
                locator<RemoteConfigService>().getReturnsConfig() &&
                    state.isReturnsEnable;

            if (!enableReturn) return;

            if (state.user.role.type.isReturnApproverAccount) {
              context.read<ReturnApproverBloc>().add(
                    ReturnApproverEvent.fetch(
                      user: state.user,
                      approverReturnFilter: context
                          .read<ReturnApproverFilterBloc>()
                          .state
                          .approverReturnFilter,
                    ),
                  );
            }

            context.read<UsageCodeBloc>().add(
                  UsageCodeEvent.fetch(
                    salesOrg: state.salesOrganisation.salesOrg,
                  ),
                );

            context.read<ReturnRequestTypeCodeBloc>().add(
                  ReturnRequestTypeCodeEvent.fetch(
                    salesOrganisation: state.salesOrganisation,
                  ),
                );

            if (!state.user.role.type.hasReturnsAdminAccess) return;

            context.read<UserRestrictionListBloc>().add(
                  UserRestrictionListEvent.fetch(
                    salesOrg: state.salesOrganisation.salesOrg,
                  ),
                );
            // Policy Configuration fetch event
            context.read<PolicyConfigurationBloc>().add(
                  PolicyConfigurationEvent.fetch(
                    salesOrganisation: state.salesOrganisation,
                    searchKey: '',
                  ),
                );
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          listener: (context, state) {
            context.read<CartBloc>().add(
                  CartEvent.fetch(
                    doNotAllowOutOfStockMaterials:
                        state.doNotAllowOutOfStockMaterials,
                    customerCodeInfo: state.customerCodeInfo,
                    salesOrganisationConfigs: state.salesOrgConfigs,
                    salesOrganisation: state.salesOrganisation,
                    shipToInfo: state.shipToInfo,
                    comboDealEligible: state.comboDealEligible,
                    isSpecialOrderType: context
                        .read<OrderDocumentTypeBloc>()
                        .state
                        .isSpecialOrderType,
                  ),
                );

            final enableReturn =
                locator<RemoteConfigService>().getReturnsConfig() &&
                    state.isReturnsEnable;

            if (enableReturn) {
              context.read<ReturnsOverviewBloc>().add(
                    ReturnsOverviewEvent.fetch(
                      salesOrganisation: state.salesOrganisation,
                      user: state.user,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                    ),
                  );
            }
          },
        ),
        BlocListener<OrderDocumentTypeBloc, OrderDocumentTypeState>(
          listenWhen: (previous, current) =>
              context.read<UserBloc>().state.isNotEmpty &&
              context.read<UserBloc>().state.userCanCreateOrder &&
              previous.selectedOrderType != current.selectedOrderType &&
              current.selectedOrderType != OrderDocumentType.empty() &&
              context.read<SalesOrgBloc>().state.salesOrganisation !=
                  SalesOrganisation.empty(),
          listener: (context, state) {
            context.read<MaterialFilterBloc>().add(
                  MaterialFilterEvent.fetch(
                    user: context.read<UserBloc>().state.user,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    pickAndPack: context
                        .read<EligibilityBloc>()
                        .state
                        .getPNPValueMaterial,
                  ),
                );
            context.read<EligibilityBloc>().add(
                  EligibilityEvent.update(
                    user: context.read<UserBloc>().state.user,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    selectedOrderType: state.selectedOrderType,
                  ),
                );
            context.read<MaterialListBloc>().add(
                  MaterialListEvent.fetch(
                    user: context.read<UserBloc>().state.user,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    selectedMaterialFilter: context
                        .read<MaterialFilterBloc>()
                        .state
                        .getEmptyMaterialFilter(),
                    orderDocumentType: state.selectedOrderType,
                    pickAndPack: context
                        .read<EligibilityBloc>()
                        .state
                        .getPNPValueMaterial,
                  ),
                );
          },
        ),
      ],
      child: locator<Config>().appFlavor == Flavor.mock
          ? const _Splash()
          : UpgradeAlert(
              upgrader: Upgrader(
                messages: UpgraderLocalizationMessage(),
                dialogStyle: Platform.isIOS
                    ? UpgradeDialogStyle.cupertino
                    : UpgradeDialogStyle.material,
                debugLogging:
                    locator<Config>().appFlavor == Flavor.prod ? false : true,
                minAppVersion: '1.0.0',
              ),
              child: const _Splash(),
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

class _Splash extends StatelessWidget {
  const _Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ZPColors.white,
      body: Image.asset(
        'assets/images/splash.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
