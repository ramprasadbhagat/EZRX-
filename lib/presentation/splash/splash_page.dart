import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_filter/announcement_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_filter/articles_info_filter_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/re_order_permission/re_order_permission_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/auth/entities/reset_password_cred.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
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
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/domain/order/entities/price.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';

import 'package:ezrxmobile/presentation/orders/create_order/camera_files_permission_bottomsheet.dart';

import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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
        } else {
          context.read<NotificationBloc>().add(const NotificationEvent.fetch());
        }
        break;

      case AppLifecycleState.paused:
        _initializeTimestamp();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  void _initializeTimestamp() => dateTime = DateTime.now();

  bool _checkIfRefreshIsNeeded() =>
      dateTime.difference(DateTime.now()).inMinutes >= 30 ||
      context.read<AuthBloc>().state == const AuthState.visitedAppSettings();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.customerCodeInfo != current.customerCodeInfo &&
              current.customerCodeInfo != CustomerCodeInfo.empty(),
          listener: (context, state) => context.read<CustomerCodeBloc>().add(
                CustomerCodeEvent.fetchCustomerCodeConfig(
                  customerCodeInfo: state.customerCodeInfo,
                ),
              ),
        ),
        BlocListener<CustomerCodeBloc, CustomerCodeState>(
          listenWhen: (previous, current) =>
              previous.customerCodeConfig != current.customerCodeConfig ||
              previous.configFailureOrSuccessOption !=
                  current.configFailureOrSuccessOption,
          listener: (context, state) {
            state.configFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
            context.read<EligibilityBloc>().add(
                  EligibilityEvent.updatedCustomerCodeConfig(
                    customerCodeConfig: state.customerCodeConfig,
                  ),
                );
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            state.mapOrNull(
              authenticated: (authState) {
                context.read<UserBloc>().add(const UserEvent.fetch());

                context.router.replaceAll(
                  const [
                    SplashPageRoute(),
                    HomeNavigationTabbarRoute(),
                  ],
                );
              },
              unauthenticated: (unauthState) {
                _logout(context);

                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    const LoginPageRoute(),
                    if (context
                        .read<ResetPasswordBloc>()
                        .state
                        .resetPasswordCred
                        .isNotEmpty)
                      const ResetPasswordPageRoute(),
                  ],
                );
              },
              biometricDenied: (value) {
                _showBioMetricPermissionDialog();
              },
              visitedAppSettings: (value) => false,
            );
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.user.id != current.user.id && current.user.id.isNotEmpty,
          listener: (context, state) {
            context
                .setLocale(state.user.preferredLanguage.locale)
                .then((value) async {
              /* We need delay for a short time here before display message because when change locale
                       the system need time to re-load the new translation files, so if we create string
                       translate variables before reloaded, we won't use the lastest locale changed
                    */
              await Future.delayed(const Duration(milliseconds: 500));
              _welcomeUserMessage(state);
            });
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) => previous.user != current.user,
          listener: (context, state) {
            _initializeSalesOrg(state);
            if (state.isSalesRep) {
              context.read<SalesRepBloc>().add(
                    SalesRepEvent.fetch(
                      user: state.user,
                    ),
                  );
            }
            if (state.isNotEmpty) {
              context.setLocale(state.user.preferredLanguage.locale);
            }

            context.read<IntroBloc>().add(
                  const IntroEvent.checkAppFirstLaunch(),
                );
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.showMarketPlaceTnc != current.showMarketPlaceTnc,
          listener: (context, state) {
            final isLoginOnBehalf =
                context.read<UserBloc>().state.isLoginOnBehalf;
            if (state.showMarketPlaceTnc && !isLoginOnBehalf) {
              context.router.push(
                AupTCPageRoute(
                  user: state.user,
                  isMarketPlace: true,
                ),
              );
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) =>
              previous.showTermsAndConditionDialog !=
                  current.showTermsAndConditionDialog &&
              current.showTermsAndConditionDialog,
          listener: (context, state) {
            context.router.push(
              AupTCPageRoute(
                key: WidgetKeys.aupTcScreen,
                user: state.user,
                isMarketPlace: false,
              ),
            );
          },
        ),
        BlocListener<IntroBloc, IntroState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading && !current.isLoading,
          listener: (context, state) {
            final showTermsAndCondition =
                context.read<UserBloc>().state.showTermsAndConditionDialog;
            if (showTermsAndCondition || !state.isAppFirstLaunch) return;

            context.router.push(const IntroPageRoute());
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.isFetching != current.isFetching ||
              previous.isUpserting != current.isUpserting,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {
                if (!state.isUpserting &&
                    state.containsSampleBonus &&
                    !context
                        .read<EligibilityBloc>()
                        .state
                        .isBonusOverrideEnable) {
                  context.read<CartBloc>().add(
                        const CartEvent.removeSampleBonusFromCartConfig(),
                      );
                }
              },
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleCartApiFailure(context, failure);
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
                          .read<EligibilityBloc>()
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
                      user: context.read<UserBloc>().state.user,
                    ),
                  );
            }
          },
        ),
        BlocListener<ViewByItemsBloc, ViewByItemsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                if (!state.isFetching) {
                  _fetchProductImage(
                    context,
                    state.orderHistory.orderHistoryItems,
                  );
                }
              },
            ),
          ),
        ),
        BlocListener<ChatBotBloc, ChatBotState>(
          listenWhen: (previous, current) =>
              previous.chatbotFailureOrSuccessOption !=
              current.chatbotFailureOrSuccessOption,
          listener: (context, state) =>
              state.chatbotFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {},
            ),
          ),
        ),
        BlocListener<MaterialListBloc, MaterialListState>(
          listenWhen: (previous, current) =>
              previous.materialList != current.materialList,
          listener: (context, state) {
            if (state.materialList.isNotEmpty) {
              _fetchMaterialPrice(
                context,
                state.materialList,
              );
              _fetchMaterialListProductImage(state, context);
            }
          },
        ),
        BlocListener<ScanMaterialInfoBloc, ScanMaterialInfoState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  failure.maybeMap(
                    cameraPermissionFailed: (_) => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (_) => const CameraFilesPermission(
                        type: PermissionType.camera,
                      ),
                    ),
                    storagePermissionFailed: (_) => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      isDismissible: false,
                      builder: (_) => const CameraFilesPermission(
                        type: PermissionType.files,
                      ),
                    ),
                    orElse: () => ErrorUtils.handleApiFailure(context, failure),
                  );
                },
                (_) {
                  context.router.push(
                    ProductDetailsPageRoute(materialInfo: state.material),
                  );
                  context.read<MaterialPriceBloc>().add(
                        MaterialPriceEvent.fetch(
                          comboDealEligible: context
                              .read<EligibilityBloc>()
                              .state
                              .comboDealEligible,
                          materials: [state.material],
                        ),
                      );
                },
              ),
            );
          },
        ),
        BlocListener<ReturnListByItemBloc, ReturnListByItemState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {
                if (!state.isFetching) {
                  _fetchProductImage(
                    context,
                    state.returnItemList,
                  );
                }
              },
            ),
          ),
        ),
        BlocListener<ViewByItemDetailsBloc, ViewByItemDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.orderHistory.orderHistoryItems,
              ),
            ),
          ),
        ),
        BlocListener<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.orderHistoryDetails.orderHistoryDetailsOrderItem,
              ),
            ),
          ),
        ),
        BlocListener<CreditAndInvoiceDetailsBloc, CreditAndInvoiceDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) => _fetchProductImage(
                context,
                state.itemsInfo,
              ),
            ),
          ),
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              current != EligibilityState.initial() &&
              current.isRefreshed(previous),
          listener: (context, state) {
            final orderDocumentTypeState =
                context.read<OrderDocumentTypeBloc>().state;
            if (state.haveShipTo) {
              _initializeHomeTabDependencies(context, state);
              _initializeProduct();
              _initializeCart(state);
              _initializePaymentModule(state);

              context.read<EligibilityBloc>().add(
                    const EligibilityEvent.registerChatBot(),
                  );

              context.read<MaterialPriceBloc>().add(
                    MaterialPriceEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      salesConfigs: state.salesOrgConfigs,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                    ),
                  );

              context
                  .read<AboutUsBloc>()
                  .add(AboutUsEvent.initialize(salesOrg: state.salesOrg));

              context.read<CustomerLicenseBloc>().add(
                    CustomerLicenseEvent.initialized(
                      customerInfo: state.customerCodeInfo,
                      salesOrganization: state.salesOrganisation,
                      user: state.user,
                    ),
                  );

              context.read<ProductImageBloc>().add(
                    ProductImageEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<ViewByOrderFilterBloc>().add(
                    ViewByOrderFilterEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                    ),
                  );

              context.read<ViewByItemDetailsBloc>().add(
                    ViewByItemDetailsEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      salesOrgConfig: state.salesOrgConfigs,
                      user: state.user,
                      shipToInfo: state.shipToInfo,
                    ),
                  );

              context.read<ReturnListByRequestBloc>().add(
                    ReturnListByRequestEvent.initialized(
                      salesOrg: state.salesOrganisation.salesOrg,
                      shipInfo: state.shipToInfo,
                      user: state.user,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<DownloadPaymentAttachmentsBloc>().add(
                    DownloadPaymentAttachmentEvent.initialized(
                      salesOrganization: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context
                  .read<PaymentCustomerInformationBloc>()
                  .add(const PaymentCustomerInformationEvent.initialized());

              context.read<PaymentCustomerInformationBloc>().add(
                    PaymentCustomerInformationEvent.fetch(
                      customeCodeInfo: state.customerCodeInfo,
                      salesOrganisation: state.salesOrganisation,
                      selectedShipToCode: state.shipToInfo.shipToCustomerCode,
                    ),
                  );

              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.initialized(
                      config: state.salesOrgConfigs,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<PoAttachmentBloc>().add(
                    const PoAttachmentEvent.initialized(),
                  );

              context.read<ComboDealMaterialDetailBloc>().add(
                    ComboDealMaterialDetailEvent.initialize(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      salesConfigs:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                      user: state.user,
                    ),
                  );

              context.read<OrderSummaryBloc>().add(
                    OrderSummaryEvent.initialized(
                      shipToInfo: state.shipToInfo,
                      user: state.user,
                      orderDocumentType:
                          orderDocumentTypeState.selectedOrderType,
                      customerCodeInfo: state.customerCodeInfo,
                      salesOrganisation: state.salesOrganisation,
                      salesOrgConfig: state.salesOrgConfigs,
                    ),
                  );

              context.read<ProductSearchBloc>().add(
                    ProductSearchEvent.initialized(
                      configs: state.salesOrgConfigs,
                      salesOrganization: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      user: state.user,
                    ),
                  );
              if (context.read<EligibilityBloc>().state.isReturnsEnable) {
                context.read<ReturnListByItemBloc>().add(
                      ReturnListByItemEvent.initialized(
                        salesOrg: state.salesOrganisation.salesOrg,
                        shipInfo: state.shipToInfo,
                        user: state.user,
                        customerCodeInfo: state.customerCodeInfo,
                      ),
                    );
              }
              context.read<AvailableCreditsBloc>().add(
                    AvailableCreditsEvent.initialized(
                      salesOrganization: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<ReturnListByRequestBloc>().add(
                    ReturnListByRequestEvent.initialized(
                      salesOrg: state.salesOrganisation.salesOrg,
                      shipInfo: state.shipToInfo,
                      user: state.user,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<OutstandingInvoicesBloc>().add(
                    OutstandingInvoicesEvent.initialized(
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              context.read<ReturnItemsBloc>().add(
                    ReturnItemsEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      user: state.user,
                    ),
                  );

              if (state.user.userCanAccessOrderHistory) {
                context.read<ViewByItemsBloc>().add(
                      ViewByItemsEvent.initialized(
                        customerCodeInfo: state.customerCodeInfo,
                        salesOrgConfigs: state.salesOrgConfigs,
                        shipToInfo: state.shipToInfo,
                        user: state.user,
                        salesOrganisation: state.salesOrganisation,
                      ),
                    );

                context.read<ViewByOrderBloc>().add(
                      ViewByOrderEvent.initialized(
                        salesOrganisation: state.salesOrganisation,
                        customerCodeInfo: state.customerCodeInfo,
                        salesOrgConfigs: state.salesOrgConfigs,
                        user: state.user,
                        sortDirection: 'desc',
                        shipToInfo: state.shipToInfo,
                      ),
                    );

                context.read<ViewByOrderDetailsBloc>().add(
                      ViewByOrderDetailsEvent.initialized(
                        customerCodeInfo: state.customerCodeInfo,
                        user: context.read<UserBloc>().state.user,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        shipToInfo: state.shipToInfo,
                        configs: context.read<SalesOrgBloc>().state.configs,
                      ),
                    );
              }

              context.read<ReOrderPermissionBloc>().add(
                    ReOrderPermissionEvent.initialized(
                      customerCodeInfo: state.customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      salesOrganisation: state.salesOrganisation,
                      salesOrganisationConfigs: state.salesOrgConfigs,
                      user: state.user,
                    ),
                  );

              context.read<ArticlesInfoBloc>().add(
                    ArticlesInfoEvent.initialize(
                      user: state.user,
                      salesOrg: state.salesOrg,
                      shipToInfo: state.shipToInfo,
                    ),
                  );
              context.read<ArticlesInfoFilterBloc>().add(
                    ArticlesInfoFilterEvent.fetchCategory(
                      salesOrg: state.salesOrg,
                    ),
                  );
              context.read<AnnouncementFilterBloc>().add(
                    AnnouncementFilterEvent.fetchCategory(
                      salesOrg: state.salesOrg,
                    ),
                  );

              context.read<AnnouncementInfoBloc>().add(
                    AnnouncementInfoEvent.initialize(
                      user: state.user,
                      salesOrg: state.salesOrg,
                    ),
                  );
              context.read<ScanMaterialInfoBloc>().add(
                    ScanMaterialInfoEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                      user: state.user,
                      shipToInfo: state.shipToInfo,
                      salesOrgConfigs: state.salesOrgConfigs,
                    ),
                  );

              context.read<CreditAndInvoiceDetailsBloc>().add(
                    CreditAndInvoiceDetailsEvent.initialized(
                      salesOrganisation: state.salesOrganisation,
                      customerCodeInfo: state.customerCodeInfo,
                    ),
                  );

              final enableReturn = state.isReturnsEnable;

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
            }
            /**
             * TODO: Need to revisit when special order type will be implemented also we removed the isOrderTypeEnable dependency
             */

            // if (state.isOrderTypeEnable) {
            //   context.read<OrderDocumentTypeBloc>().add(
            //         OrderDocumentTypeEvent.fetch(
            //           salesOrganisation: state.salesOrganisation,
            //           isEDI: state.customerCodeInfo.status.isEDI,
            //         ),
            //       );
            // } else {
            //   context
            //       .read<OrderDocumentTypeBloc>()
            //       .add(const OrderDocumentTypeEvent.initialized());
            //   context.read<OrderDocumentTypeBloc>().add(
            //         OrderDocumentTypeEvent.selectedOrderType(
            //           isReasonSelected: false,
            //           selectedOrderType: OrderDocumentType.defaultSelected(
            //             salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
            //           ),
            //         ),
            //       );
            // }
          },
        ),
        BlocListener<DeepLinkingBloc, DeepLinkingState>(
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;
            final noAccessSnackbar = CustomSnackBar(
              icon: const Icon(Icons.info, color: ZPColors.error),
              backgroundColor: ZPColors.errorSnackBarColor,
              messageText: context.tr("You don't have access"),
            );

            state.when(
              initial: () {},
              linkPending: (_, __) {
                if (!locator<Upgrader>().blocked()) {
                  context.read<DeepLinkingBloc>().add(
                        DeepLinkingEvent.consumePendingLink(
                          selectedCustomerCode:
                              eligibilityState.customerCodeInfo,
                          selectedShipTo: eligibilityState.shipToInfo,
                        ),
                      );
                }
              },
              redirectProductDetail: (materialNumber, banner) {
                if (eligibilityState.user.userCanAccessProducts) {
                  final materialInfo = MaterialInfo.empty().copyWith(
                    materialNumber: materialNumber,
                    type: MaterialInfoType.material(),
                  );
                  if (eligibilityState.isZDP5eligible) {
                    context.read<MaterialPriceBloc>().add(
                          MaterialPriceEvent.fetchPriceForZDP5Materials(
                            materialInfo: materialInfo,
                          ),
                        );
                  }
                  context.read<MaterialPriceBloc>().add(
                        MaterialPriceEvent.fetch(
                          comboDealEligible: eligibilityState.comboDealEligible,
                          materials: [materialInfo],
                        ),
                      );

                  context.router.push(
                    ProductDetailsPageRoute(
                      materialInfo: materialInfo,
                      banner: banner,
                    ),
                  );
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectBundleDetail: (materialNumber, banner) {
                if (eligibilityState.user.userCanAccessProducts &&
                    !eligibilityState.salesOrgConfigs.disableBundles) {
                  context.router.push(
                    BundleDetailPageRoute(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: materialNumber,
                        type: MaterialInfoType.bundle(),
                      ),
                      banner: banner,
                    ),
                  );
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectProductSuggestion: (searchKey) {
                if (eligibilityState.user.userCanAccessProducts) {
                  context.read<ProductSearchBloc>().add(
                        ProductSearchEvent.searchProduct(
                          searchKey: searchKey,
                          materialFilter: context
                              .read<MaterialFilterBloc>()
                              .state
                              .materialFilter,
                        ),
                      );
                  context.router.push(
                    ProductSuggestionPageRoute(
                      parentRoute: context.router.current.path,
                    ),
                  );
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectOrderDetail: (orderNumber) {
                if (eligibilityState.user.userCanAccessOrderHistory) {
                  context.read<ViewByOrderDetailsBloc>().add(
                        ViewByOrderDetailsEvent.fetch(orderNumber: orderNumber),
                      );

                  context.router.push(const ViewByOrderDetailsPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectReturnDetail: (returnId) {
                if (eligibilityState.isReturnsEnable) {
                  context.read<ReturnSummaryDetailsBloc>().add(
                        ReturnSummaryDetailsEvent.fetch(returnId: returnId),
                      );
                  context.router
                      .push(const ReturnRequestSummaryByItemDetailsRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectPaymentDetail: (paymentIdentifierInfo, isMarketPlace) {
                if (eligibilityState.isPaymentEnabled) {
                  context.read<PaymentSummaryDetailsBloc>().add(
                        PaymentSummaryDetailsEvent
                            .fetchPaymentSummaryDetailsInfo(
                          details: paymentIdentifierInfo,
                          isMarketPlace: isMarketPlace,
                        ),
                      );
                  context.router.push(
                    PaymentSummaryDetailsPageRoute(
                      isMarketPlace: isMarketPlace,
                    ),
                  );
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectZPPaymentHome: () {
                if (eligibilityState.isPaymentEnabled) {
                  context.router.push(PaymentPageRoute(isMarketPlace: false));
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectMPPaymentHome: () {
                if (eligibilityState.isPaymentEnabled &&
                    eligibilityState.marketPlacePaymentEligible) {
                  context.router.push(PaymentPageRoute(isMarketPlace: true));
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectInvoiceDetail: (invoiceNumber, isMarketPlace) {
                if (eligibilityState.isPaymentEnabled) {
                  context.read<CreditAndInvoiceDetailsBloc>().add(
                        CreditAndInvoiceDetailsEvent.fetchInvoiceById(
                          invoiceId: invoiceNumber,
                          isMarketPlace: isMarketPlace,
                        ),
                      );
                  context.router.push(
                    InvoiceDetailsPageRoute(isMarketPlace: isMarketPlace),
                  );
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectFAQ: () {
                context.router.push(const FAQPageRoute());
              },
              redirectContactUs: (market) {
                context.router.push(ContactUsPageRoute(appMarket: market));
              },
              redirectAboutUs: () {
                context.router.push(const AboutUsPageRoute());
              },
              redirectUserGuide: () {
                context.navigateTo(
                  PdfViewPageRoute(
                    url: locator<Config>().getUserGuidePdfUrl(
                      eligibilityState.salesOrg.country.toLowerCase(),
                    ),
                    titleText: 'User guide',
                  ),
                );
              },
              error: (error) {
                ErrorUtils.handleApiFailure(context, error);
              },
              redirectResetPassword: (ResetPasswordCred resetPasswordCred) {
                context.read<ResetPasswordBloc>().add(
                      ResetPasswordEvent.initialize(
                        resetPasswordCred: resetPasswordCred,
                        user: resetPasswordCred.toUser,
                      ),
                    );
                if (context
                    .read<SalesOrgBloc>()
                    .state
                    .haveSelectedSalesOrganisation) {
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                } else {
                  context.router.push(const ResetPasswordPageRoute());
                }
              },
            );
          },
        ),
        BlocListener<SalesOrgBloc, SalesOrgState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          listener: (context, state) {
            state.salesOrgFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                  _initBlocs(context);
                },
                (_) {},
              ),
            );
            if (!state.isLoading) {
              if (!state.haveSelectedSalesOrganisation) {
                _initBlocs(context);
              }
              if (state.haveSelectedSalesOrganisation &&
                  state.configs != SalesOrganisationConfigs.empty()) {
                final eligibilityState = context.read<EligibilityBloc>().state;
                context.read<EligibilityBloc>()
                  ..add(
                    EligibilityEvent.update(
                      salesOrganisation: state.salesOrganisation,
                      salesOrgConfigs: state.configs,
                      user: context.read<UserBloc>().state.user,
                      selectedOrderType: eligibilityState.selectedOrderType,
                    ),
                  )
                  ..add(
                    const EligibilityEvent.loadStoredCustomerCode(),
                  );
                context.read<CustomerCodeBloc>()
                  ..add(
                    CustomerCodeEvent.initialized(
                      userInfo: context.read<UserBloc>().state.user,
                      selectedSalesOrg: state.salesOrganisation,
                      hideCustomer: state.configs.hideCustomer,
                    ),
                  )
                  ..add(
                    const CustomerCodeEvent.fetch(),
                  );
                context.read<CustomerCodeBloc>().add(
                      CustomerCodeEvent.fetchCustomerCodeConfig(
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                      ),
                    );
                // context.read<HomePageBloc>().add(const HomePageEvent.refresh());
              }
            }
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              previous.isLoadingCustomerCode != current.isLoadingCustomerCode &&
              !current.isLoadingCustomerCode,
          listener: (context, state) {
            final appFirstLaunch =
                context.read<IntroBloc>().state.isAppFirstLaunch ||
                    context.read<UserBloc>().state.showTermsAndConditionDialog;

            final mandatoryShipTo = !state.preSelectShipTo && !appFirstLaunch;

            if (mandatoryShipTo) {
              context.router.push(const CustomerSearchPageRoute());
            }
          },
        ),
        BlocListener<OrderDocumentTypeBloc, OrderDocumentTypeState>(
          listenWhen: (previous, current) =>
              context.read<UserBloc>().state.isNotEmpty &&
              context.read<UserBloc>().state.user.userCanCreateOrder &&
              previous.selectedOrderType != current.selectedOrderType &&
              current.selectedOrderType != OrderDocumentType.empty() &&
              context.read<SalesOrgBloc>().state.salesOrganisation !=
                  SalesOrganisation.empty(),
          listener: (context, state) {
            final eligibilityBloc = context.read<EligibilityBloc>();
            context.read<MaterialFilterBloc>().add(
                  MaterialFilterEvent.fetch(
                    user: context.read<UserBloc>().state.user,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                    shipToInfo: eligibilityBloc.state.shipToInfo,
                    hasAccessToCovidMaterial:
                        eligibilityBloc.state.canOrderCovidMaterial,
                  ),
                );
            eligibilityBloc.add(
              EligibilityEvent.update(
                user: context.read<UserBloc>().state.user,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                selectedOrderType: state.selectedOrderType,
              ),
            );
            context.read<MaterialListBloc>().add(
                  MaterialListEvent.initialized(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                    shipToInfo: eligibilityBloc.state.shipToInfo,
                    selectedMaterialFilter:
                        context.read<MaterialFilterBloc>().state.materialFilter,
                    user: context.read<UserBloc>().state.user,
                  ),
                );
          },
        ),
      ],
      child: const _Splash(),
    );
  }

  void _fetchMaterialPrice(BuildContext context, List<MaterialInfo> list) =>
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetch(
              comboDealEligible:
                  context.read<EligibilityBloc>().state.comboDealEligible,
              materials: list,
            ),
          );

  void _fetchProductImage(BuildContext context, List list) =>
      context.read<ProductImageBloc>().add(
            ProductImageEvent.fetch(
              list: list,
            ),
          );

  void _fetchMaterialListProductImage(
    MaterialListState state,
    BuildContext context,
  ) {
    if (state.selectedMaterialFilter.bundleOffers) {
      for (final materialData in state.materialList) {
        _fetchProductImage(
          context,
          materialData.data,
        );
      }
    } else {
      _fetchProductImage(
        context,
        state.materialList,
      );
    }
  }

  // void _getAdminPoAttachment(EligibilityState eligibilityState) {
  //   if (!eligibilityState.user.accessRight.adminPOAttachment) return;
  //   final salesOrg = eligibilityState.salesOrganisation.salesOrg;
  //   final customerCodeInfo = eligibilityState.customerCodeInfo;

  //   context.read<AdminPoAttachmentFilterBloc>()
  //     ..add(AdminPoAttachmentFilterEvent.salesOrgChanged(salesOrg))
  //     ..add(AdminPoAttachmentFilterEvent.soldToChanged(customerCodeInfo));

  //   context.read<AdminPoAttachmentBloc>().add(
  //         AdminPoAttachmentEvent.fetch(
  //           adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
  //             salesOrg: salesOrg,
  //             soldTo: customerCodeInfo,
  //           ),
  //         ),
  //       );
  // }

  void _showBioMetricPermissionDialog() {
    CustomDialogs.confirmationDialog(
      context: context,
      title: 'Permission Required!',
      message:
          'App wants to access Face id/Biometric to secure account access for logged in user. Please go to app settings and enable it.',
      confirmText: 'Settings',
      cancelText: 'Logout',
      onAcceptPressed: () async {
        final visited = await openAppSettings();
        if (mounted && visited) {
          context.read<AuthBloc>().add(const AuthEvent.visitedAppSettings());
        }
      },
      onCancelPressed: () async =>
          context.read<AuthBloc>().add(const AuthEvent.logout()),
    );
  }

  void _welcomeUserMessage(UserState userState) {
    if (userState.user.username.isValid()) {
      final welcomeMessage =
          '${context.tr('Welcome back')}, ${userState.user.username.getOrCrash()}';
      final loginOnBehalfMessage =
          '${context.tr('Logged in on behalf of')} ${userState.user.username.getOrCrash()}.';
      final message =
          userState.isLoginOnBehalf ? loginOnBehalfMessage : welcomeMessage;
      context
          .read<SettingBloc>()
          .add(const SettingEvent.checkIfBiometricPossible());
      CustomSnackBar(
        messageText: message,
      ).show(context);
    }
  }

  void _initializeSalesOrg(UserState userState) {
    final salesOrgBloc = context.read<SalesOrgBloc>();
    if (userState.haveSalesOrganisation) {
      salesOrgBloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: userState.userSalesOrganisations,
        ),
      );
    } else {
      salesOrgBloc.add(const SalesOrgEvent.initialized());
    }
  }

  void _initializeProduct() {
    final eligibilityState = context.read<EligibilityBloc>().state;
    context.read<MaterialFilterBloc>().add(
          MaterialFilterEvent.fetch(
            user: context.read<UserBloc>().state.user,
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            hasAccessToCovidMaterial: eligibilityState.canOrderCovidMaterial,
          ),
        );
    context.read<MaterialListBloc>().add(
          MaterialListEvent.initialized(
            salesOrganisation: eligibilityState.salesOrganisation,
            configs: eligibilityState.salesOrgConfigs,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.materialFilter,
            user: eligibilityState.user,
          ),
        );

    context.read<ProductSearchBloc>().add(
          ProductSearchEvent.initialized(
            configs: eligibilityState.salesOrgConfigs,
            salesOrganization: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );
  }

  /// Use for all cart related initialized bloc event here
  void _initializeCart(EligibilityState eligibilityState) {
    context.read<CartBloc>().add(
          CartEvent.initialized(
            salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
            salesOrganisation: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
            shipToInfo: eligibilityState.shipToInfo,
            user: eligibilityState.user,
          ),
        );
    if (!eligibilityState.isCounterOfferVisible &&
        context.read<PriceOverrideBloc>().state.item.price != Price.empty()) {
      context.read<PriceOverrideBloc>().add(
            const PriceOverrideEvent.initialized(),
          );
    }
  }

  void _initializePaymentModule(EligibilityState state) {
    //============================================================
    //  Payment Home
    //
    //============================================================

    context.read<ZPAccountSummaryBloc>().add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: state.customerCodeInfo.customerCodeSoldTo,
            salesOrg: state.salesOrganisation.salesOrg,
          ),
        );

    context.read<ZPAccountSummaryBloc>().add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: state.customerCodeInfo.customerCodeSoldTo,
            salesOrg: state.salesOrganisation.salesOrg,
          ),
        );

    context.read<ZPPaymentInProgressBloc>().add(
          PaymentInProgressEvent.fetch(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );

    context.read<ZPSoaBloc>().add(
          SoaEvent.fetch(
            customerCodeInfo: state.customerCodeInfo,
            salesOrg: state.salesOrg,
          ),
        );

    //============================================================
    //  Account Summary
    //
    //============================================================

    context.read<ZPAllInvoicesBloc>()
      ..add(
        AllInvoicesEvent.initialized(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
        ),
      )
      ..add(
        AllInvoicesEvent.fetch(
          appliedFilter: AllInvoicesFilter.defaultFilter(),
        ),
      );

    context.read<ZPAllCreditsBloc>()
      ..add(
        AllCreditsEvent.initialized(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
        ),
      )
      ..add(
        AllCreditsEvent.fetch(
          appliedFilter: AllCreditsFilter.defaultFilter(),
        ),
      );

    context.read<ZPFullSummaryBloc>()
      ..add(
        FullSummaryEvent.initialized(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
        ),
      )
      ..add(
        FullSummaryEvent.fetch(
          appliedFilter: FullSummaryFilter.defaultFilter(),
        ),
      );

    //============================================================
    //  Payment Summary
    //
    //============================================================

    context.read<ZPPaymentSummaryBloc>()
      ..add(
        PaymentSummaryEvent.initialized(
          salesOrganization: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
        ),
      )
      ..add(
        PaymentSummaryEvent.fetch(
          appliedFilter:
              context.read<ZPPaymentSummaryBloc>().state.appliedFilter,
        ),
      );

    context.read<PaymentSummaryFilterBloc>().add(
          PaymentSummaryFilterEvent.initialized(
            salesOrg: state.salesOrg,
          ),
        );

    context.read<PaymentSummaryDetailsBloc>().add(
          PaymentSummaryDetailsEvent.initialized(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
            user: state.user,
            shipToInfo: state.shipToInfo,
          ),
        );

    if (state.marketPlacePaymentEligible) {
      //============================================================
      //  Payment Home
      //
      //============================================================

      context.read<MPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchInvoiceSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<MPAccountSummaryBloc>().add(
            AccountSummaryEvent.fetchCreditSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: state.salesOrganisation.salesOrg,
            ),
          );

      context.read<MPPaymentInProgressBloc>().add(
            PaymentInProgressEvent.fetch(
              salesOrganization: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<MPSoaBloc>().add(
            SoaEvent.fetch(
              customerCodeInfo: state.customerCodeInfo,
              salesOrg: state.salesOrg,
            ),
          );

      //============================================================
      //  Account Summary
      //
      //============================================================

      context.read<MPAllInvoicesBloc>()
        ..add(
          AllInvoicesEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        );

      context.read<MPAllCreditsBloc>()
        ..add(
          AllCreditsEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        );

      context.read<MPFullSummaryBloc>()
        ..add(
          FullSummaryEvent.initialized(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        );

      //============================================================
      //  Payment Summary
      //
      //============================================================

      context.read<MPPaymentSummaryBloc>()
        ..add(
          PaymentSummaryEvent.initialized(
            salesOrganization: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        )
        ..add(
          PaymentSummaryEvent.fetch(
            appliedFilter:
                context.read<MPPaymentSummaryBloc>().state.appliedFilter,
          ),
        );
    }
  }

  void _initBlocs(BuildContext context) {
    context
        .read<OrderDocumentTypeBloc>()
        .add(const OrderDocumentTypeEvent.initialized());
    context.read<CustomerCodeBloc>().add(
          CustomerCodeEvent.initialized(
            userInfo: context.read<UserBloc>().state.user,
            selectedSalesOrg:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            hideCustomer: context.read<SalesOrgBloc>().state.hideCustomer,
          ),
        );
  }

  void _initializeHomeTabDependencies(
    BuildContext context,
    EligibilityState eligibilityState,
  ) {
    context.read<MaterialFilterBloc>().add(
          const MaterialFilterEvent.resetFilter(),
        );

    context.read<MaterialListBloc>().add(
          const MaterialListEvent.updateSearchKey(
            searchKey: '',
          ),
        );

    context
        .read<ViewByItemFilterBloc>()
        .add(const ViewByItemFilterEvent.initialize());

    context.read<NotificationBloc>().add(
          const NotificationEvent.fetch(),
        );

    context.read<AnnouncementBloc>().add(
          AnnouncementEvent.getMaintenanceBanners(
            salesOrg: eligibilityState.salesOrg,
          ),
        );

    context.read<ResetPasswordBloc>().add(
          ResetPasswordEvent.initialize(
            resetPasswordCred: ResetPasswordCred.empty(),
            user: eligibilityState.user,
          ),
        );
  }

  void _logout(BuildContext context) {
    locator<MixpanelService>().onLogout();
    context.read<DeepLinkingBloc>().add(const DeepLinkingEvent.initialize());
    context.read<UserBloc>().add(const UserEvent.initialized());
    context.read<ChatBotBloc>().add(const ChatBotEvent.resetChatbot());
    context.read<EligibilityBloc>().add(const EligibilityEvent.initialized());
    context
        .read<AnnouncementBloc>()
        .add(const AnnouncementEvent.clearClosedTime());

    final appMarket = AppMarket(
      context.deviceLocale.countryCode?.toLowerCase() ??
          AppMarket.defaultMarket().getOrDefaultValue('kh'),
    ).defaultMarket;

    context.read<LoginFormBloc>().add(
          LoginFormEvent.loadLastSavedCred(appMarket),
        );

    // Check if the device's language code is supported
    if (context.supportedLocales
        .map((locale) => locale.languageCode)
        .contains(context.deviceLocale.languageCode)) {
      context.resetLocale();
    } else {
      context.setLocale(
        context.fallbackLocale ?? const Locale('en'),
      );
    }

    context.read<AnnouncementBloc>().add(
          const AnnouncementEvent.clearBannerId(),
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
