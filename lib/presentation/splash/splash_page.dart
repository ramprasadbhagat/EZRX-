import 'package:ezrxmobile/application/account/payment_configuration/bank_beneficiary/manage_bank_beneficiary_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/deduction_code/manage_deduction_code_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/sales_district/sales_district_bloc.dart';
import 'package:ezrxmobile/application/account/settings/setting_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
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
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/dialogs/custom_dialogs.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:permission_handler/permission_handler.dart';
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
import 'package:ezrxmobile/presentation/splash/upgrader_localization_message.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';

import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

import 'package:ezrxmobile/domain/order/entities/price.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';

import 'package:ezrxmobile/presentation/orders/create_order/camera_files_permission_bottomsheet.dart';

import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';

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
      dateTime.difference(DateTime.now()).inMinutes >= 30 ||
      context.read<AuthBloc>().state == const AuthState.visitedAppSettings();

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
                //TODO: Revisit to uncomment this after change the endpoint for Announcement API
                // context.read<AnnouncementBloc>().add(
                //       const AnnouncementEvent.getAnnouncement(),
                //     );
                context.read<UserBloc>().add(const UserEvent.fetch());

                context.read<IntroBloc>().add(
                      const IntroEvent.checkAppFirstLaunch(),
                    );

                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    const HomeNavigationTabbarRoute(),
                  ],
                );
              },
              unauthenticated: (unauthState) {
                locator<MixpanelService>().onLogout();
                // context.read<AnnouncementBloc>().add(
                //       const AnnouncementEvent.getAnnouncement(),
                //     );
                context
                    .read<DeepLinkingBloc>()
                    .add(const DeepLinkingEvent.stopConsumeLink());
                context.read<UserBloc>().add(const UserEvent.initialized());
                context
                    .read<ChatBotBloc>()
                    .add(const ChatBotEvent.resetChatbot());
                context
                    .read<EligibilityBloc>()
                    .add(const EligibilityEvent.initialized());

                context.read<LoginFormBloc>().add(
                      const LoginFormEvent.loadLastSavedCred(),
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

                context.router.replaceAll(
                  [
                    const SplashPageRoute(),
                    const LoginPageRoute(),
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
            final eligibilityState = context.read<EligibilityBloc>().state;
            context.read<EligibilityBloc>().add(
                  EligibilityEvent.update(
                    user: state.user,
                    salesOrganisation: eligibilityState.salesOrganisation,
                    salesOrgConfigs: eligibilityState.salesOrgConfigs,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    shipToInfo: eligibilityState.shipToInfo,
                    selectedOrderType: eligibilityState.selectedOrderType,
                  ),
                );
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
              context.setLocale(state.user.preferredLanguage.locale);
            }

            _initializePaymentConfiguration(state);
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
                  ErrorUtils.handleApiFailure(context, failure);
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
                  context.read<ProductDetailBloc>().add(
                        ProductDetailEvent.fetch(
                          materialInfo: state.material,
                        ),
                      );
                  context.router.pushNamed('orders/material_details');
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
        BlocListener<ProductDetailBloc, ProductDetailState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption ||
              previous.productDetailAggregate != current.productDetailAggregate,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {
                  _fetchProductImage(
                    context,
                    state.productDetailAggregate.allMaterial,
                  );
                  if (state.productDetailAggregate.similarProduct.isNotEmpty) {
                    _fetchMaterialPrice(
                      context,
                      state.productDetailAggregate.similarProduct,
                    );
                    _fetchProductImage(
                      context,
                      state.productDetailAggregate.similarProduct,
                    );
                  }
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
              // context.read<UserBloc>().state.userCanCreateOrder &&
              current != EligibilityState.initial() &&
              (previous.isCovidMaterialEnable !=
                      current.isCovidMaterialEnable ||
                  previous.salesOrgConfigs.disableBundles !=
                      current.salesOrgConfigs.disableBundles ||
                  previous.isOrderTypeEnable != current.isOrderTypeEnable ||
                  previous.customerCodeInfo != current.customerCodeInfo ||
                  previous.shipToInfo != current.shipToInfo),
          listener: (context, state) {
            _initializeProduct();
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
          },
        ),
        BlocListener<EligibilityBloc, EligibilityState>(
          listenWhen: (previous, current) =>
              (previous.shipToInfo != current.shipToInfo ||
                  previous.salesOrgConfigs != current.salesOrgConfigs) &&
              current != EligibilityState.initial(),
          listener: (context, state) {
            _getAdminPoAttachment(state);
            context.read<CartBloc>().add(
                  const CartEvent.fetchProductsAddedToCart(),
                );
            if (!state.isCounterOfferVisible &&
                context.read<PriceOverrideBloc>().state.item.price !=
                    Price.empty()) {
              context.read<PriceOverrideBloc>().add(
                    const PriceOverrideEvent.initialized(),
                  );
            }
            context.read<MaterialListBloc>().add(
                  MaterialListEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    selectedMaterialFilter: MaterialFilter.empty(),
                  ),
                );
          },
        ),
        BlocListener<DeepLinkingBloc, DeepLinkingState>(
          listener: (context, state) {
            final eligibilityState = context.read<EligibilityBloc>().state;
            final noAccessSnackbar = CustomSnackBar(
              icon: const Icon(Icons.info, color: ZPColors.error),
              backgroundColor: ZPColors.errorSnackBarColor,
              messageText: "You don't have access",
            );

            state.when(
              initial: () {},
              linkPending: (_) {
                context.read<DeepLinkingBloc>().add(
                      DeepLinkingEvent.consumePendingLink(
                        selectedCustomerCode: eligibilityState.customerCodeInfo,
                        selectedShipTo: eligibilityState.shipToInfo,
                      ),
                    );
              },
              redirectProductDetail: (materialNumber) {
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
                  context.read<ProductDetailBloc>().add(
                        ProductDetailEvent.fetch(
                          materialInfo: materialInfo,
                        ),
                      );

                  context.router.push(const ProductDetailsPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectBundleDetail: (materialNumber) {
                if (eligibilityState.user.userCanAccessProducts &&
                    !eligibilityState.salesOrgConfigs.disableBundles) {
                  context.read<ProductDetailBloc>().add(
                        ProductDetailEvent.fetch(
                          materialInfo: MaterialInfo.empty().copyWith(
                            materialNumber: materialNumber,
                            type: MaterialInfoType.bundle(),
                          ),
                        ),
                      );
                  context.router.push(const BundleDetailPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectOrderDetail: (orderNumber) {
                if (eligibilityState.user.userCanAccessOrderHistory) {
                  context.read<ViewByOrderDetailsBloc>().add(
                        ViewByOrderDetailsEvent.fetch(orderNumber: orderNumber),
                      );
                  context.read<ViewByItemDetailsBloc>().add(
                        ViewByItemDetailsEvent.searchOrderHistory(
                          searchKey: SearchKey(orderNumber.getValue()),
                        ),
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
              redirectPaymentDetail: (paymentIdentifierInfo) {
                if (eligibilityState.isPaymentEnabled) {
                  context.read<PaymentSummaryDetailsBloc>().add(
                        PaymentSummaryDetailsEvent
                            .fetchPaymentSummaryDetailsInfo(
                          details: paymentIdentifierInfo,
                        ),
                      );
                  context.router.push(const PaymentSummaryDetailsPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectPaymentHome: () {
                if (eligibilityState.isPaymentEnabled) {
                  context.router.push(const PaymentPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              redirectInvoiceDetail: (invoiceNumber) {
                if (eligibilityState.isPaymentEnabled) {
                  context.read<CreditAndInvoiceDetailsBloc>().add(
                        CreditAndInvoiceDetailsEvent.fetchInvoiceById(
                          invoiceId: invoiceNumber,
                        ),
                      );
                  context.router.push(const InvoiceDetailsPageRoute());
                } else {
                  noAccessSnackbar.show(context);
                }
              },
              error: (error) {
                ErrorUtils.handleApiFailure(context, error);
              },
            );
          },
        ),
        BlocListener<SalesOrgBloc, SalesOrgState>(
          listenWhen: (previous, current) =>
              previous.salesOrganisation != current.salesOrganisation ||
              previous.configs != current.configs ||
              previous.salesOrgFailureOrSuccessOption !=
                  current.salesOrgFailureOrSuccessOption ||
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
                context.read<EligibilityBloc>().add(
                      EligibilityEvent.update(
                        salesOrganisation: state.salesOrganisation,
                        salesOrgConfigs: state.configs,
                        user: eligibilityState.user,
                        customerCodeInfo: eligibilityState.customerCodeInfo,
                        shipToInfo: eligibilityState.shipToInfo,
                        selectedOrderType: eligibilityState.selectedOrderType,
                      ),
                    );
                context.read<CustomerCodeBloc>().add(
                      CustomerCodeEvent.initialized(
                        userInfo: context.read<UserBloc>().state.user,
                        selectedSalesOrg: state.salesOrganisation,
                        hideCustomer: state.configs.hideCustomer,
                      ),
                    );

                context.read<CustomerCodeBloc>().add(
                      const CustomerCodeEvent.loadStoredCustomerCode(),
                    );
                // context.read<HomePageBloc>().add(const HomePageEvent.refresh());
              }
            }
          },
        ),
        BlocListener<CustomerCodeBloc, CustomerCodeState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.shipToInfo != current.shipToInfo ||
              (previous.isFetching != current.isFetching &&
                  !current.isFetching &&
                  previous.customerCodeInfo.customerCodeSoldTo !=
                      current.customerCodeInfo.customerCodeSoldTo),
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
            _addDependentEvents(context, state);
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
                    hasAccessToCovidMaterial: context
                        .read<EligibilityBloc>()
                        .state
                        .isCovidMaterialEnable,
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
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    selectedMaterialFilter:
                        context.read<MaterialFilterBloc>().state.materialFilter,
                  ),
                );
          },
        ),
        BlocListener<AccountSummaryBloc, AccountSummaryState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (success) {},
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
                debugLogging: locator<Config>().appFlavor != Flavor.prod,
                minAppVersion: '1.0.0',
              ),
              child: const _Splash(),
            ),
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

  //ignore:long-method
  void _addDependentEvents(BuildContext context, CustomerCodeState state) {
    final salesOrgState = context.read<SalesOrgBloc>().state;
    final orderDocumentTypeState = context.read<OrderDocumentTypeBloc>().state;
    final user = context.read<UserBloc>().state.user;
    //need to initialize the eligibility bloc
    //so that when EligibilityBloc update event is call bloc listener will
    //execute CartBloc fetch event

    context.read<MaterialFilterBloc>().add(
          const MaterialFilterEvent.resetFilter(),
        );

    context.read<MaterialListBloc>().add(
          const MaterialListEvent.updateSearchKey(
            searchKey: '',
          ),
        );

    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.initialized(
            salesOrganisation: salesOrgState.salesOrganisation,
            salesConfigs: salesOrgState.configs,
            customerCodeInfo: state.customerCodeInfo,
            shipToInfo: state.shipToInfo,
          ),
        );

    context.read<AllInvoicesBloc>().add(
          AllInvoicesEvent.initialized(
            salesOrganisation: salesOrgState.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );

    context.read<AllCreditsBloc>().add(
          AllCreditsEvent.initialized(
            salesOrganisation: salesOrgState.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );
    context.read<FullSummaryBloc>().add(
          FullSummaryEvent.initialized(
            salesOrganisation: salesOrgState.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
          ),
        );

    context
        .read<ViewByItemFilterBloc>()
        .add(const ViewByItemFilterEvent.initialize());

    context.read<ViewByOrderFilterBloc>().add(
          ViewByOrderFilterEvent.initialized(
            salesOrganisation: salesOrgState.salesOrganisation,
          ),
        );

    context.read<AccountSummaryBloc>().add(
          const AccountSummaryEvent.initialize(),
        );
    /**
     * Need to add all the initialized event which have dependency in ship here
     * inside state.haveShipTo
     */
    if (state.haveShipTo) {
      context.read<ViewByItemDetailsBloc>().add(
            ViewByItemDetailsEvent.initialized(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              salesOrgConfig: salesOrgState.configs,
              user: user,
            ),
          );
      context.read<PaymentSummaryDetailsBloc>().add(
            PaymentSummaryDetailsEvent.initialized(
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              user: user,
              shipToInfo: state.shipToInfo,
            ),
          );

      context.read<ProductDetailBloc>().add(
            ProductDetailEvent.initialized(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              configs: salesOrgState.configs,
            ),
          );

      context.read<ProductSearchBloc>().add(
            ProductSearchEvent.initialized(
              configs: salesOrgState.configs,
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
            ),
          );

      context.read<ReturnListByRequestBloc>().add(
            ReturnListByRequestEvent.initialized(
              salesOrg: salesOrgState.salesOrganisation.salesOrg,
              shipInfo: state.shipToInfo,
              user: user,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<CartBloc>().add(
            CartEvent.initialized(
              salesOrganisationConfigs: salesOrgState.configs,
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              user: user,
            ),
          );

      context.read<EligibilityBloc>().add(
            EligibilityEvent.update(
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              salesOrganisation: salesOrgState.salesOrganisation,
              salesOrgConfigs: salesOrgState.configs,
              user: user,
              selectedOrderType: orderDocumentTypeState.selectedOrderType,
            ),
          );
      context.read<DownloadPaymentAttachmentsBloc>().add(
            DownloadPaymentAttachmentEvent.initialized(
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );
      context.read<NotificationBloc>().add(
            const NotificationEvent.fetch(),
          );
      
      context
          .read<PaymentCustomerInformationBloc>()
          .add(const PaymentCustomerInformationEvent.initialized());

      context.read<PaymentCustomerInformationBloc>().add(
            PaymentCustomerInformationEvent.fetch(
              customeCodeInfo: state.customerCodeInfo,
              salesOrganisation: salesOrgState.salesOrganisation,
              selectedShipToCode: state.shipToInfo.shipToCustomerCode,
            ),
          );

      context.read<PaymentSummaryBloc>().add(
            PaymentSummaryEvent.initialized(
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<PaymentSummaryBloc>().add(
            PaymentSummaryEvent.fetch(
              appliedFilter:
                  context.read<PaymentSummaryBloc>().state.appliedFilter,
              searchKey: SearchKey.searchFilter(''),
            ),
          );

      context.read<SoaBloc>().add(
            SoaEvent.fetch(
              customerCodeInfo: state.customerCodeInfo,
              salesOrg: salesOrgState.salesOrg,
            ),
          );

      context.read<AdditionalDetailsBloc>().add(
            AdditionalDetailsEvent.initialized(
              config: salesOrgState.configs,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<AllInvoicesBloc>().add(
            AllInvoicesEvent.fetch(
              appliedFilter: AllInvoicesFilter.empty(),
            ),
          );

      context.read<AllCreditsBloc>().add(
            AllCreditsEvent.fetch(
              appliedFilter: AllCreditsFilter.empty(),
            ),
          );

      context.read<FullSummaryBloc>().add(
            FullSummaryEvent.fetch(
              appliedFilter: FullSummaryFilter.empty(),
            ),
          );

      context.read<AccountSummaryBloc>().add(
            AccountSummaryEvent.fetchInvoiceSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrgState.salesOrganisation.salesOrg,
            ),
          );
      context.read<AccountSummaryBloc>().add(
            AccountSummaryEvent.fetchCreditSummary(
              custCode: state.customerCodeInfo.customerCodeSoldTo,
              salesOrg: salesOrgState.salesOrganisation.salesOrg,
            ),
          );
      context.read<PaymentInProgressBloc>().add(
            PaymentInProgressEvent.fetch(
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<ComboDealMaterialDetailBloc>().add(
            ComboDealMaterialDetailEvent.initialize(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              salesConfigs:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              user: user,
            ),
          );

      context.read<OrderSummaryBloc>().add(
            OrderSummaryEvent.initialized(
              shipToInfo: state.shipToInfo,
              user: user,
              orderDocumentType: orderDocumentTypeState.selectedOrderType,
              customerCodeInfo: state.customerCodeInfo,
              salesOrganisation: salesOrgState.salesOrganisation,
              salesOrg: salesOrgState.salesOrg,
              salesOrgConfig: salesOrgState.configs,
            ),
          );

      context.read<ProductSearchBloc>().add(
            ProductSearchEvent.initialized(
              configs: salesOrgState.configs,
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
            ),
          );
      if (context.read<EligibilityBloc>().state.isReturnsEnable) {
        context.read<ReturnListByItemBloc>().add(
              ReturnListByItemEvent.initialized(
                salesOrg: salesOrgState.salesOrganisation.salesOrg,
                shipInfo: state.shipToInfo,
                user: user,
                customerCodeInfo: state.customerCodeInfo,
              ),
            );
      }
      context.read<AvailableCreditsBloc>().add(
            AvailableCreditsEvent.initialized(
              salesOrganization: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<ReturnListByRequestBloc>().add(
            ReturnListByRequestEvent.initialized(
              salesOrg: salesOrgState.salesOrganisation.salesOrg,
              shipInfo: state.shipToInfo,
              user: user,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<OutstandingInvoicesBloc>().add(
            OutstandingInvoicesEvent.initialized(
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
            ),
          );

      context.read<ReturnItemsBloc>().add(
            ReturnItemsEvent.initialized(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              user: user,
            ),
          );

      if (user.userCanAccessOrderHistory) {
        context.read<ViewByItemsBloc>().add(
              ViewByItemsEvent.initialized(
                customerCodeInfo: state.customerCodeInfo,
                salesOrgConfigs: salesOrgState.configs,
                shipToInfo: state.shipToInfo,
                user: user,
                salesOrganisation: salesOrgState.salesOrganisation,
              ),
            );

        context.read<ViewByOrderBloc>().add(
              ViewByOrderEvent.initialized(
                salesOrganisation: salesOrgState.salesOrganisation,
                customerCodeInfo: state.customerCodeInfo,
                salesOrgConfigs: salesOrgState.configs,
                user: user,
                sortDirection: 'desc',
                shipToInfo: state.shipToInfo,
              ),
            );

        context.read<ViewByOrderDetailsBloc>().add(
              ViewByOrderDetailsEvent.initialized(
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                user: context.read<UserBloc>().state.user,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                shipToInfo: state.shipToInfo,
                configs: context.read<SalesOrgBloc>().state.configs,
              ),
            );
      }

      context.read<PaymentSummaryFilterBloc>().add(
            PaymentSummaryFilterEvent.initialized(
              salesOrg: salesOrgState.salesOrg,
            ),
          );

      context.read<ReOrderPermissionBloc>().add(
            ReOrderPermissionEvent.initialized(
              customerCodeInfo: state.customerCodeInfo,
              shipToInfo: state.shipToInfo,
              salesOrganisation: salesOrgState.salesOrganisation,
              salesOrganisationConfigs: salesOrgState.configs,
            ),
          );

      context.read<ArticlesInfoBloc>().add(
            ArticlesInfoEvent.initialize(
              user: user,
              salesOrg: salesOrgState.salesOrg,
              shipToInfo: state.shipToInfo,
            ),
          );

      context.read<AnnouncementInfoBloc>().add(
            AnnouncementInfoEvent.initialize(
              user: user,
              salesOrg: salesOrgState.salesOrg,
            ),
          );
      context.read<ScanMaterialInfoBloc>().add(
            ScanMaterialInfoEvent.initialized(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
              user: user,
              shipToInfo: state.shipToInfo,
              salesOrgConfigs: salesOrgState.configs,
            ),
          );

      context.read<CreditAndInvoiceDetailsBloc>().add(
            CreditAndInvoiceDetailsEvent.initialized(
              salesOrganisation: salesOrgState.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          );

      context.read<DeepLinkingBloc>().add(
            const DeepLinkingEvent.initialize(),
          );
    }
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

  void _getAdminPoAttachment(EligibilityState eligibilityState) {
    if (!eligibilityState.user.accessRight.adminPOAttachment) return;
    final salesOrg = eligibilityState.salesOrganisation.salesOrg;
    final customerCodeInfo = eligibilityState.customerCodeInfo;

    context.read<AdminPoAttachmentFilterBloc>()
      ..add(AdminPoAttachmentFilterEvent.salesOrgChanged(salesOrg))
      ..add(AdminPoAttachmentFilterEvent.soldToChanged(customerCodeInfo));

    context.read<AdminPoAttachmentBloc>().add(
          AdminPoAttachmentEvent.fetch(
            adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
              salesOrg: salesOrg,
              soldTo: customerCodeInfo,
            ),
          ),
        );
  }

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
        if (context.mounted && visited) {
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
          '${'Welcome back'.tr()}, ${userState.user.username.getOrCrash()}';
      final loginOnBehalfMessage =
          '${'Logged in on behalf of'.tr()} ${userState.user.username.getOrCrash()}.';
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

  void _initializePaymentConfiguration(UserState userState) {
    if (userState.user.role.type.isRootAdmin) {
      context.read<PaymentMethodsBloc>().add(
            const PaymentMethodsEvent.fetch(),
          );
      context.read<ManageBankBeneficiaryBloc>().add(
            const ManageBankBeneficiaryEvent.fetch(),
          );
      context.read<SalesDistrictBloc>().add(
            const SalesDistrictEvent.fetch(),
          );
      context.read<ManageDeductionCodeBloc>().add(
            const ManageDeductionCodeEvent.fetch(),
          );
      context.read<ManagePaymentAdviceFooterBloc>().add(
            const ManagePaymentAdviceFooterEvent.fetch(),
          );
    }
  }

  void _initializeProduct() {
    final eligibilityBloc = context.read<EligibilityBloc>();
    context.read<MaterialFilterBloc>().add(
          MaterialFilterEvent.fetch(
            user: context.read<UserBloc>().state.user,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            salesOrgConfig: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
            hasAccessToCovidMaterial:
                eligibilityBloc.state.isCovidMaterialEnable,
          ),
        );
    // context.read<MaterialFilterBloc>().add(
    //   const MaterialFilterEvent.resetFilter(),
    // );
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.materialFilter,
          ),
        );
  }

  void _initBlocs(BuildContext context) {
    //context.read<BannerBloc>().add(const BannerEvent.initialized());
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
